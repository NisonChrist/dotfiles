local URL = {}

URL.github = function(x)
	return "https://github.com/" .. x
end

URL.codeberg = function(x)
	return "https://codeberg.org/" .. x
end

return URL
