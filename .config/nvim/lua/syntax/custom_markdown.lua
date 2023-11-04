return function()
    local cmd = vim.cmd
    cmd([[syntax match GTDLink "\[[a-zäöüßA-Z0-9\./:~_\-\(\)]*\]"]])
    cmd([[syntax match Deadline "<[0-9\-]\+>"]])
    cmd([[syntax match HighPriority "<high>"]])
    cmd([[syntax match TodoDone ".*✔$"]])
end
