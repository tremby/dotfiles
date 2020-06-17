" Vim syntax file
" Langugage: Impression DDF
" Maintainer: Bart Nagel <bart@tremby.net>
" Last Change: 2020 May 26

if exists("b:current_syntax")
	finish
endif

syntax spell toplevel

syn case ignore

" Mark illegal characters
syn match ddfError "[^\x00-\x7A\x7C-\x7F]"

syn region ddfControlElement matchgroup=ddfControlBraces start="{" end="}" fold contains=@Spell,@ddfNumber,@ddfCommand,@ddfKeyword,@ddfAttribute,ddfString,ddfIdentifier,ddfControlSwitch,ddfShortCharacterCommand

syn region ddfString contained start=+"+ end=+"+ contains=@NoSpell
syn match ddfIdentifier contained "\v\a[a-z0-9]*" contains=@NoSpell

syn match ddfShortCharacterCommand contained "\v\\\d+" contains=@NoSpell

syn region ddfColourSpecRGB contained matchgroup=ddfColourSpecDelimiter start="RGB=(" end=")" contains=@NoSpell,ddfReal
syn region ddfColourSpecCMYK contained matchgroup=ddfColourSpecDelimiter start="CMYK=(" end=")" contains=@NoSpell,ddfReal
syn region ddfColourSpecHSV contained matchgroup=ddfColourSpecDelimiter start="HSV=(" end=")" contains=@NoSpell,ddfReal
syn region ddfColourSpecRGB24 contained matchgroup=ddfColourSpecDelimiter start="RGB24=(" end=")" contains=@NoSpell,ddfReal
syn cluster ddfColourSpec contains=ddfColourSpecRGB,ddfColourSpecCMYK,ddfColourSpecHSV,ddfColourSpecRGB24

syn match ddfInt contained "\v[-+]?\d+" contains=@NoSpell
syn match ddfReal contained "\v-?\d+(\.\d+)?" contains=@NoSpell
syn match ddfPercentage contained "\v[-+]?\d+\%" contains=@NoSpell
syn match ddfMeasurement contained "\v-?\d+(\.\d+)?(m|cm|mm|yd|ft|in|pi|pt|\"|')?" contains=@NoSpell
syn cluster ddfNumber contains=ddfInt,ddfReal,ddfPercentage,ddfMeasurement

syn keyword ddfStyleCommand contained Style Ruler
syn keyword ddfCodeCommand contained Code
syn keyword ddfFrameThrowCommand contained Framethrow Nextframe
syn keyword ddfCharacterCommand contained Tab CR Star Hash At SoftHyphen
syn keyword ddfKernCommand contained Kern
syn keyword ddfDefineCommand contained Define
syn keyword ddfJustifyCommand contained Justify nextgroup=ddfJustifySpecSpan
syn match ddfJustifySpecSpan contained "\v\s+.{-}\}" contains=ddfJustifySpec
syn keyword ddfNumberCommand contained PageNumber ChapterNumber nextgroup=ddfNumberSpecSpan
syn match ddfNumberSpecSpan contained "\v\s+.{-}\}" contains=ddfNumberSpec
syn cluster ddfCommand contains=ddfStyleCommand,ddfCodeCommand,ddfFrameThrowCommand,ddfCharacterCommand,ddfKernCommand,ddfDefineCommand,ddfJustifyCommand,ddfNumberCommand

syn keyword ddfFontKeyword contained Font
syn keyword ddfMeasureKeyword contained FontSize LineSpace SpaceAbove SpaceBelow CondFrameThrow LeftMargin RightMargin ReturnMargin LeftRuleMargin RightRuleMargin RuleWidth VertRuleWidth RuleAboveOffset RuleOffset KeepTogether
syn keyword ddfColourKeyword contained FontColour BackColour LineColour RuleColour nextgroup=ddfColourSpecSpan
syn match ddfColourSpecSpan contained "\v\s+.{-}\)" contains=@ddfColourSpec
syn keyword ddfPercentKeyword contained FontAspect LinespaceP
syn keyword ddfTrackingKeyword contained Tracking
syn keyword ddfTabsKeyword contained Tabs
syn keyword ddfTabType contained Left Centre Right Decimal VertRule
syn keyword ddfRuleControlKeyword contained RuleControl
syn keyword ddfSwitchKeyword contained Strikeout Hyphenate MenuItem LockToLinespace Bold Italic KeepParagraph KeepNext KeepRegion Overprint OverprintB EffectRuler
syn keyword ddfScriptKeyword contained Script nextgroup=ddfScriptOptionSpan
syn match ddfScriptOptionSpan contained "\v\s+.{-}\}" contains=ddfScriptOption
syn cluster ddfKeyword contains=ddfFontKeyword,ddfMeasureKeyword,ddfColourKeyword,ddfPercentKeyword,ddfTrackingKeyword,ddfTabType,ddfRuleControlKeyword,ddfSwitchKeyword,ddfScriptKeyword

syn keyword ddfUnderlineAttribute contained Underline
syn keyword ddfLeaderAttribute contained Leader
syn keyword ddfDecTabCharacterAttribute contained DecTabChar
syn keyword ddfTracerAttribute contained Index Contents
syn keyword ddfFlagAttribute contained AutoLineSpace
syn keyword ddfShortcutAttribute contained Shortcut
syn cluster ddfAttribute contains=ddfUnderlineAttribute,ddfLeaderAttribute,ddfDecTabCharacterAttribute,ddfTracerAttribute,ddfFlagAttribute,ddfShortcutAttribute

syn keyword ddfControlSwitch contained On Off
syn keyword ddfJustifySpec contained Left Centre Right Full
syn keyword ddfScriptOption contained Off Sub Super
syn keyword ddfNumberSpec contained Roman UpperRoman Decimal
syn cluster ddfOption contains=ddfControlSwitch,ddfJustifySpec,ddfScriptOption,ddfNumberSpec

hi def link ddfShortCharacterCommand ddfSpecialChar

hi def link ddfInt ddfNumber
hi def link ddfReal ddfNumber
hi def link ddfPercentage ddfNumber
hi def link ddfMeasurement ddfNumber

hi def link ddfColourSpecDelimiter ddfColourSpec

hi def link ddfStyleCommand ddfCommand
hi def link ddfCodeCommand ddfCommand
hi def link ddfFrameThrowCommand ddfCommand
hi def link ddfCharacterCommand ddfCommand
hi def link ddfKernCommand ddfCommand
hi def link ddfDefineCommand ddfCommand
hi def link ddfJustifyCommand ddfCommand
hi def link ddfNumberCommand ddfCommand

hi def link ddfFontKeyword ddfKeyword
hi def link ddfMeasureKeyword ddfKeyword
hi def link ddfColourKeyword ddfKeyword
hi def link ddfPercentKeyword ddfKeyword
hi def link ddfTrackingKeyword ddfKeyword
hi def link ddfTabsKeyword ddfKeyword
hi def link ddfTabType ddfKeyword
hi def link ddfRuleControlKeyword ddfKeyword
hi def link ddfSwitchKeyword ddfKeyword
hi def link ddfScriptKeyword ddfKeyword

hi def link ddfUnderlineAttribute ddfAttribute
hi def link ddfLeaderAttribute ddfAttribute
hi def link ddfDecTabCharacterAttribute ddfAttribute
hi def link ddfTracerAttribute ddfAttribute
hi def link ddfFlagAttribute ddfAttribute
hi def link ddfShortcutAttribute ddfAttribute

hi def link ddfControlSwitch ddfOption
hi def link ddfJustifySpec ddfOption
hi def link ddfScriptOption ddfOption
hi def link ddfNumberSpec ddfOption

hi def link ddfSpecialChar SpecialChar
hi def link ddfControlBraces Function
hi def link ddfString String
hi def link ddfIdentifier Identifier
hi def link ddfNumber Number
hi def link ddfColourSpec Function
hi def link ddfCommand Statement
hi def link ddfKeyword Type
hi def link ddfAttribute Type
hi def link ddfOption Constant

hi def link ddfError Error

setlocal wrap
setlocal linebreak
setlocal showbreak=\ \ ↪\ 
setlocal spell
nmap <buffer> j gj
nmap <buffer> k gk
vmap <buffer> j gj
vmap <buffer> k gk
