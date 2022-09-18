require('trouble').setup {
    position = "right", -- position of the list can be: bottom, top, left, right
    width = 100, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
}
