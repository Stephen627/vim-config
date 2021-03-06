
local utils = {}

function utils.fileExists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function utils.map(tbl, func)
    local t = {}
    local index = 0
    for k,v in pairs(tbl) do
        table.insert(t, func(v))
    end

    return t
end

function utils.merge(mergee, merger)
    local merged = {}

    for k,v in pairs(mergee) do
        merged[k] = v
    end

    for mergerKey, mergerValue in pairs(merger) do
        local mergeeValue = mergee[mergerKey]

        if type(mergeeValue) == "table" and type(mergerValue) == "table" then
            if utils.isArray(mergeeValue) and utils.isArray(mergerValue) then
                for k,v in pairs(mergerValue) do
                    table.insert(mergeeValue, v)
                end
                merged[mergerKey] = mergeeValue
            else
                merged[mergerKey] = utils.merge(mergeeValue, mergerValue)
            end
        else
            merged[mergerKey] = mergerValue
        end
    end

    return merged
end

function utils.isArray(t)
  local i = 0
  for _ in pairs(t) do
      i = i + 1
      if t[i] == nil then return false end
  end
  return true
end

return utils

