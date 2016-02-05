local lunit = require "lunit"
local OAuth = require "OAuth"

if _VERSION >= "Lua 5.2" then
	_ENV = lunit.module("simple","seeall")
else
	module(..., package.seeall, lunit.testcase)
end


function test()
	print("\nTest: net error\n")
	local client = OAuth.new("anonymous", "anonymous", {
		RequestToken = "http://127.0.0.1:12345/foo",
		AuthorizeUser = {"http://127.0.0.1:12345/bar", method = "GET"},
		AccessToken = "http://127.0.0.1:12345/baz"
	})

	local ok, err_msg = client:RequestToken()
	assert(not ok)
	assert_equal("connection refused", err_msg)
end
