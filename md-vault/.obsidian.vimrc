" Basic Settings

set clipboard=unnamed

" Unmap prefixes
unmap ,
unmap <Space>

" navigate visual lines rather than logical ones
" nnoremap j gj
" nnoremap k gk
" nnoremap I g0i
" nnoremap A g$a

" Shift HJKL for bigger disng Area (Index.tance
"  nnoremap H g0
" nnoremap L g$
" nnoremap J 10gj
" nnoremap K 10gk
" vnoremap H g0
" vnoremap L g$
" vnoremap J 10gj
" vnoremap K 10gk


"Undo/Redo improvements
nnoremap U <C-r>
nnoremap <Space>ur 1000<C-r>

" Exit insert mode
inoremap jk <Esc>
inoremap jj <Esc>

" Delete without yanking
nnoremap x "_x
nnoremap X "_dl
nnoremap C "_c$


"""""""""""""
" Navigation
"""""""""""""

" Go back/forward in history
exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
" nnoremap <BS> :goBack<CR>
" nnoremap <S-BS> :goForward<CR>
nnoremap <C-o> :goBack<CR>
nnoremap <C-i> :goForward<CR>
"
" Follow link under cursor
exmap follow obcommand editor:follow-link
nmap gf :follow<CR>

" Open first URL in current file
exmap openUrl obcommand grappling-hook:open-first-url-in-file
nnoremap <Space>fu :openUrl<CR>


" Command palette
exmap cmdPalette obcommand command-palette:open
nnoremap gc :cmdPalette<CR>

" Go to footnote
exmap gotoFootnote obcommand obsidian-footnotes:insert-autonumbered-footnote
nnoremap gF :gotoFootnote<CR>

" Quick Explorer
exmap quickExplorerVault obcommand quick-explorer:browse-vault
exmap quickExplorerCurrent obcommand quick-explorer:browse-current
nnoremap ge :quickExplorerVault<CR>
nnoremap gE :quickExplorerCurrent<CR>

" Live grep (ripgrep-style search)
exmap liveGrep obcommand obsidian-another-quick-switcher:grep
nnoremap gl :liveGrep<CR>

" Global search
exmap globalSearch obcommand global-search:open
nnoremap gs :globalSearch<CR>

" Tag pane
exmap tagPane obcommand tag-pane:open
nnoremap g# :tagPane<CR>

" Graph view
exmap graphView obcommand graph:open
nnoremap gGV :graphView<CR>

" Open link in new vertical split
exmap openLinkInNewSplit obcommand editor:open-link-in-new-split
nnoremap gv :openLinkInNewSplit<CR>

" Jump to wiki links
nnoremap g] /\[\[<CR>:nohl<CR>
nnoremap g[ ?\[\[<CR>:nohl<CR>

" Quick switcher (also mapped to Space Space)
exmap quickSwitcher obcommand obsidian-another-quick-switcher:search-command_recent-search
nnoremap gr :quickSwitcher<CR>

" Tab list
exmap tabList obcommand switcher:open
nnoremap gw :tabList<CR>

" New tab
exmap newTab obcommand workspace:new-tab
nnoremap gO :newTab<CR>

" Create new file
exmap createNewFile obcommand file-explorer:new-file
nnoremap gn :createNewFile<CR>

" Navigate files in current folder
exmap nextFileInFolder obcommand grappling-hook:next-file-in-current-folder
exmap prevFileInFolder obcommand grappling-hook:previous-file-in-current-folder
nnoremap ]f :nextFileInFolder<CR>
nnoremap [f :prevFileInFolder<CR>

" === HEADING NAVIGATION ===
" Jump to next/previous heading (any level)
nmap ]] /^#<CR>:nohl<CR>
nmap [[ ?^#<CR>:nohl<CR>

" Jump to next/previous H1
nmap ]1 /^# <CR>:nohl<CR>
nmap [1 ?^# <CR>:nohl<CR>

" Jump to next/previous H2
nmap ]2 /^## <CR>:nohl<CR>
nmap [2 ?^## <CR>:nohl<CR>

" Jump to next/previous H3
nmap ]3 /^### <CR>:nohl<CR>
nmap [3 ?^### <CR>:nohl<CR>

" Toggle between edit and reading mode
exmap toggleEditMode obcommand markdown:toggle-preview
nmap gm :toggleEditMode<CR>

" Toggle source mode (raw markdown vs live preview)
exmap toggleSource obcommand editor:toggle-source
nmap gM :toggleSource<CR>

" Toggle blockquote (alternative mapping)
exmap toggleBlockquote obcommand editor:toggle-blockquote
nnoremap gq :toggleBlockquote<CR>

" Jump to specific tab numbers
exmap goToTab1 obcommand workspace:goto-tab-1
exmap goToTab2 obcommand workspace:goto-tab-2
exmap goToTab3 obcommand workspace:goto-tab-3
exmap goToTab4 obcommand workspace:goto-tab-4
exmap goToTab5 obcommand workspace:goto-tab-5
exmap goToTab6 obcommand workspace:goto-tab-6
exmap goToTab7 obcommand workspace:goto-tab-7
exmap goToTab8 obcommand workspace:goto-last-tab
exmap goToTab9 obcommand workspace:goto-last-tab
nnoremap g1 :goToTab1<CR>
nnoremap g2 :goToTab2<CR>
nnoremap g3 :goToTab3<CR>
nnoremap g4 :goToTab4<CR>
nnoremap g5 :goToTab5<CR>
nnoremap g6 :goToTab6<CR>
nnoremap g7 :goToTab7<CR>
nnoremap g8 :goToTab8<CR>
nnoremap g9 :goToTab9<CR>

" Cycle tabs across splits
exmap cycleTabs obcommand grappling-hook:cycle-tabs-across-splits
nnoremap g<Tab> :cycleTabs<CR>

" Cycle bookmarked notes (like marks in vim)
exmap cycleBookmarks obcommand grappling-hook:cycle-starred-notes
nnoremap g' :cycleBookmarks<CR>
nnoremap g` :cycleBookmarks<CR>

""""""""""""""""""""""""""
" === TABS & SPLITS ===
""""""""""""""""""""""""""

" Tab navigation with gt/gT (vim standard)
exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nnoremap gt :nextTab<CR>
nnoremap gT :prevTab<CR>

" LazyVim style tab navigation with H/L
nnoremap H :prevTab<CR>
nnoremap L :nextTab<CR>

" Bracket navigation for tabs
nnoremap [b :prevTab<CR>
nnoremap ]b :nextTab<CR>

" Split navigation with Ctrl-w
exmap focusRight obcommand editor:focus-right
exmap focusLeft obcommand editor:focus-left
exmap focusTop obcommand editor:focus-top
exmap focusBottom obcommand editor:focus-bottom
nmap <C-w>l :focusRight<CR>
nmap <C-w>h :focusLeft<CR>
nmap <C-w>k :focusTop<CR>
nmap <C-w>j :focusBottom<CR>

" Split creation with Ctrl-w
exmap splitVertical obcommand workspace:split-vertical
exmap splitHorizontal obcommand workspace:split-horizontal
nnoremap <C-w>v :splitVertical<CR>
nnoremap <C-w>s :splitHorizontal<CR>

" Cycle through splits
exmap nextSplit obcommand cycle-through-panes:cycle-through-panes
nnoremap <C-CR> :nextSplit<CR>

" Alt Buffer (emulates :buffer #)
exmap altBuffer obcommand grappling-hook:alternate-note
nnoremap <CR> :altBuffer<CR>

" Close window (vim :q and :wq)
exmap closeWindow obcommand workspace:close
exmap wq obcommand workspace:close
exmap q obcommand workspace:close

""""""""""""""""""""""""""
" === FOLDING ===
""""""""""""""""""""""""""

exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>

exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>

""""""""""""""""""""""""""
" === SPACE LEADER (LazyVim Style) ===
""""""""""""""""""""""""""

" === Quick Access ===
" Space Space - Find files (LazyVim style)
exmap findFilesFuzzy obcommand obsidian-another-quick-switcher:search-command_file-name-fuzzy-search
nnoremap <Space><Space> :findFilesFuzzy<CR>
nnoremap go :quickSwitcher<CR>

" === Periodic Notes (Space p*) === 
" Base periodic note commands
exmap openDaily obcommand periodic-notes:open-daily-note
exmap openWeekly obcommand periodic-notes:open-weekly-note
exmap openMonthly obcommand periodic-notes:open-monthly-note
exmap openQuarterly obcommand periodic-notes:open-quarterly-note
exmap openYearly obcommand periodic-notes:open-yearly-note
nnoremap <Space>pd :openDaily<CR>
nnoremap <Space>pw :openWeekly<CR>
nnoremap <Space>pm :openMonthly<CR>
nnoremap <Space>pq :openQuarterly<CR>
nnoremap <Space>py :openYearly<CR>

" Next periodic notes (pn + type)
exmap nextDaily obcommand periodic-notes:next-daily-note
exmap nextWeekly obcommand periodic-notes:next-weekly-note
exmap nextMonthly obcommand periodic-notes:next-monthly-note
exmap nextQuarterly obcommand periodic-notes:next-quarterly-note
exmap nextYearly obcommand periodic-notes:next-yearly-note
nnoremap <Space>pnd :nextDaily<CR>
nnoremap <Space>pnw :nextWeekly<CR>
nnoremap <Space>pnm :nextMonthly<CR>
nnoremap <Space>pnq :nextQuarterly<CR>
nnoremap <Space>pny :nextYearly<CR>

" Previous periodic notes (pp + type)
exmap prevDaily obcommand periodic-notes:prev-daily-note
exmap prevWeekly obcommand periodic-notes:prev-weekly-note
exmap prevMonthly obcommand periodic-notes:prev-monthly-note
exmap prevQuarterly obcommand periodic-notes:prev-quarterly-note
exmap prevYearly obcommand periodic-notes:prev-yearly-note
nnoremap <Space>ppd :prevDaily<CR>
nnoremap <Space>ppw :prevWeekly<CR>
nnoremap <Space>ppm :prevMonthly<CR>
nnoremap <Space>ppq :prevQuarterly<CR>
nnoremap <Space>ppy :prevYearly<CR>

" File Explorer (Space e)
exmap fileExplorer obcommand file-explorer:open
nnoremap <Space>e :fileExplorer<CR>

" Reveal In File Explorer (Sapce E)
exmap revealinfileExplorer obcommand file-explorer:reveal-active-file
nnoremap <Space>E :revealinfileExplorer<CR>

" Reveal in finder/system explorer (Space o) 
exmap revealInSystem obcommand open-with-default-app:show
nnoremap <Space>o :revealInSystem<CR>

" Reveal in default app
exmap revealInSystem obcommand open-with-default-app:open
nnoremap <Space>O :revealInSystem<CR>

" Close window (Space q)
nnoremap <Space>q :closeWindow<CR>

" Homepage (Space Shift-P)
exmap openHomepage obcommand homepage:open-homepage
nnoremap <Space>D :openHomepage<CR>

" === File Operations (Space f*) ===
" Space ff - Find files (fuzzy search like LazyVim)
nnoremap <Space>ff :findFilesFuzzy<CR>

" Space fr - Recent files
exmap recentFiles obcommand obsidian-another-quick-switcher:search-command_recent-search
nnoremap <Space>fr :recentFiles<CR>

" Space fb - Buffers/Starred files (LazyVim buffers equivalent)
exmap starredFiles obcommand obsidian-another-quick-switcher:search-command_star-search
nnoremap <Space>fb :starredFiles<CR>

" Space fg - Git files (use file search as alternative)
nnoremap <Space>fg :findFilesFuzzy<CR>

" Space fw - Save file (alternative save)
nnoremap <Space>fw :saveFile<CR>

" === File Management Operations ===
" Space fR - Rename file (capital R to avoid conflict with recent)
exmap renameFile obcommand workspace:edit-file-title
nnoremap <Space>fR :renameFile<CR>

" Space fm - Move file
exmap moveFile obcommand file-explorer:move-file
nnoremap <Space>fm :moveFile<CR>

" Space fd - Delete file
exmap deleteFile obcommand app:delete-file
nnoremap <Space>fd :deleteFile<CR>

" Space fs - Search & replace in file
exmap searchReplace obcommand editor:open-search-replace
nnoremap <Space>fs :searchReplace<CR>

" Space fu - File recovery/undo
exmap fileRecovery obcommand file-recovery:open
nnoremap <Space>fu :fileRecovery<CR>

" === Search Operations (Space s*) ===
" Space / - Grep content across files (LazyVim primary)
exmap grepFiles obcommand obsidian-another-quick-switcher:grep
nnoremap <Space>/ :grepFiles<CR>

" Space sg - Grep files (LazyVim secondary)
nnoremap <Space>sg :grepFiles<CR>

" Space ss - Search everything (omnisearch)
exmap searchAll obcommand omnisearch:show-modal
nnoremap <Space>ss :searchAll<CR>

" Space sh - Search headings/landmarks (LazyVim help equivalent)
exmap searchHeadings obcommand obsidian-another-quick-switcher:search-command_landmark-search
nnoremap <Space>sh :searchHeadings<CR>

" === Window Management (Space w*) ===
" Save file (Space w for muscle memory, also fw)
exmap saveFile obcommand editor:save-file
nnoremap <Space>w :saveFile<CR>

" Window splits
nnoremap <Space>wv :splitVertical<CR>
nnoremap <Space>ws :splitHorizontal<CR>
nnoremap <Space>| :splitVertical<CR>
nnoremap <Space>- :splitHorizontal<CR>

" Window navigation
nnoremap <Space>wh :focusLeft<CR>
nnoremap <Space>wl :focusRight<CR>
nnoremap <Space>wj :focusBottom<CR>
nnoremap <Space>wk :focusTop<CR>

" Window close operations
nnoremap <Space>wc :closeWindow<CR>
nnoremap <Space>wd :closeWindow<CR>
exmap closeOthers obcommand workspace:close-others
nnoremap <Space>wo :closeOthers<CR>
exmap closeAll obcommand workspace:close-window
nnoremap <Space>wq :closeAll<CR>

" === Legacy Daily/Weekly (keep for backward compatibility) ===
nnoremap <Space>D :openDaily<CR>
nnoremap <Space>W :openWeekly<CR>


" === Templates ===
exmap insertTemplate obcommand templater-obsidian:insert-templater
nnoremap <Space>t :insertTemplate<CR>

" === Toggle checkbox ===
exmap toggleCheck obcommand editor:toggle-checklist-status
nnoremap <Space>x :toggleCheck<CR>

" === Excalidraw (Space x*) ===
" Create new excalidraw
exmap excalidrawNew obcommand obsidian-excalidraw-plugin:excalidraw-autocreate-newtab
exmap excalidrawCurrent obcommand obsidian-excalidraw-plugin:excalidraw-autocreate-on-current
nnoremap <Space>xe :excalidrawNew<CR>
nnoremap <Space>xE :excalidrawCurrent<CR>

" Create and embed excalidraw
exmap excalidrawEmbed obcommand obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-new-tab
exmap excalidrawEmbedCurrent obcommand obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-on-current
nnoremap <Space>xi :excalidrawEmbed<CR>
nnoremap <Space>xI :excalidrawEmbedCurrent<CR>

" Open existing excalidraw
exmap excalidrawOpen obcommand obsidian-excalidraw-plugin:excalidraw-open
nnoremap <Space>xo :excalidrawOpen<CR>

" === QuickAdd/New Notes (Space n*) ===
" QuickAdd main menu
exmap quickAdd obcommand quickadd:runQuickAdd
nnoremap <Space>nn :quickAdd<CR>

" Specific note types
exmap progressNote obcommand quickadd:choice:progress-note-2025
exmap thinkingNote obcommand quickadd:choice:thinking-note-2025
exmap researchNote obcommand quickadd:choice:research-note-2025
exmap quickCapture obcommand quickadd:choice:quick-capture-2025
nnoremap <Space>np :progressNote<CR>
nnoremap <Space>nt :thinkingNote<CR>
nnoremap <Space>nr :researchNote<CR>
nnoremap <Space>nc :quickCapture<CR>

" File creation commands
exmap newFolder obcommand file-explorer:new-folder
exmap newCanvas obcommand canvas:new-file
nnoremap <Space>nf :newFolder<CR>
nnoremap <Space>nC :newCanvas<CR>

" AI-Assisted Reflections (requires Templater)
exmap aiDailyReflection obcommand templater-obsidian:insert-templater
exmap aiWeeklyReview obcommand templater-obsidian:insert-templater
nnoremap <Space>nrd :aiDailyReflection<CR>
nnoremap <Space>nrw :aiWeeklyReview<CR>

" === Bookmarks (Space b*) ===
" Bookmark current items
exmap bookmarkSearch obcommand obsidian-another-quick-switcher:search-command_star-search
exmap bookmarkHeading obcommand bookmarks:bookmark-current-heading
exmap bookmarkSection obcommand bookmarks:bookmark-current-section
exmap bookmarkAllTabs obcommand bookmarks:bookmark-all-tabs
nnoremap <Space>bs :bookmarkSearch<CR>
nnoremap <Space>bh :bookmarkHeading<CR>
nnoremap <Space>bv :bookmarkSection<CR>
nnoremap <Space>ba :bookmarkAllTabs<CR>

" Unbookmark and open bookmarks
exmap unbookmarkView obcommand bookmarks:unbookmark-current-view
nnoremap <Space>bu :unbookmarkView<CR>
" Note: Space fb already used for starred files search

" === Pin/Unpin ===
exmap togglePin obcommand workspace:toggle-pin  
nnoremap <Space>bp :togglePin<CR>

" === Headings (Space h*) - Using Heading Shifter Plugin ===
" Apply specific heading levels (works on selections)
exmap h0 obcommand obsidian-heading-shifter:apply-heading0
exmap h1Shifter obcommand obsidian-heading-shifter:apply-heading1
exmap h2Shifter obcommand obsidian-heading-shifter:apply-heading2
exmap h3Shifter obcommand obsidian-heading-shifter:apply-heading3
exmap h4Shifter obcommand obsidian-heading-shifter:apply-heading4
exmap h5Shifter obcommand obsidian-heading-shifter:apply-heading5
exmap h6Shifter obcommand obsidian-heading-shifter:apply-heading6
nnoremap <Space>0 :h0<CR>
nnoremap <Space>1 :h1Shifter<CR>
nnoremap <Space>2 :h2Shifter<CR>
nnoremap <Space>3 :h3Shifter<CR>
nnoremap <Space>4 :h4Shifter<CR>
nnoremap <Space>5 :h5Shifter<CR>
nnoremap <Space>6 :h6Shifter<CR>

" Increase/decrease heading levels
exmap headingIncrease obcommand obsidian-heading-shifter:increase-heading
exmap headingDecrease obcommand obsidian-heading-shifter:decrease-heading
nnoremap <Space>h+ :headingIncrease<CR>
nnoremap <Space>h- :headingDecrease<CR>

" Insert headings
exmap insertHeadingCurrent obcommand obsidian-heading-shifter:insert-heading-current
exmap insertHeadingDeeper obcommand obsidian-heading-shifter:insert-heading-deeper
exmap insertHeadingHigher obcommand obsidian-heading-shifter:insert-heading-higher
nnoremap <Space>hi :insertHeadingCurrent<CR>
nnoremap <Space>hd :insertHeadingDeeper<CR>
nnoremap <Space>hh :insertHeadingHigher<CR>

" === Grappling Hook (Additional bindings) ===
" Alternate note (like buffer switching)
nnoremap <Space><Tab> :altBuffer<CR>

" === UI/Utilities (Space u*) ===
" Toggle sidebars and UI elements
exmap toggleLeftSidebar obcommand app:toggle-left-sidebar
exmap toggleRightSidebar obcommand app:toggle-right-sidebar
nnoremap <Space>ul :toggleLeftSidebar<CR>
nnoremap <Space>ur :toggleRightSidebar<CR>

" Developer tools and utilities
exmap toggleDevtools obcommand obsidian-theme-design-utilities:toggle-devtools
nnoremap <Space>ud :toggleDevtools<CR>

" URL/link enhancements
exmap enhanceUrlWithTitle obcommand obsidian-auto-link-title:enhance-url-with-title
nnoremap <Space>uc :enhanceUrlWithTitle<CR>

" === System Clipboard Operations ===
" Space Y - Yank to system clipboard
nnoremap <Space>Y "+y
vnoremap <Space>Y "+y

" Space P - Paste from system clipboard  
nnoremap <Space>P "+p
vnoremap <Space>P "+p

""""""""""""""""""""""""""
" === MARKDOWN FORMATTING (Space m*) ===
""""""""""""""""""""""""""

" === Text Formatting ===
" Bold - wrap text in ** **
nnoremap <Space>mb :surround_bold<CR>
vnoremap <Space>mb :surround_bold<CR>

" Italic - wrap text in * *
nnoremap <Space>mi :surround_italic<CR>
vnoremap <Space>mi :surround_italic<CR>

" Code - wrap text in backticks
nnoremap <Space>mc :surround_inline_code<CR>
vnoremap <Space>mc :surround_inline_code<CR>

" Highlight - wrap text in == ==
nnoremap <Space>mh :surround_highlight<CR>
vnoremap <Space>mh :surround_highlight<CR>

" Strikethrough - wrap text in ~~ ~~
nnoremap <Space>ms :surround_strikethrough<CR>
vnoremap <Space>ms :surround_strikethrough<CR>

" === Links ===
" Wiki Link - wrap text in [[ ]]
nnoremap <Space>ml :surround_wiki<CR>
vnoremap <Space>ml :surround_wiki<CR>

" Markdown Link - Keep using Obsidian command for now (needs custom implementation)
exmap makeMarkdownLink obcommand editor:insert-link
vnoremap <Space>mL :makeMarkdownLink<CR>
nnoremap <Space>mL :makeMarkdownLink<CR>

" === Lists & Checkboxes ===
" Toggle bullet list
exmap toggleBulletList obcommand editor:toggle-bullet-list
nnoremap <Space>m- :toggleBulletList<CR>
vnoremap <Space>m- :toggleBulletList<CR>

" Toggle numbered list
exmap toggleNumberList obcommand editor:toggle-numbered-list
nnoremap <Space>m1 :toggleNumberList<CR>
vnoremap <Space>m1 :toggleNumberList<CR>

" Add/toggle checkbox
exmap addCheckbox obcommand editor:toggle-checklist-status
nnoremap <Space>mt :addCheckbox<CR>
vnoremap <Space>mt :addCheckbox<CR>

" Check checkbox (same as Space x, for consistency)
nnoremap <Space>mx :toggleCheck<CR>
vnoremap <Space>mx :toggleCheck<CR>

" Uncheck checkbox (clear checkbox)
nnoremap <Space>mu :toggleCheck<CR>
vnoremap <Space>mu :toggleCheck<CR>

" === Blocks & Special ===
" Toggle blockquote
exmap makeBlockquote obcommand editor:toggle-blockquote
nnoremap <Space>m> :makeBlockquote<CR>
vnoremap <Space>m> :makeBlockquote<CR>

" Code block - wrap text in ``` ```
nnoremap <Space>mC :surround_codeblock<CR>
vnoremap <Space>mC :surround_codeblock<CR>

" Insert horizontal rule
exmap insertHorizontalRule obcommand editor:insert-horizontal-rule
nnoremap <Space>m_ :insertHorizontalRule<CR>

" === Preview & Rendering ===
" Toggle markdown render (if using a render plugin)
exmap toggleRender obcommand markdown:toggle-preview
nnoremap <Space>mr :toggleRender<CR>

" Toggle markdown preview pane
exmap togglePreview obcommand editor:open-preview
nnoremap <Space>mp :togglePreview<CR>

""""""""""""""""""""""""""
" === NUMBER OPERATIONS (Space +/-) ===
""""""""""""""""""""""""""

" Increment number under cursor
nnoremap <Space>+ <C-a>
" Decrement number under cursor  
nnoremap <Space>- <C-x>

""""""""""""""""""""""""""
" === COMMA PREFIX COMMANDS ===
""""""""""""""""""""""""""

" === File Operations ===
" NOTE: File operations moved to Space f* (Space fR, fm, fd)

" === Markdown Specific ===
nnoremap ,x :toggleCheck<CR>
vnoremap ,x :toggleCheck<CR>

nnoremap ,< :toggleBlockquote<CR>
nnoremap ,> :toggleBlockquote<CR>
vnoremap ,< :toggleBlockquote<CR>
vnoremap ,> :toggleBlockquote<CR>

exmap toggleList obcommand editor:toggle-bullet-list
nnoremap ,- :toggleList<CR>
vnoremap ,- :toggleList<CR>

" Headings (fallback)
nnoremap ,1 :h1<CR>
nnoremap ,2 :h2<CR>
nnoremap ,3 :h3<CR>
nnoremap ,4 :h4<CR>
nnoremap ,5 :h5<CR>
nnoremap ,6 :h6<CR>

" === Utility Commands ===
" Keep ,w as quick save alternative
exmap save obcommand editor:save-file
nnoremap ,w :save<CR>

" NOTE: Other utilities moved to Space commands:
" - Search/replace: ,f → Space fs  
" - File recovery: ,u → Space fu
" - Sidebars: ,sl ,sr → Space ul, ur
" - Devtools: ,b → Space ud  
" - URL enhance: ,c → Space uc

" Log commands in console
nnoremap ,l :obcommand<CR>

" Command palette (moved from Space p)
nnoremap ,p :cmdPalette<CR>

" === Quick Note Operations ===
" NOTE: Note creation moved to Space n* (Space nn for QuickAdd menu)
" TODO: Could add Space nf (new folder) and Space nC (new canvas) if desired

" === Clipboard Enhancements ===  
" Keep Y for yank to end of line
nnoremap Y y$
" NOTE: System clipboard moved to Space Y/P

" === Note Linking ===
exmap createLink obcommand editor:insert-link
vnoremap ,l :createLink<CR>

exmap extractNote obcommand note-composer:extract-selection
vnoremap ,en :extractNote<CR>

""""""""""""""""""""""""""
" === VISUAL MODE ===
""""""""""""""""""""""""""

" Repeated V selects more lines
vnoremap V gj

" Double v goes to visual block mode
vnoremap v <C-v>

" Paste in visual mode without yanking deleted text
vnoremap p "_dP
vnoremap P "_dp

""""""""""""""""""""""""""
" === MISC ===
""""""""""""""""""""""""""

" Context menu (for spell check and more)
exmap contextMenu obcommand editor:context-menu
nnoremap z= :contextMenu<CR>
vnoremap z= :contextMenu<CR>
nnoremap zl :contextMenu<CR>

""""""""""""""""""""""""""
" === SURROUND COMMANDS ===
""""""""""""""""""""""""""

" Define surround operations
exmap surround_wiki surround [[ ]]
exmap surround_bold surround ** **
exmap surround_italic surround * *
exmap surround_inline_code surround ` `
exmap surround_codeblock surround ``` ```
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
exmap surround_highlight surround == ==
exmap surround_strikethrough surround ~~ ~~
exmap delete_surround obcommand editor:delete-surrounding

" Wiki links
map <Space>[[ :surround_wiki<CR>
map <Space>sw :surround_wiki<CR>

" Markdown formatting
map <Space>sb :surround_bold<CR>
map <Space>s8 :surround_bold<CR>
map <Space>si :surround_italic<CR>
map <Space>sc :surround_codeblock<CR>
map <Space>s= :surround_highlight<CR>
map <Space>s~ :surround_strikethrough<CR>

" Quotes
map <Space>s" :surround_double_quotes<CR>
map <Space>s' :surround_single_quotes<CR>
map <Space>s` :surround_backticks<CR>

" Brackets
map <Space>s( :surround_brackets<CR>
map <Space>s) :surround_brackets<CR>
map <Space>s[ :surround_square_brackets<CR>
map <Space>s] :surround_square_brackets<CR>
map <Space>s{ :surround_curly_brackets<CR>
map <Space>s} :surround_curly_brackets<CR>

" Delete surrounding
map <Space>sD :delete_surround<CR>
