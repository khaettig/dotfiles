local cmd = vim.cmd

cmd([[syntax match GTDLink "\[[a-zäöüßA-Z0-9\./:~_\-\(\)]*\]"]])
cmd([[hi! link GTDLink FgPaleBlue]])

cmd([[syntax match Deadline "<[0-9\-]\+>"]])
cmd([[hi! link Deadline WhiteOnBlue]])

cmd([[syntax match HighPriority "<high>"]])
cmd([[hi! link HighPriority WhiteOnBlood]])

cmd([[syntax match TodoDone ".*✔$"]])
cmd([[hi! link TodoDone FgGray]])
