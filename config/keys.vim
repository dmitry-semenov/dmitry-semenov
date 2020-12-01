" Tabs
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

" Open file structure
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Smart code
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>" " forward
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" " back

" Smart search
nmap <Leader>fc :Ag<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fg :GitFiles<CR>
nmap <Leader>fG :GitFiles?<CR>
nmap <Leader>fb :Buffers<CR>
nmap <Leader>fl :Lines<CR>
nmap <Leader>fC :Commands<CR>

" Next/Prev buffers
nnoremap <leader><Left> :bp<CR>
nnoremap <leader><Right> :bn<CR>

" new tab
nnoremap <silent> <Leader>t :tabnew<CR>

nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>

" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

" Creating / moving split
nnoremap <silent> <Leader>h :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 0)<CR>
nnoremap <silent> <Leader>l :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 0)<CR>
nnoremap <silent> <Leader>k :call JumpOrOpenNewSplit('k', ':leftabove split', 0)<CR>
nnoremap <silent> <Leader>j :call JumpOrOpenNewSplit('j', ':rightbelow split', 0)<CR>

" Let's try to quit vim
nnoremap <silent> <Leader>w :call CloseSplitOrDeleteBufferSafe()<CR>
nnoremap <silent> X :call CloseSplitOrDeleteBuffer()<CR>
nnoremap <silent> Ч :call CloseSplitOrDeleteBuffer()<CR>


