local function trim(value)
    return value:match("^%s*(.-)%s*$")
end

local function split(value, separator)
    local result = {}
    for line in string.gmatch(value, "[^" .. separator .. "]+") do
        table.insert(result, line)
    end
    return result
end

local function get_time()
    local time = os.date("*t")
    return ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec)
end

local function get_current_line()
    local lines = split(debug.traceback(), "\n")
    return trim(lines[4])
end

return function(value)
    local file = io.open(os.getenv("HOME") .. "/log.txt", "a")

    if not file then
        print("Could not open ~/log.txt")
        return
    end

    local text = get_time()
    text = text .. ": "
    text = text .. vim.inspect(value)
    text = text .. " from "
    text = text .. get_current_line()
    text = text .. "\n"

    file:write(text)
    file:close()
end
