local _M = {}

local cjson = require "cjson"
local domain_cache = ngx.shared.domain_cache
local cache = ngx.shared.cache


function _M.dispatch()
    local config_str = domain_cache:get(ngx.var.host)

    if config_str == nil then
        config_str = domain_cache:get("localhost")
        if config_str == nil then
            ngx.exit(404)
        end
    end

    local config = cjson.parse(config_str)
    local real_uri
    local app_info
    local api_uri_array = config["api_uri_array"]
    local api_uri_map = config["api_uri_map"]
    local uri = ngx.var.uri

    if ngx.var.args ~= nil then
        uri = uri .. "?" .. ngx.var.args
    end

end
