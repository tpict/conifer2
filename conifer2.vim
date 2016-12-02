" Name:     conifer2
" Author:   Tom Picton
" URL:      https://github.com/tpict/conifer2
" License:  MIT
" Created:  2016/08/26


" Colorscheme initialization
" ---------------------------------------------------------------------
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'conifer2'
let g:solarized_termcolors = 16 " Solarized compatibility

let s:base03      = [08, '#2c2130']
let s:base02      = [00, '#392c39']
let s:base01      = [10, '#7a6664']
let s:base00      = [11, '#88726c']
let s:base0       = [12, '#a69382']
let s:base1       = [14, '#b5a08f']
let s:base2       = [07, '#fde4ca']
let s:base3       = [15, '#ffeed9']
let s:yellow      = [03, '#af8940']
let s:orange      = [09, '#c86f54']
let s:red         = [01, '#cd4845']
let s:magenta     = [05, '#c6669d']
let s:violet      = [13, '#8d7abf']
let s:blue        = [04, '#7592b0']
let s:cyan        = [06, '#5a9e7a']
let s:green       = [02, '#87963c']

if &background ==# 'light'
    let s:temp03      = s:base03
    let s:temp02      = s:base02
    let s:temp01      = s:base01
    let s:temp00      = s:base00
    let s:base03      = s:base3
    let s:base02      = s:base2
    let s:base01      = s:base1
    let s:base00      = s:base0
    let s:base0       = s:temp00
    let s:base1       = s:temp01
    let s:base2       = s:temp02
    let s:base3       = s:temp03
endif

let g:terminal_color_0 = s:base02[1]
let g:terminal_color_1 = s:red[1]
let g:terminal_color_2 = s:green[1]
let g:terminal_color_3 = s:yellow[1]
let g:terminal_color_4 = s:blue[1]
let g:terminal_color_5 = s:magenta[1]
let g:terminal_color_6 = s:cyan[1]
let g:terminal_color_7 = s:base2[1]
let g:terminal_color_8 = s:base03[1]
let g:terminal_color_9 = s:orange[1]
let g:terminal_color_10 = s:base01[1]
let g:terminal_color_11 = s:base00[1]
let g:terminal_color_12 = s:base0[1]
let g:terminal_color_13 = s:violet[1]
let g:terminal_color_14 = s:base1[1]
let g:terminal_color_15 = s:base3[1]


" Formatting options
" ---------------------------------------------------------------------
let s:c               = ',undercurl'
let s:r               = ',reverse'
let s:b               = ',bold'
let s:u               = ',underline'
let s:i               = ',italic'


" Highlighting primitives
" ---------------------------------------------------------------------

let s:colorNames = ['base03', 'base02', 'base01', 'base00', 'base0', 'base1',
              \ 'base2', 'base3', 'green', 'yellow', 'orange', 'red',
              \ 'magenta', 'violet', 'blue', 'cyan']

" vint: -ProhibitUsingUndeclaredVariable
" generate foreground and background variants for each colour
for s:colorName in s:colorNames
    exe 'let s:currentCColor = s:' . s:colorName . '[0]'
    exe 'let s:currentGColor = s:' . s:colorName . '[1]'
    for s:prefix in ['bg', 'fg']
        exe 'let s:' . s:prefix . '_' . s:colorName . ' = " cterm' .
                    \ s:prefix . '=' . s:currentCColor .  ' gui' . s:prefix .
                    \ '=' . s:currentGColor . '"'
    endfor
    exe 'let s:sp_' . s:colorName . ' = " guisp=' . s:currentGColor . '"'
endfor

let s:bg_none      = ' ctermbg=NONE guibg=NONE'
let s:fg_none      = ' ctermfg=NONE guifg=NONE'
let s:sp_none      = ' guisp=NONE'

let s:fmt_none     = ' cterm=NONE' .          ' gui=NONE'
let s:fmt_bold     = ' cterm=NONE' .s:b.      ' gui=NONE'.s:b
let s:fmt_undr     = ' cterm=NONE' .s:u.      ' gui=NONE'.s:u
let s:fmt_undb     = ' cterm=NONE' .s:u.s:b.  ' gui=NONE'.s:u.s:b
let s:fmt_curl     = ' cterm=NONE' .s:c.      ' gui=NONE'.s:c
let s:fmt_ital     = ' cterm=NONE' .s:i.      ' gui=NONE'.s:i
let s:fmt_revr     = ' cterm=NONE' .s:r.      ' gui=NONE'.s:r


" Basic highlighting
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

exe 'hi! Normal'         .s:fmt_none   .s:fg_base0  .s:bg_base03

exe 'hi! Comment'        .s:fmt_ital   .s:fg_base01 .s:bg_none
"       *Comment         any comment

exe 'hi! Constant'       .s:fmt_none   .s:fg_cyan   .s:bg_none
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe 'hi! Identifier'     .s:fmt_none   .s:fg_blue   .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe 'hi! Statement'      .s:fmt_none   .s:fg_yellow .s:bg_none
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe 'hi! PreProc'        .s:fmt_none   .s:fg_orange .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe 'hi! Type'           .s:fmt_none   .s:fg_green .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe 'hi! Special'        .s:fmt_none   .s:fg_red    .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe 'hi! Underlined'     .s:fmt_none   .s:fg_violet .s:bg_none
"       *Underlined      text that stands out, HTML links

exe 'hi! Ignore'         .s:fmt_none   .s:fg_none   .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe 'hi! Error'          .s:fmt_bold   .s:fg_red    .s:bg_none
"       *Error           any erroneous construct

exe 'hi! Todo'           .s:fmt_bold   .s:fg_magenta.s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX


" Extended highlighting
" ---------------------------------------------------------------------
exe 'hi! SpecialKey'     .s:fmt_bold   .s:fg_base01 .s:bg_none
exe 'hi! NonText'        .s:fmt_bold   .s:fg_base00 .s:bg_none
exe 'hi! StatusLine'     .s:fmt_none   .s:fg_base02 .s:bg_base1  .s:fmt_revr
exe 'hi! StatusLineNC'   .s:fmt_none   .s:fg_base00 .s:bg_base02 .s:fmt_revr
exe 'hi! StatusLineNC'   .s:fmt_none   .s:fg_base00 .s:bg_base02 .s:fmt_revr
exe 'hi! Visual'         .s:fmt_none   .s:fg_base01 .s:bg_base03 .s:fmt_revr
exe 'hi! Directory'      .s:fmt_none   .s:fg_blue   .s:bg_none
exe 'hi! ErrorMsg'       .s:fmt_revr   .s:fg_red    .s:bg_none
exe 'hi! IncSearch'      .s:fmt_revr   .s:fg_magenta.s:bg_none
exe 'hi! Search'         .s:fmt_revr   .s:fg_violet .s:bg_none
exe 'hi! MoreMsg'        .s:fmt_none   .s:fg_blue   .s:bg_none
exe 'hi! ModeMsg'        .s:fmt_none   .s:fg_blue   .s:bg_none
exe 'hi! LineNr'         .s:fmt_none   .s:fg_base01 .s:bg_base02
exe 'hi! Question'       .s:fmt_bold   .s:fg_cyan   .s:bg_none
exe 'hi! VertSplit'      .s:fmt_none   .s:fg_base00 .s:bg_base00
exe 'hi! Title'          .s:fmt_bold   .s:fg_orange .s:bg_none
exe 'hi! WarningMsg'     .s:fmt_bold   .s:fg_red    .s:bg_none
exe 'hi! WildMenu'       .s:fmt_none   .s:fg_base01 .s:bg_base3  .s:fmt_revr
exe 'hi! Folded'         .s:fmt_undb   .s:fg_base0  .s:bg_base02 .s:sp_base03
exe 'hi! FoldColumn'     .s:fmt_none   .s:fg_base0  .s:bg_base02
" #####
" maybe make these bold? check gui
exe 'hi! DiffAdd'        .s:fmt_none   .s:fg_green  .s:bg_base02 .s:sp_green
exe 'hi! DiffChange'     .s:fmt_none   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe 'hi! DiffDelete'     .s:fmt_none   .s:fg_red    .s:bg_base02
exe 'hi! DiffText'       .s:fmt_none   .s:fg_blue   .s:bg_base02 .s:sp_blue
" #####
exe 'hi! SignColumn'     .s:fmt_none   .s:fg_base0  .s:bg_base02
exe 'hi! Conceal'        .s:fmt_none   .s:fg_blue   .s:bg_none
exe 'hi! SpellBad'       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
exe 'hi! SpellCap'       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
exe 'hi! SpellRare'      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe 'hi! SpellLocal'     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
exe 'hi! Pmenu'          .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:fmt_revr
exe 'hi! PmenuSel'       .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:fmt_revr
exe 'hi! PmenuSbar'      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revr
exe 'hi! PmenuThumb'     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revr
exe 'hi! TabLine'        .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe 'hi! TabLineFill'    .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe 'hi! TabLineSel'     .s:fmt_revr   .s:fg_base02 .s:bg_base1   .s:sp_base0
exe 'hi! CursorColumn'   .s:fmt_none   .s:fg_none   .s:bg_base02
exe 'hi! CursorLine'     .s:fmt_none   .s:fg_none   .s:bg_base02  .s:sp_base1
exe 'hi! CursorLineNr'   .s:fmt_none   .s:fg_base00 .s:bg_none    .s:fmt_bold
exe 'hi! ColorColumn'    .s:fmt_none   .s:fg_none   .s:bg_base02
exe 'hi! Cursor'         .s:fmt_none   .s:fg_base03 .s:bg_base0
hi! link lCursor Cursor
exe 'hi! MatchParen'     .s:fmt_bold   .s:fg_red    .s:bg_base01


" vim syntax highlighting
" ---------------------------------------------------------------------
hi! link vimVar Normal
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
exe 'hi! vimCommentString'  .s:fmt_none    .s:fg_violet .s:bg_none
exe 'hi! vimCommand'        .s:fmt_none    .s:fg_yellow .s:bg_none
exe 'hi! vimCmdSep'         .s:fmt_bold    .s:fg_blue   .s:bg_none
exe 'hi! helpExample'       .s:fmt_none    .s:fg_base1  .s:bg_none
exe 'hi! helpOption'        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe 'hi! helpNote'          .s:fmt_none    .s:fg_magenta.s:bg_none
exe 'hi! helpVim'           .s:fmt_none    .s:fg_magenta.s:bg_none
exe 'hi! helpHyperTextJump' .s:fmt_undr    .s:fg_blue   .s:bg_none
exe 'hi! helpHyperTextEntry'.s:fmt_none    .s:fg_green  .s:bg_none
exe 'hi! vimIsCommand'      .s:fmt_none    .s:fg_base0  .s:bg_none
exe 'hi! vimOper'           .s:fmt_none    .s:fg_base1  .s:bg_none
exe 'hi! vimSynMtchOpt'     .s:fmt_none    .s:fg_yellow .s:bg_none
exe 'hi! vimSynType'        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe 'hi! vimHiLink'         .s:fmt_none    .s:fg_blue   .s:bg_none
exe 'hi! vimHiGroup'        .s:fmt_none    .s:fg_blue   .s:bg_none
exe 'hi! vimGroup'          .s:fmt_undb    .s:fg_blue   .s:bg_none
exe 'hi! vimParenSep'       .s:fmt_none    .s:fg_base1  .s:bg_none
exe 'hi! vimSep'            .s:fmt_none    .s:fg_base1  .s:bg_none

" diff highlighting
" ---------------------------------------------------------------------
hi! link diffAdded Statement
hi! link diffLine Identifier

" git & gitcommit highlighting
" git
" exe "hi! gitDateHeader"
" exe "hi! gitIdentityHeader"
" exe "hi! gitIdentityKeyword"
" exe "hi! gitNotesHeader"
" exe "hi! gitReflogHeader"
" exe "hi! gitKeyword"
" exe "hi! gitIdentity"
" exe "hi! gitEmailDelimiter"
" exe "hi! gitEmail"
" exe "hi! gitDate"
" exe "hi! gitMode"
" exe "hi! gitHashAbbrev"
" exe "hi! gitHash"
" exe "hi! gitReflogMiddle"
" exe "hi! gitReference"
" exe "hi! gitStage"
" exe "hi! gitType"
" exe "hi! gitDiffAdded"
" exe "hi! gitDiffRemoved"
" gitcommit
" exe "hi! gitcommitSummary"
exe 'hi! gitcommitComment'      .s:fmt_ital     .s:fg_base01    .s:bg_none
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
exe 'hi! gitcommitUnmerged'     .s:fmt_bold     .s:fg_green     .s:bg_none
exe 'hi! gitcommitOnBranch'     .s:fmt_bold     .s:fg_base01    .s:bg_none
exe 'hi! gitcommitBranch'       .s:fmt_bold     .s:fg_magenta   .s:bg_none
hi! link gitcommitNoBranch gitcommitBranch
exe 'hi! gitcommitDiscardedType'.s:fmt_none     .s:fg_red       .s:bg_none
exe 'hi! gitcommitSelectedType' .s:fmt_none     .s:fg_green     .s:bg_none
" exe "hi! gitcommitUnmergedType"
" exe "hi! gitcommitType"
" exe "hi! gitcommitNoChanges"
" exe "hi! gitcommitHeader"
exe 'hi! gitcommitHeader'       .s:fmt_none     .s:fg_base01    .s:bg_none
exe 'hi! gitcommitUntrackedFile'.s:fmt_bold     .s:fg_cyan      .s:bg_none
exe 'hi! gitcommitDiscardedFile'.s:fmt_bold     .s:fg_red       .s:bg_none
exe 'hi! gitcommitSelectedFile' .s:fmt_bold     .s:fg_green     .s:bg_none
exe 'hi! gitcommitUnmergedFile' .s:fmt_bold     .s:fg_yellow    .s:bg_none
exe 'hi! gitcommitFile'         .s:fmt_bold     .s:fg_base0     .s:bg_none
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
" exe "hi! gitcommitArrow"
" exe "hi! gitcommitOverflow"
" exe "hi! gitcommitBlank"
"
" html highlighting
" ---------------------------------------------------------------------
exe 'hi! htmlTag'           .s:fmt_none .s:fg_base01 .s:bg_none
exe 'hi! htmlEndTag'        .s:fmt_none .s:fg_base01 .s:bg_none
exe 'hi! htmlTagN'          .s:fmt_bold .s:fg_base1  .s:bg_none
exe 'hi! htmlTagName'       .s:fmt_none .s:fg_blue   .s:bg_none
exe 'hi! htmlSpecialTagName'.s:fmt_ital .s:fg_blue   .s:bg_none
exe 'hi! htmlArg'           .s:fmt_none .s:fg_base00 .s:bg_none
exe 'hi! javaScript'        .s:fmt_none .s:fg_yellow .s:bg_none

" perl highlighting
" ---------------------------------------------------------------------
exe 'hi! perlHereDoc'    . s:fg_base1  .s:bg_base03   .s:fmt_none
exe 'hi! perlVarPlain'   . s:fg_yellow .s:bg_base03   .s:fmt_none
exe 'hi! perlStatementFileDesc'. s:fg_cyan.s:bg_base03.s:fmt_none


" tex highlighting
" ---------------------------------------------------------------------
exe 'hi! texStatement'   . s:fg_cyan   .s:bg_base03   .s:fmt_none
exe 'hi! texMathZoneX'   . s:fg_yellow .s:bg_base03   .s:fmt_none
exe 'hi! texMathMatcher' . s:fg_yellow .s:bg_base03   .s:fmt_none
exe 'hi! texMathMatcher' . s:fg_yellow .s:bg_base03   .s:fmt_none
exe 'hi! texRefLabel'    . s:fg_yellow .s:bg_base03   .s:fmt_none

" ruby highlighting
" ---------------------------------------------------------------------
exe 'hi! rubyDefine'     . s:fg_base1  .s:bg_base03   .s:fmt_bold
" rubyInclude
" rubySharpBang
" rubyAccess
" rubyPredefinedVariable
" rubyBoolean
" rubyClassVariable
" rubyBeginEnd
" rubyRepeatModifier
" hi! link rubyArrayDelimiter    Special  " [ , , ]
" rubyCurlyBlock  { , , }

" hi! link rubyClass             Keyword
" hi! link rubyModule            Keyword
" hi! link rubyKeyword           Keyword
" hi! link rubyOperator          Operator
" hi! link rubyIdentifier        Identifier
" hi! link rubyInstanceVariable  Identifier
" hi! link rubyGlobalVariable    Identifier
" hi! link rubyClassVariable     Identifier
" hi! link rubyConstant          Type

" haskell syntax highlighting
" ---------------------------------------------------------------------
" For use with syntax/haskell.vim : Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let g:hs_highlight_boolean=1
" highlight delims, see the plugin referenced above
let g:hs_highlight_delimiters=1

exe 'hi! cPreCondit'. s:fg_orange.s:bg_none   .s:fmt_none

exe 'hi! VarId'    . s:fg_blue   .s:bg_none   .s:fmt_none
exe 'hi! ConId'    . s:fg_yellow .s:bg_none   .s:fmt_none
exe 'hi! hsImport' . s:fg_magenta.s:bg_none   .s:fmt_none
exe 'hi! hsString' . s:fg_base00 .s:bg_none   .s:fmt_none

exe 'hi! hsStructure'        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe 'hi! hs_hlFunctionName'  . s:fg_blue   .s:bg_none
exe 'hi! hsStatement'        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe 'hi! hsImportLabel'      . s:fg_cyan   .s:bg_none   .s:fmt_none
exe 'hi! hs_OpFunctionName'  . s:fg_yellow .s:bg_none   .s:fmt_none
exe 'hi! hs_DeclareFunction' . s:fg_orange .s:bg_none   .s:fmt_none
exe 'hi! hsVarSym'           . s:fg_cyan   .s:bg_none   .s:fmt_none
exe 'hi! hsType'             . s:fg_yellow .s:bg_none   .s:fmt_none
exe 'hi! hsTypedef'          . s:fg_cyan   .s:bg_none   .s:fmt_none
exe 'hi! hsModuleName'       . s:fg_green  .s:bg_none   .s:fmt_undr
exe 'hi! hsModuleStartLabel' . s:fg_magenta.s:bg_none   .s:fmt_none
hi! link hsImportParams      Delimiter
hi! link hsDelimTypeExport   Delimiter
hi! link hsModuleStartLabel  hsStructure
hi! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
exe 'hi! hsNiceOperator'     . s:fg_cyan   .s:bg_none   .s:fmt_none
exe 'hi! hsniceoperator'     . s:fg_cyan   .s:bg_none   .s:fmt_none


" pandoc markdown syntax highlighting
" ---------------------------------------------------------------------

" PandocHiLink pandocNormalBlock
exe 'hi! pandocTitleBlock'               .s:fg_blue   .s:bg_none   .s:fmt_none
exe 'hi! pandocTitleBlockTitle'          .s:fg_blue   .s:bg_none   .s:fmt_bold
exe 'hi! pandocTitleComment'             .s:fg_blue   .s:bg_none   .s:fmt_bold
exe 'hi! pandocComment'                  .s:fg_base01 .s:bg_none   .s:fmt_ital
exe 'hi! pandocVerbatimBlock'            .s:fg_yellow .s:bg_none   .s:fmt_none
hi! link pandocVerbatimBlockDeep         pandocVerbatimBlock
hi! link pandocCodeBlock                 pandocVerbatimBlock
hi! link pandocCodeBlockDelim            pandocVerbatimBlock
exe 'hi! pandocBlockQuote'               .s:fg_blue   .s:bg_none   .s:fmt_none
exe 'hi! pandocBlockQuoteLeader1'        .s:fg_blue   .s:bg_none   .s:fmt_none
exe 'hi! pandocBlockQuoteLeader2'        .s:fg_cyan   .s:bg_none   .s:fmt_none
exe 'hi! pandocBlockQuoteLeader3'        .s:fg_yellow .s:bg_none   .s:fmt_none
exe 'hi! pandocBlockQuoteLeader4'        .s:fg_red    .s:bg_none   .s:fmt_none
exe 'hi! pandocBlockQuoteLeader5'        .s:fg_base0  .s:bg_none   .s:fmt_none
exe 'hi! pandocBlockQuoteLeader6'        .s:fg_base01 .s:bg_none   .s:fmt_none
exe 'hi! pandocListMarker'               .s:fg_magenta.s:bg_none   .s:fmt_none
exe 'hi! pandocListReference'            .s:fg_magenta.s:bg_none   .s:fmt_undr

" Definitions
" ---------------------------------------------------------------------
let s:fg_pdef = s:fg_violet
exe 'hi! pandocDefinitionBlock'              .s:fg_pdef  .s:bg_none  .s:fmt_none
exe 'hi! pandocDefinitionTerm'               .s:fg_pdef  .s:bg_none  .s:fmt_revr
exe 'hi! pandocDefinitionIndctr'             .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe 'hi! pandocEmphasisDefinition'           .s:fg_pdef  .s:bg_none  .s:fmt_ital
exe 'hi! pandocEmphasisNestedDefinition'     .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasisDefinition'     .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasisNestedDefinition'   .s:fg_pdef.s:bg_none.s:fmt_bold
exe 'hi! pandocStrongEmphasisEmphasisDefinition' .s:fg_pdef.s:bg_none.s:fmt_bold
exe 'hi! pandocStrikeoutDefinition'          .s:fg_pdef  .s:bg_none  .s:fmt_revr
exe 'hi! pandocVerbatimInlineDefinition'     .s:fg_pdef  .s:bg_none  .s:fmt_none
exe 'hi! pandocSuperscriptDefinition'        .s:fg_pdef  .s:bg_none  .s:fmt_none
exe 'hi! pandocSubscriptDefinition'          .s:fg_pdef  .s:bg_none  .s:fmt_none

" Tables
" ---------------------------------------------------------------------
let s:fg_ptable = s:fg_blue
exe 'hi! pandocTable'                        .s:fg_ptable.s:bg_none  .s:fmt_none
exe 'hi! pandocTableStructure'               .s:fg_ptable.s:bg_none  .s:fmt_none
hi! link pandocTableStructureTop             pandocTableStructre
hi! link pandocTableStructureEnd             pandocTableStructre
exe 'hi! pandocTableZebraLight'              .s:fg_ptable.s:bg_base03.s:fmt_none
exe 'hi! pandocTableZebraDark'               .s:fg_ptable.s:bg_base02.s:fmt_none
exe 'hi! pandocEmphasisTable'                .s:fg_ptable.s:bg_none  .s:fmt_ital
exe 'hi! pandocEmphasisNestedTable'          .s:fg_ptable.s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasisTable'          .s:fg_ptable.s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasisNestedTable'    .s:fg_ptable.s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasisEmphasisTable'  .s:fg_ptable.s:bg_none  .s:fmt_bold
exe 'hi! pandocStrikeoutTable'               .s:fg_ptable.s:bg_none  .s:fmt_revr
exe 'hi! pandocVerbatimInlineTable'          .s:fg_ptable.s:bg_none  .s:fmt_none
exe 'hi! pandocSuperscriptTable'             .s:fg_ptable.s:bg_none  .s:fmt_none
exe 'hi! pandocSubscriptTable'               .s:fg_ptable.s:bg_none  .s:fmt_none

" Headings
" ---------------------------------------------------------------------
let s:fg_phead = s:fg_orange
exe 'hi! pandocHeading'                      .s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocHeadingMarker'                .s:fg_yellow.s:bg_none.s:fmt_bold
exe 'hi! pandocEmphasisHeading'              .s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocEmphasisNestedHeading'        .s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocStrongEmphasisHeading'        .s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocStrongEmphasisNestedHeading'  .s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocStrongEmphasisEmphasisHeading'.s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocStrikeoutHeading'             .s:fg_phead .s:bg_none.s:fmt_revr
exe 'hi! pandocVerbatimInlineHeading'        .s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocSuperscriptHeading'           .s:fg_phead .s:bg_none.s:fmt_bold
exe 'hi! pandocSubscriptHeading'             .s:fg_phead .s:bg_none.s:fmt_bold

" Links
" ---------------------------------------------------------------------
exe 'hi! pandocLinkDelim'                .s:fg_base01 .s:bg_none   .s:fmt_none
exe 'hi! pandocLinkLabel'                .s:fg_blue   .s:bg_none   .s:fmt_undr
exe 'hi! pandocLinkText'                 .s:fg_blue   .s:bg_none   .s:fmt_undb
exe 'hi! pandocLinkURL'                  .s:fg_base00 .s:bg_none   .s:fmt_undr
exe 'hi! pandocLinkTitle'                .s:fg_base00 .s:bg_none   .s:fmt_undr
exe 'hi! pandocLinkTitleDelim'           .s:fg_base01 .s:bg_none   .s:fmt_undr   .s:sp_base00
exe 'hi! pandocLinkDefinition'           .s:fg_cyan   .s:bg_none   .s:fmt_undr   .s:sp_base00
exe 'hi! pandocLinkDefinitionID'         .s:fg_blue   .s:bg_none   .s:fmt_bold
exe 'hi! pandocImageCaption'             .s:fg_violet .s:bg_none   .s:fmt_undb
exe 'hi! pandocFootnoteLink'             .s:fg_green  .s:bg_none   .s:fmt_undr
exe 'hi! pandocFootnoteDefLink'          .s:fg_green  .s:bg_none   .s:fmt_bold
exe 'hi! pandocFootnoteInline'           .s:fg_green  .s:bg_none   .s:fmt_undb
exe 'hi! pandocFootnote'                 .s:fg_green  .s:bg_none   .s:fmt_none
exe 'hi! pandocCitationDelim'            .s:fg_magenta.s:bg_none   .s:fmt_none
exe 'hi! pandocCitation'                 .s:fg_magenta.s:bg_none   .s:fmt_none
exe 'hi! pandocCitationID'               .s:fg_magenta.s:bg_none   .s:fmt_undr
exe 'hi! pandocCitationRef'              .s:fg_magenta.s:bg_none   .s:fmt_none

" Main Styles
" ---------------------------------------------------------------------
exe 'hi! pandocStyleDelim'               .s:fg_base01 .s:bg_none  .s:fmt_none
exe 'hi! pandocEmphasis'                 .s:fg_base0  .s:bg_none  .s:fmt_ital
exe 'hi! pandocEmphasisNested'           .s:fg_base0  .s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasis'           .s:fg_base0  .s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasisNested'     .s:fg_base0  .s:bg_none  .s:fmt_bold
exe 'hi! pandocStrongEmphasisEmphasis'   .s:fg_base0  .s:bg_none  .s:fmt_bold
exe 'hi! pandocStrikeout'                .s:fg_base01 .s:bg_none  .s:fmt_revr
exe 'hi! pandocVerbatimInline'           .s:fg_yellow .s:bg_none  .s:fmt_none
exe 'hi! pandocSuperscript'              .s:fg_violet .s:bg_none  .s:fmt_none
exe 'hi! pandocSubscript'                .s:fg_violet .s:bg_none  .s:fmt_none

exe 'hi! pandocRule'                     .s:fg_blue   .s:bg_none  .s:fmt_bold
exe 'hi! pandocRuleLine'                 .s:fg_blue   .s:bg_none  .s:fmt_bold
exe 'hi! pandocEscapePair'               .s:fg_red    .s:bg_none  .s:fmt_bold
exe 'hi! pandocCitationRef'              .s:fg_magenta.s:bg_none   .s:fmt_none
exe 'hi! pandocNonBreakingSpace'         . s:fg_red   .s:bg_none  .s:fmt_revr
hi! link pandocEscapedCharacter          pandocEscapePair
hi! link pandocLineBreak                 pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
exe 'hi! pandocMetadataDelim'            .s:fg_base01 .s:bg_none   .s:fmt_none
exe 'hi! pandocMetadata'                 .s:fg_blue   .s:bg_none   .s:fmt_none
exe 'hi! pandocMetadataKey'              .s:fg_blue   .s:bg_none   .s:fmt_none
exe 'hi! pandocMetadata'                 .s:fg_blue   .s:bg_none   .s:fmt_bold
hi! link pandocMetadataTitle             pandocMetadata

" Plugins
" ---------------------------------------------------------------------
hi! link SneakPluginTarget IncSearch
