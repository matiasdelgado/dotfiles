local M = {}

local function shorten_namespace(text)
  local segments = {}
  for s in text:gmatch("[^%.]+") do
    table.insert(segments, s)
  end
  if #segments <= 1 then return text end
  -- remove first segment
  table.remove(segments, 1)
  -- truncate all but last to 4 chars
  for i = 1, #segments - 1 do
    if #segments[i] > 4 then
      segments[i] = segments[i]:sub(1, 4)
    end
  end
  return table.concat(segments, ".")
end

function M.get()
  local ok, navic = pcall(require, "nvim-navic")
  if not ok or not navic.is_available() then return "" end

  local data = navic.get_data()
  if not data or #data == 0 then return "" end

  local parts = {}
  for i, item in ipairs(data) do
    local name = item.name
    -- strip return type " : Something"
    name = name:gsub(" : .+", "")
    -- shorten namespace segments on first item
    if i == 1 then
      name = shorten_namespace(name)
    end
    table.insert(parts, "%#NavicIcons" .. item.type .. "#" .. item.icon .. "%#NavicText#" .. name)
  end

  return table.concat(parts, "%#NavicSeparator# > ")
end

return M
