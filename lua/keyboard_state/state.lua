local M = {
  last_keyboard_layout = nil,
}

function M.get_keyboard_layout()
  local handle =
    io.popen "hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | head -n1 2>/dev/null"
  if handle then
    local layout = handle:read "*a"
    handle:close()
    layout = layout:gsub("^%s*(.-)%s*$", "%1")
    if layout:find "English" then
      print "EN"
      return "en"
    elseif layout:find "Czech" or layout:find "cs" then
      print "CZ"
      return "cz"
    else
      return layout:sub(1, 2):upper()
    end
  end
  print "N/A"
  return "N/A"
end

function M.set_keyboard_layout(layout_code)
  local layout = 0
  if layout_code == "us" then
    layout = 0
  elseif layout_code == "cz" then
    layout = 1
  else
    return
  end

  vim.fn.system({
    "hyprctl",
    "switchxkblayout",
    "micro-star-int'l-co.,-ltd.-msi-gk50-low-profile-gaming-keyboard",
    tostring(layout),
  }, {})
end

return M
