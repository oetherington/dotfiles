-- Register plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')
Plug 'leafgarland/typescript-vim'
Plug 'dag/vim-fish'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdcommenter'
Plug 'neovimhaskell/haskell-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'digitaltoad/vim-pug'
Plug 'chaoren/vim-wordmotion'
Plug 'ziglang/zig.vim'
Plug 'purescript-contrib/purescript-vim'
Plug 'othree/html5.vim'
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug 'rhysd/git-messenger.vim'
Plug 'phaazon/hop.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug 'adelarsq/vim-matchit'
vim.call'plug#end'

-- Helpers
function editLuaConfig()
	vim.cmd(string.format(':e %s/init.lua', vim.fn.stdpath'config'))
end

function isMac()
	return vim.loop.os_uname().sysname == 'Darwin'
end

function map(mode, shortcut, command)
	vim.keymap.set(mode, shortcut, command, {
		noremap = true,
		silent = true,
	})
end

function nmap(shortcut, command)
	map('n', shortcut, command)
end

function imap(shortcut, command)
	map('i', shortcut, command)
end

function bindCmd(command)
	return function()
		vim.cmd(command)
	end
end

function codeMode()
	vim.bo.textwidth = 0
	vim.bo.wrapmargin = 0
	vim.wo.spell = false
	vim.bo.formatoptions = 'tcqj'
end

function textMode()
	vim.bo.textwidth = 80
	vim.bo.wrapmargin = 80
	vim.wo.spell = true
	vim.bo.formatoptions = 'want'
end

function applySyntax(patterns, syntax)
	vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
		pattern = patterns,
		command = string.format('set filetype=%s', syntax),
	})
end

-- Shell settings
if isMac() then
	vim.opt.shell = '/opt/homebrew/bin/fish'
else
	vim.opt.shell = '/bin/fish'
end

-- General settings
vim.opt.foldenable = false
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.relativenumber = false
vim.opt.number = false
vim.opt.autoindent = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.hidden = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autowrite = false
vim.opt.title = true
vim.opt.wrap = true
vim.opt.errorbells = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.autochdir = true
vim.opt.ttyfast = true
vim.opt.spelllang = 'en_gb'
vim.opt.encoding = 'utf8'
vim.opt.ffs = 'unix,dos,mac'
vim.opt.updatetime = 300
vim.opt.laststatus = 2
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.scrolloff = 4
vim.opt.modeline = true
vim.opt.modelines = 3
vim.opt.showtabline = 1
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.tabpagemax = 50
vim.opt.pastetoggle = '<F2>'
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.opt.wildignore = '*.swp,*.bak,*.pyc,*.class,*.o,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store'

-- Tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Mouse settings
vim.opt.mouse = 'a'
vim.opt.mousehide = false
vim.opt.mousemodel = 'popup'

-- Clipboard settings
if isMac() then
	vim.opt.clipboard = 'unnamed'
else
	vim.opt.clipboard = 'unnamedplus'
end

-- Highlighting
vim.cmd[[
	filetype on
	filetype plugin indent on
	syntax enable
	set grepprg=grep\ -nH\ $*
	let &colorcolumn="80,100"
	highlight ColorColumn ctermbg=235 guibg=#2c2d27
	highlight NormalFloat ctermbg=16 guibg=#000000
]]

-- List chars
vim.opt.list = true
vim.opt.listchars = { tab = 'ʾ ', trail = '•', extends = '⟩', precedes = '⟨' }
vim.cmd'highlight Whitespace ctermfg=DarkGrey'

-- Haskell settings
vim.g.haskell_enable_quantification = 1
vim.g.haskell_enable_recursivedo = 1
vim.g.haskell_enable_arrowsyntax = 1
vim.g.haskell_enable_pattern_synonyms = 1
vim.g.haskell_enable_typeroles = 1
vim.g.haskell_enable_static_pointers = 1
vim.g.haskell_indent_if = 3
vim.g.haskell_indent_case = 2
vim.g.haskell_indent_let = 4
vim.g.haskell_indent_where = 6
vim.g.haskell_indent_do = 3
vim.g.haskell_indent_in = 1
vim.g.cabal_indent_section = 2

-- Zig
vim.g.zig_fmt_autosave = 1

-- HTML indenting
vim.g.html_indent_script1 = 'inc'
vim.g.html_indent_style1 = 'inc'

-- Nerd commenter settings
vim.g.NERDSpaceDelims = 1
vim.g.NERDCustomDelimiters = {
	h = { left = '/*', right = '*/', leftAlt = '//' },
}

-- Leader bindings
vim.g.mapleader = ','
nmap('<leader>e', editLuaConfig) -- Edit this config
nmap('<leader>a', bindCmd':%y+') -- Copy all
nmap('<leader>s', bindCmd':so %') -- Source current file
nmap('<leader>m', bindCmd':!clear && make -j5') -- Make
nmap('<leader>n', bindCmd':!clear && make -j5 run')
nmap('<leader>x', bindCmd':!clear && make -j5 clean')
nmap('<leader>t', bindCmd':!clear && make -j5 test')
nmap('<leader>b', bindCmd':GitMessenger') -- Git blame
nmap('<leader>i', bindCmd':setl noai nocin nosi inde=') -- Disable indent
nmap('<leader>z', 'z=') -- Spelling suggestion
nmap('<leader>j', function() -- JSON formatting
	vim.cmd'%!python -m json.tool'
	vim.bo.filetype = 'json'
end)

-- Change the wrap and spell mode
nmap('<leader>wmc', codeMode)
nmap('<leader>wmt', textMode)
-- Wrap selection
-- nmap('<leader>r', 'g{jV}kJvgq')
nmap('<leader>r', 'vgq')

-- Other key bindings
vim.cmd [[
	nnoremap tt :tabnew<CR>:terminal<CR>jA
	vnoremap <tab> %
	cmap w!! w !sudo tee % >/dev/null
]]
imap('jj', '<esc>');
nmap(';', ':');
nmap('\\', ':noh<cr>');

-- Navigation
nmap('<Up>', '<Nop>')
nmap('<Down>', '<Nop>')
nmap('<Left>', '<Nop>')
nmap('<Right>', '<Nop>')
nmap('j', 'gj')
nmap('k', 'gk')

-- Tab navigation
nmap('<C-a>', bindCmd':tabprevious')
nmap('<C-z>', bindCmd':tabnext')
nmap('<C-t>', bindCmd':tabnew')
vim.cmd'inoremap <C-a> <Esc>:tabprevious<CR>i'
vim.cmd'inoremap <C-z> <Esc>:tabnext<CR>i'
imap('<C-t>', bindCmd':tabnew')

-- Split navigation
nmap('<C-J>', '<C-W><C-J>')
nmap('<C-K>', '<C-W><C-K>')
nmap('<C-L>', '<C-W><C-L>')
nmap('<C-H>', '<C-W><C-H>')
nmap('<leader>v', ':vsplit<cr>')
nmap('<leader>h', ':split<cr>')

-- Telescope config
local telescope = require'telescope.builtin'
nmap('<leader><leader>', telescope.git_files)

-- Hop config
local hop = require'hop'
hop.setup()
nmap('<C-g>', function() hop.hint_words({ multi_window = true }) end)

-- CoC config
vim.cmd [[
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	nmap <leader> f  <Plug>(coc-fix-current)
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	hi CocErrorFloat ctermbg=12
]]

-- codeMode settings
codeMode()

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = { '*.wiki', '*.txt' },
	callback = textMode,
})

-- Custom syntax and indentation settings
applySyntax({ '*.h', '*.kisl' }, 'c')
applySyntax({ '*.conf', '*.chrd' }, 'conf')
applySyntax({ '*.arc' }, 'lisp')
applySyntax({ '*.nut' }, 'java') -- Close enough
applySyntax({ '*.frag', '*.vert', '*.fp', '*.vp', '*.glsl' }, 'glsl')
applySyntax({ '*.chs' }, 'haskell')
applySyntax({ '*.ll' }, 'llvm')
applySyntax({ '*.hy' }, 'hydra')
applySyntax({ '*.sb' }, 'subscript')
applySyntax({ '*.S.h' }, 'asm')
applySyntax({ '*.tex', '*.sil' }, 'tex') -- Avoid plaintex
applySyntax({ 'SConstruct', 'SConscript' }, 'python')
applySyntax({ '*.ts', '*.tsx' }, 'typescript')
applySyntax({ '*.inc' }, 'cpp')
applySyntax({ 'Tupdefault' }, 'tup')

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = { '*.css', '*.sass', '*.scss' },
	command = 'setlocal sw=4 ts=4 noexpandtab',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = { 'gitcommit' },
	command = 'setlocal spell',
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	pattern = { '*' },
	command = 'syntax sync fromstart',
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'c' },
	command = 'setlocal tabstop=8 shiftwidth=8 softtabstop=8',
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'lisp', 'scheme', 'haskell', 'purescript' },
	command = 'setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab',
})

-- Remove trailing whitespace on save
if not isMac() then
	vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
		pattern = { '*' },
		command = [[%s/\s\+$//e]],
	})
end

-- Misc
vim.cmd [[
	" Bool toggle
	function! BoolToggle()
		let thisword = expand("<cword>")
		if thisword ==# "true"
			execute "normal! viwo\<esc>dwifalse \<esc>b"
		elseif thisword ==# "false"
			execute "normal! viwo\<esc>dwitrue \<esc>b"
		elseif thisword ==# "TRUE"
			execute "normal! viwo\<esc>dwiFALSE \<esc>b"
		elseif thisword ==# "FALSE"
			execute "normal! viwo\<esc>dwiTRUE \<esc>b"
		elseif thisword ==# "True"
			execute "normal! viwo\<esc>dwiFalse \<esc>b"
		elseif thisword ==# "False"
			execute "normal! viwo\<esc>dwiTrue \<esc>b"
		endif
	endfunction

	nnoremap ^ :call BoolToggle()<CR>

	" Line number toggle
	function! NumberToggle()
		if(&relativenumber == 1)
			set norelativenumber
		else
			set relativenumber
		endif
	endfunc

	nnoremap <C-n> :call NumberToggle()<CR>
]]
