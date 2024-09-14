-- Vimars init.lua
-- Austin Bricker, 2017-2024

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {'alvan/vim-closetag'},
    {'akinsho/toggleterm.nvim', cond = not vim.g.vscode},
    {'chentoast/marks.nvim', cond = not vim.g.vscode},
    {'kyazdani42/nvim-tree.lua', cond = not vim.g.vscode, dependencies = {
        'kyazdani42/nvim-web-devicons',
    }},
    {'lukas-reineke/indent-blankline.nvim', cond = not vim.g.vscode},
    {'mbbill/undotree', cond = not vim.g.vscode},
    {'navarasu/onedark.nvim', cond = not vim.g.vscode},
    {'nvim-lualine/lualine.nvim', cond = not vim.g.vscode},
    {'nvim-telescope/telescope.nvim', cond = not vim.g.vscode, dependencies = {
        'nvim-lua/plenary.nvim',
    }},
    -- {'phaazon/hop.nvim'},
    {'aznhe21/hop.nvim', branch = 'fix-some-bugs'},
    {'romgrk/barbar.nvim', cond = not vim.g.vscode, dependencies = {
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim', -- gitsigns also used outside of barbar
    }},
    {'sheerun/vim-polyglot', cond = not vim.g.vscode},
    {'sindrets/diffview.nvim', cond = not vim.g.vscode},
    {'SmiteshP/nvim-navbuddy', cond = not vim.g.vscode, opts = {lsp = {auto_attach = true}}, dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
    }},
    {'tpope/vim-commentary'},
    {'tpope/vim-repeat'},
    {'tpope/vim-surround'},
    {'VonHeikemen/lsp-zero.nvim', cond = not vim.g.vscode, dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip'
    }},
    {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},
})

require("hop").setup()

if not vim.g.vscode then
    require("diffview").setup()
    require("gitsigns").setup()
    require("nvim-tree").setup()

    require("barbar").setup{
        insert_at_end = true,
        icons = {
            gitsigns = {
                added = {enabled = true, icon = '+'},
                changed = {enabled = true, icon = '~'},
                deleted = {enabled = true, icon = '-'},
            },
        }
    }

    require("bufferline").setup{
        auto_hide = true,
        insert_at_end = true,
    }

    local cmp = require('cmp')
    cmp.setup({
        sources = {
            { name = "nvim_lsp" },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({select = true}),
            ['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item()),
        }
    })

    local lsp = require("lsp-zero")
    local lsp_attach = function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
    end
    lsp.extend_lspconfig({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        lsp_attach = lsp_attach,
        float_border = "rounded",
        sign_text = true,
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
            lsp.default_setup,
        },
    })

    require("lualine").setup{
        options = {
            icons_enabled = true,
            section_separators = '',
            component_separators = '',
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch'},
            lualine_c = {'diff'},
            lualine_x = {'progress', 'location'},
            lualine_y = {'fileformat', 'encoding'},
            lualine_z = {'filetype', 'filename'},
        },
        tabline = {},
        extensions = {},
    }

    require("marks").setup()

    require('onedark').setup {
        style = 'darker'
    }
    require('onedark').load()

    require('telescope').setup({
        pickers = {
            find_files = {
                find_command = { "rg", "--files", "--no-ignore", "--glob", "!**/.git/*" },
            },
        }
    })

    require("toggleterm").setup{
        direction = 'float'
    }
end

local set = vim.opt
set.background = "dark"
set.backspace = "2"
set.breakindent = true
set.cursorline = true
set.conceallevel = 0
set.encoding = "utf-8"
set.expandtab = true
set.foldlevel = 99
set.foldmethod = "indent"
set.hidden = true
set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.lazyredraw = true
set.mouse = "a"
set.number = true
set.shiftwidth = 4
set.showcmd = true
set.showmatch = true
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.softtabstop = 4
set.startofline = false
set.tabstop = 4
set.timeout = false
set.wildmenu = true

vim.g.mapleader = ","

vim.cmd([[
syntax enable
filetype indent on
]])

-- Figure out how to limit this to Windows
-- if not vim.g.vscode then
--     vim.cmd([[
--     let &shell = '"C:\Program Files\Git\bin\bash.exe"'
--     let &shellcmdflag = '-s'
--     ]])
-- end

function map(mode, shortcut, cmd)
    vim.api.nvim_set_keymap(mode, shortcut, cmd, { noremap = true, silent = true })
end

function nnomap(shortcut, cmd)
    map('n', shortcut, cmd)
end

function inomap(shortcut, cmd)
    map('i', shortcut, cmd)
end

function vnomap(shortcut, cmd)
    map('v', shortcut, cmd)
end

function tnomap(shortcut, cmd)
    map('t', shortcut, cmd)
end

nnomap("<space>", "za")
nnomap("j", "gj")
nnomap("k", "gk")

nnomap("B", "^")
vnomap("B", "^")
nnomap("E", "$")
vnomap("E", "$")

nnomap("<tab>", "%")
vnomap("<tab>", "%")

if vim.g.vscode then
    -- gt/gT also performs this by default
    nnomap("[b", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    nnomap("]b", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
else
    inomap("jk", "<esc>")
    nnomap("gd", "<C-]>")
    nnomap("L", "L<bar>zz<CR>")
    vnomap("L", "L<bar>zz<CR>")
    nnomap("H", "H<bar>zz<CR>")
    vnomap("H", "H<bar>zz<CR>")
end

nnomap("<leader><space>", ":noh<CR>")

nnomap("Y", "y$")
vnomap("Y", "y$")

nnomap("[<space>", "O<esc>j")
nnomap("]<space>", "o<esc>k")

if vim.g.vscode then
    nnomap("[c", "<Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>")
    nnomap("]c", "<Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>")

    nnomap("[p", "<Cmd>call VSCodeNotify('editor.debug.action.goToPreviousBreakpoint')<CR>")
    nnomap("]p", "<Cmd>call VSCodeNotify('editor.debug.action.goToNextBreakpoint')<CR>")

    -- Requires the "Go to Next Error" extension
    nnomap("[e", "<Cmd>call VSCodeNotify('go-to-next-error.prev.warning')<CR>")
    nnomap("]e", "<Cmd>call VSCodeNotify('go-to-next-error.next.warning')<CR>")

    nnomap("gp", "<Cmd>call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>")
    nnomap("<leader>g", "<Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>")

    nnomap("<leader>t", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")

else
    nnomap("<leader>b", ":Gitsigns toggle_current_line_blame<CR>")
    nnomap("<leader>g", ":Gitsigns reset_hunk<CR>")

    -- Need to use barbar's buffer switching API
    nnomap("[b", "<Cmd>BufferPrevious<CR>")
    nnomap("]b", "<Cmd>BufferNext<CR>")

    nnomap("[e", ":lua vim.diagnostic.goto_prev()<CR>")
    nnomap("]e", ":lua vim.diagnostic.goto_next()<CR>")
    nnomap("<leader>e", ":Telescope diagnostics<CR>")

    nnomap("]c", ":Gitsigns next_hunk<CR>")
    nnomap("[c", ":Gitsigns prev_hunk<CR>")

    nnomap("<C-`>", ":ToggleTerm<CR>")
    tnomap("<C-`>", "<C-\\><C-N>:ToggleTerm<CR>")

    nnomap("<leader>t", ":NvimTreeToggle<CR>")

    nnomap("<C-f>",     ":Telescope live_grep<CR>")
    nnomap("<C-S-f>",   ":Telescope grep_string<CR>")
    nnomap("<C-p>",     ":Telescope find_files<CR>")
    nnomap("<C-S-p>",   ":BufferPick<CR>")
    nnomap("<C-n>",     ":Navbuddy<CR>")
    nnomap("<leader>d", ":lua DiffviewToggle()<CR>")
    nnomap("<leader>z", ":Telescope spell_suggest<CR>")
    nnomap("<leader>m", ":Telescope man_pages<CR>")
    nnomap("<leader>u", ":UndotreeToggle<CR>")
end

nnomap("<leader><leader>w", ":HopWordAC<CR>")
nnomap("<leader><leader>b", ":HopWordBC<CR>")
nnomap("<leader><leader>e", ":lua HopEndWord()<CR>")
nnomap("<leader><leader>f", ":HopChar1<CR>")
nnomap("<leader><leader>j", ":HopLineStartAC<CR>")
nnomap("<leader><leader>k", ":HopLineStartBC<CR>")
nnomap("<leader><leader>/", ":HopPattern<CR>")

vim.g.closetag_filetypes = 'html, php'

-- TODO: Figure out if this can be done with just Lua
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua require'vim.highlight'.on_yank({hlgroup="IncSearch", timeout=1000})
augroup END
]])

if not vim.g.vscode then
    -- Strip trailing whitespace
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*" },
        command = [[%s/\s\+$//e]],
    })

    -- Custom function to add toggle functionality to diffview.nvim
    local last_tabpage = vim.api.nvim_get_current_tabpage()
    function DiffviewToggle()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()
        if view then
            vim.cmd(":DiffviewClose")
        else
            vim.cmd(":DiffviewOpen")
        end
    end
end

-- Custom function to allow jumping to ends of words
function HopEndWord()
    local hop = require("hop")
    local hint = require("hop.hint")
    hop.hint_words({direction = hint.HintDirection.AFTER_CURSOR, hint_position = hint.HintPosition.END})
end

-- Set vim-commentary values
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "nim" },
    command = "setlocal commentstring=#\\ %s"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp" },
    command = "setlocal commentstring=//\\ %s"
})
