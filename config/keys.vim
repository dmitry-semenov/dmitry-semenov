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

nmap <Leader>n :NERDTreeToggle<CR>

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

nmap <Leader>fc :Ag<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fg :GitFiles<CR>
nmap <Leader>fG :GitFiles?<CR>
nmap <Leader>fb :Buffers<CR>
nmap <Leader>fl :Lines<CR>
nmap <Leader>fC :Commands<CR>

nnoremap <leader><Left> :bp<CR>
nnoremap <leader><Right> :bn<CR>

" new tab
nnoremap <Leader>t :tabnew<CR>

" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

nnoremap <silent> <C-h> :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 0)<CR>
nnoremap <silent> <C-l> :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 0)<CR>
nnoremap <silent> <C-k> :call JumpOrOpenNewSplit('k', ':leftabove split', 0)<CR>
nnoremap <silent> <C-j> :call JumpOrOpenNewSplit('j', ':rightbelow split', 0)<CR>

nnoremap <silent> Q :call CloseSplitOrDeleteBufferSafe()<CR>
nnoremap <silent> Й :call CloseSplitOrDeleteBufferSafe()<CR>
nnoremap <silent> X :call CloseSplitOrDeleteBuffer()<CR>
nnoremap <silent> Ч :call CloseSplitOrDeleteBuffer()<CR>

