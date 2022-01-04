" bjn's timesheet syntax

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax match timesheetTimestamp "^[0-9]\{4\}\(-[0-9]\{2\}\)\{2\}T[0-9]\{2\}\(:[0-9]\{2\}\)\{2\}[+-][0-9]\{4\} " nextgroup=timesheetWeekday contains=timesheetTimestampDate,timesheetTimestampT,timesheetTimestampTimeHM,timesheetTimestampTz
syntax match timesheetTimestampDate "^[0-9]\{4\}\(-[0-9]\{2\}\)\{2\}" contained
syntax match timesheetTimestampT "\(^[0-9]\{4\}\(-[0-9]\{2\}\)\{2\}\)\@<=T" contained
syntax match timesheetTimestampTimeHM "T\@<=[0-9]\{2\}:[0-9]\{2\}" contained
syntax match timesheetTimestampTz "\([0-9]\{2\}\(:[0-9]\{2\}\)\{2\}\)\@<=-[0-9]\{4\}" contained
syntax match timesheetWeekday "([A-Za-z]\{3\})\t" nextgroup=timesheetStatus contains=timesheetWeekdaySun,timesheetWeekdayMon,timesheetWeekdayTue,timesheetWeekdayWed,timesheetWeekdayThu,timesheetWeekdayFri,timesheetWeekdaySat
syntax match timesheetWeekdaySun "Sun" contained
syntax match timesheetWeekdayMon "Mon" contained
syntax match timesheetWeekdayTue "Tue" contained
syntax match timesheetWeekdayWed "Wed" contained
syntax match timesheetWeekdayThu "Thu" contained
syntax match timesheetWeekdayFri "Fri" contained
syntax match timesheetWeekdaySat "Sat" contained
syntax match timesheetStatus "[01]\t" nextgroup=timesheetProject contained contains=timesheetStatusOn,timesheetStatusOff
syntax match timesheetStatusOn "1" nextgroup=timesheetProject contained
syntax match timesheetStatusOff "0" nextgroup=timesheetProject contained
syntax match timesheetProject "[^\t#]\+" contained contains=timesheetProjectDocket
syntax match timesheetProjectDocket "[A-Z]\{3\}-[A-Z]\{3\}-[A-Z][0-9]\{5\}" contained

syntax match timesheetPeriodStart "^start\t" nextgroup=timesheetPeriodName
syntax match timesheetPeriodName "[^#]\+" contained

syntax match timesheetInvoice "^invoice\t" nextgroup=timesheetInvoiceName
syntax match timesheetInvoiceName "[^\t#]\+" contained nextgroup=timesheetComment

syntax match timesheetComment "#.*$"

"hi def link timesheetTimestamp Number
hi def timesheetTimestampT ctermfg=darkGray
hi def link timesheetTimestampTimeHM Number
hi def timesheetTimestampTz ctermfg=darkGray
"hi def link timesheetWeekday Number
hi def link timesheetStatus Special
hi def link timesheetStatusOn Identifier
hi def link timesheetProject Type
hi def link timesheetProjectDocket Label
hi def link timesheetComment Comment
hi def link timesheetPeriodStart Keyword
hi def link timesheetPeriodName Identifier
hi def link timesheetInvoice Keyword
hi def link timesheetInvoiceName Identifier

hi def timesheetWeekdaySun ctermfg=black ctermbg=darkRed guifg=black guibg=#ff7e73
hi def timesheetWeekdayMon ctermfg=yellow guifg=#c4ab36
hi def timesheetWeekdayTue ctermfg=green guifg=#6bd44d
hi def timesheetWeekdayWed ctermfg=cyan guifg=#3edaa7
hi def timesheetWeekdayThu ctermfg=blue guifg=#60b9ff
hi def timesheetWeekdayFri ctermfg=darkMagenta guifg=#b689ff
hi def timesheetWeekdaySat ctermfg=black ctermbg=magenta guifg=black guibg=#ff6fd6

let b:current_syntax = "timesheet"
