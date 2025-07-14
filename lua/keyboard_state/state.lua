local M = {
  last_keyboard_layout = nil,
}

function M.get_keyboard_layout()
  local stdout = vim.fn.system({
    "hyprctl",
    "devices",
    "-j",
    "|",
    "jq",
    "-r",
    "'.keyboards[] | select(.main == true) | .active_keymap'",
  }, {})
  print(stdout)

  if stdout == "English (US)" then
    print "us"
    return "us"
  elseif stdout == "Czech (QWERTY)" then
    print "cz"
    return "cz"
  else
    print "unknown"
    return ""
  end
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
