local ok, dap = pcall(require, 'dap')
if not ok then
    vim.notify('nvim-dap failed to load — Go debugging is disabled', vim.log.levels.ERROR)
    return
end

local dapui_ok, dapui = pcall(require, 'dapui')
if dapui_ok then
    dapui.setup({ expand_lines = false })
end

dap.adapters['go-remote'] = function(callback, config)
    callback({
        type = 'server',
        host = config.host or '127.0.0.1',
        port = config.port,
    })
end

if dapui_ok then
    dap.listeners.after.event_initialized.dapui = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui = function()
        dapui.close()
    end
end

dap.listeners.after.event_initialized.notify = function(session)
    vim.notify(
        'dap: attached · ' .. (session.config.name or 'session') .. '  (running — set a breakpoint and trigger the code)',
        vim.log.levels.INFO
    )
end
dap.listeners.after.event_stopped.notify = function(_, body)
    vim.notify('dap: stopped · ' .. (body and body.reason or 'breakpoint'), vim.log.levels.INFO)
end
dap.listeners.before.event_terminated.notify = function()
    vim.notify('dap: session ended', vim.log.levels.WARN)
end
dap.listeners.before.event_exited.notify = function()
    vim.notify('dap: debuggee exited', vim.log.levels.WARN)
end

vim.api.nvim_create_user_command('DapStatus', function()
    local s = dap.session()
    if not s then
        vim.notify('dap: no active session', vim.log.levels.WARN)
        return
    end

    local bps = 0
    local bp_ok, bp_mod = pcall(require, 'dap.breakpoints')
    if bp_ok then
        for _, list in pairs(bp_mod.get() or {}) do
            bps = bps + #list
        end
    end

    vim.notify(
        ('dap: connected · %s · %s · %d breakpoint(s)'):format(
            s.config.name or '?',
            s.stopped_thread_id and 'stopped' or 'running',
            bps
        ),
        vim.log.levels.INFO
    )
end, { desc = 'Show current dap session status' })

local projects_file = vim.fn.stdpath('config') .. '/dap-go-projects.json'

local remote_configs = {}

local function load_projects()
    local f = io.open(projects_file, 'r')
    if not f then
        return {}
    end

    local content = f:read('*a')
    f:close()

    if content == nil or vim.trim(content) == '' then
        return {}
    end

    local ok, decoded = pcall(vim.json.decode, content)
    if not ok or type(decoded) ~= 'table' then
        vim.notify(
            'dap-go-projects.json: invalid JSON (' .. tostring(decoded) .. ')',
            vim.log.levels.ERROR
        )
        return {}
    end

    return decoded
end

local function write_projects(projects)
    local f, err = io.open(projects_file, 'w')
    if not f then
        vim.notify(
            'dap-go-projects.json: cannot write (' .. tostring(err) .. ')',
            vim.log.levels.ERROR
        )
        return false
    end

    f:write(#projects == 0 and '[]' or vim.json.encode(projects))
    f:close()

    return true
end

local function build_configs()
    remote_configs = {}

    for _, p in ipairs(load_projects()) do
        table.insert(remote_configs, {
            type = 'go-remote',
            name = 'attach ' .. p.name,
            request = 'attach',
            mode = 'remote',
            host = p.host or '127.0.0.1',
            port = p.port,
            substitutePath = {
                {
                    from = p.local_path,
                    to = p.remote_path,
                },
            },
        })
    end

    dap.configurations.go = vim.deepcopy(remote_configs)
end

dap.listeners.after.event_terminated.dapgo_rebuild = build_configs
dap.listeners.after.event_exited.dapgo_rebuild = build_configs

local function strip_trailing_slash(path)
    return (path:gsub('/+$', ''))
end

local function add_project()
    vim.ui.input({ prompt = 'Project name: ' }, function(name)
        if not name or name == '' then
            return
        end

        vim.ui.input({ prompt = 'Local path: ', completion = 'dir' }, function(local_path)
            if not local_path or local_path == '' then
                return
            end

            vim.ui.input({ prompt = 'Remote path: ', default = '/go/build' }, function(remote_path)
                if not remote_path or remote_path == '' then
                    return
                end

                vim.ui.input({ prompt = 'Port: ', default = '2345' }, function(port)
                    if not port or port == '' then
                        return
                    end

                    local port_num = tonumber(port)
                    if not port_num then
                        vim.notify('dap-go: port must be a number', vim.log.levels.ERROR)
                        return
                    end

                    local abs_local = vim.fn.fnamemodify(vim.fn.expand(local_path), ':p')

                    local projects = load_projects()
                    table.insert(projects, {
                        name = name,
                        local_path = strip_trailing_slash(abs_local),
                        remote_path = strip_trailing_slash(remote_path),
                        port = port_num,
                    })

                    if write_projects(projects) then
                        build_configs()
                        vim.notify('dap-go: added project "' .. name .. '"')
                    end
                end)
            end)
        end)
    end)
end

local function go_debug()
    local items = {
        { label = 'go.nvim  debug package (main)', run = function() vim.cmd('GoDebug') end },
        { label = 'go.nvim  debug test', run = function() vim.cmd('GoDebug -t') end },
        { label = 'go.nvim  debug nearest test', run = function() vim.cmd('GoDebug -n') end },
        { label = 'go.nvim  debug package tests', run = function() vim.cmd('GoDebug -p') end },
        { label = 'go.nvim  attach local process', run = function() vim.cmd('GoDebug -a') end },
    }

    for _, cfg in ipairs(remote_configs) do
        table.insert(items, {
            label = 'remote   ' .. cfg.name,
            run = function()
                dap.run(vim.deepcopy(cfg))
                vim.defer_fn(function()
                    local s = dap.session()
                    if not s or not s.initialized then
                        vim.notify(
                            'dap: attach did not complete — is the service process alive?\n'
                                .. 'Delve keeps its port open even after the debuggee exits. Hit Restart on the service, then retry.',
                            vim.log.levels.ERROR
                        )
                    end
                end, 4000)
            end,
        })
    end

    vim.ui.select(items, {
        prompt = 'Go debug',
        format_item = function(item)
            return item.label
        end,
    }, function(item)
        if item then
            item.run()
        end
    end)
end

build_configs()

vim.api.nvim_create_user_command('DapGoReload', function()
    build_configs()
    vim.notify('dap-go: reloaded projects')
end, { desc = 'Rebuild Go dap configs from dap-go-projects.json' })

vim.api.nvim_create_user_command('DapGoAddProject', add_project, {
    desc = 'Add a Go remote-attach dap target and persist it',
})

vim.api.nvim_create_user_command('GoDebugPick', go_debug, {
    desc = 'Pick a go.nvim or remote-attach debug target',
})

local function in_session(fn)
    return function()
        if dap.session() then
            fn()
        else
            vim.notify('dap: no active session', vim.log.levels.WARN)
        end
    end
end

local function map(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { silent = true, desc = desc })
end

map(';dd', go_debug, 'Debug: pick target')
map(';db', dap.toggle_breakpoint, 'Debug: toggle breakpoint')
map(';dB', function()
    vim.ui.input({ prompt = 'Breakpoint condition: ' }, function(cond)
        if cond and cond ~= '' then
            dap.set_breakpoint(cond)
        end
    end)
end, 'Debug: conditional breakpoint')
map(';dc', dap.continue, 'Debug: continue / start')
map(';dn', in_session(dap.step_over), 'Debug: step over')
map(';di', in_session(dap.step_into), 'Debug: step into')
map(';do', in_session(dap.step_out), 'Debug: step out')
map(';dC', in_session(dap.run_to_cursor), 'Debug: run to cursor')
map(';dr', dap.repl.toggle, 'Debug: toggle REPL')
map(';dl', dap.run_last, 'Debug: run last')
map(';ds', '<Cmd>DapStatus<CR>', 'Debug: session status')
map(';dt', dap.terminate, 'Debug: terminate / detach')
map(';du', function()
    if dapui_ok then
        dapui.toggle()
    end
end, 'Debug: toggle UI')
map(';de', function()
    if dapui_ok then
        dapui.eval(nil, { enter = true })
    end
end, 'Debug: eval under cursor')
vim.keymap.set('v', ';de', function()
    if dapui_ok then
        dapui.eval()
    end
end, { silent = true, desc = 'Debug: eval selection' })

map('<F5>', dap.continue, 'Debug: continue')
map('<F10>', in_session(dap.step_over), 'Debug: step over')
map('<F11>', in_session(dap.step_into), 'Debug: step into')
map('<F12>', in_session(dap.step_out), 'Debug: step out')
