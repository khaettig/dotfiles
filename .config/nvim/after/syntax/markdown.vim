syntax match GTDLink "\[[a-zäöüßA-Z0-9\./:~_\-\(\)]*\]"
hi! link GTDLink FgPaleBlue

syntax match Deadline "<[0-9\-]\+>"
hi! link Deadline WhiteOnBlue

syntax match HighPriority "<high>"
hi! link HighPriority WhiteOnBlood

syntax match TodoDone ".*✔$"
hi! link TodoDone FgGray
