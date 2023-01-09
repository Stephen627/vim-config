
local M = {}

function M.fileExists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function M.map(tbl, func)
    local t = {}
    for _,v in pairs(tbl) do
        table.insert(t, func(v))
    end

    return t
end

function M.merge(mergee, merger)
    local merged = {}

    for k,v in pairs(mergee) do
        merged[k] = v
    end

    for mergerKey, mergerValue in pairs(merger) do
        local mergeeValue = mergee[mergerKey]

        if type(mergeeValue) == "table" and type(mergerValue) == "table" then
            if M.isArray(mergeeValue) and M.isArray(mergerValue) then
                for _,v in pairs(mergerValue) do
                    table.insert(mergeeValue, v)
                end
                merged[mergerKey] = mergeeValue
            else
                merged[mergerKey] = M.merge(mergeeValue, mergerValue)
            end
        else
            merged[mergerKey] = mergerValue
        end
    end

    return merged
end

function M.simpleMerge(mergee, merger)
  local merged = {}

  for k,v in pairs(mergee) do
    merged[k] = v
  end

  for k,v in pairs(merger) do
    merged[k] = v
  end

  return merged
end

function M.isArray(t)
  local i = 0
  for _ in pairs(t) do
      i = i + 1
      if t[i] == nil then return false end
  end
  return true
end

function M.tableHasValue(table, value)
  local hasValue = false
  for _, v in pairs(table) do
    if v == value then
      hasValue = true
      break
    end
  end

  return hasValue
end

function M.debounce(ms, fn)
  local timer = vim.loop.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

function M.throttle(ms, fn)
  local timer = vim.loop.new_timer()
  local running = false
  return function(...)
    if not running then
      local argv = { ... }
      local argc = select("#", ...)

      timer:start(ms, 0, function()
        running = false
        pcall(vim.schedule_wrap(fn), unpack(argv, 1, argc))
      end)
      running = true
    end
  end
end

return M

