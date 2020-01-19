local _M = {}

local cjson = require "cjson"
local pb = require "pb"
local protoc = require "protoc"


function _M.dispatch()
    local pb = protoc.loadfile('authenticate.proto')
end
