#!/usr/bin/luajit

local ffi = require("ffi")
ffi.cdef [[
int system(const char* command);
]]

if arg[1] == nil then
  ffi.C.system("redshift -x 1>/dev/null")
else
  local n = tonumber(arg[1])
  if n < 10 then
    ffi.C.system("redshift -x 1>/dev/null; redshift -O " .. n * 1000 ..
                   " 1>/dev/null")
  else
    ffi.C.system("redshift -x 1>/dev/null; redshift -O " .. n * 100 ..
                   " 1>/dev/null")
  end
end

-- vim: set ft=lua:
