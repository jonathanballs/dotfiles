function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local function readLines(filename)
    local lines = {}
    if file_exists(filename) then
        for line in io.lines(filename) do
            table.insert(lines, line)
        end
    else
        lines = {
            "https://gist.github.com/jonathanballs/dd3e8f8ddd79225030b768602d21d7ef",
            "crossword.txt missing :("
        }
    end
    return lines
end

return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        local headerPadding = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }

        local scriptDir = vim.fn.stdpath("config")
        local filename = scriptDir .. "/crossword.txt"
        local lines = readLines(filename)

        dashboard.section.header = {
            type = "text",
            val = {
                [[  ██████   █████ █████   █████ █████ ██████   ██████ ]],
                [[ ░░██████ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████  ]],
                [[  ░███░███ ░███  ░███    ░███  ░███  ░███░█████░███  ]],
                [[  ░███░░███░███  ░███    ░███  ░███  ░███░░███ ░███  ]],
                [[  ░███ ░░██████  ░░███   ███   ░███  ░███ ░░░  ░███  ]],
                [[  ░███  ░░█████   ░░░█████░    ░███  ░███      ░███  ]],
                [[  █████  ░░█████    ░░███      █████ █████     █████ ]],
                [[ ░░░░░    ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░  ]],
                [[ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ]]
            },
            opts = {
                hl = "Type",
                position = "center"
            }
        }

        dashboard.section.buttons = {
            type = "group",
            val = {
                dashboard.button("n f", "  New File", ":ene <BAR> startinsert<CR>"),
                dashboard.button("f f", "  Find File", ":Telescope find_files<CR>"),
                dashboard.button("g c", "󰐱  " .. lines[2],
                    '<Cmd>call jobstart(["open", expand("' .. lines[1] .. '")], {"detach": v:true})<CR>'),
                -- dashboard.button("g c", "  14d Capitol out of sight (7)", ":Telescope marks<CR>"),
                -- dashboard.button("q q", "  Quit Nvim", ":qa<CR>")
            },
            opts = {
                spacing = 1,
                position = "center"
            }
        }

        dashboard.section.footer = {
            type = "text",
            val = "Hard work compounds.",
            opts = {
                hl = "Comment",
                position = "center"
            }
        }

        require("alpha").setup({
            layout = {
                { type = "padding", val = headerPadding },
                dashboard.section.header,
                { type = "padding", val = 3 },
                dashboard.section.buttons,
                { type = "padding", val = 3 },
                dashboard.section.footer
            },
            opts = {
                spacing = 1,
                margin = 3
            }
        })

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
