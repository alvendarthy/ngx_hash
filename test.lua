package.cpath=package.cpath .. ";./?.so"
ffi = require  "ffi"

ffi.cdef [[
	unsigned int ngx_hash_key(const unsigned char *data, const unsigned int  len, const unsigned int  table_size);
]]

local ngx_hash = ffi.load("ngx_hash")

local test_str = arg[1]
local len = string.len(test_str)
key = ngx_hash.ngx_hash_key(test_str, len, 5)
print(key)
