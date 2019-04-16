-- scaffold geniefile for boostache

boostache_script = path.getabsolute(path.getdirectory(_SCRIPT))
boostache_root = path.join(boostache_script, "boostache")

boostache_includedirs = {
	path.join(boostache_script, "config"),
	boostache_root,
}

boostache_libdirs = {}
boostache_links = {}
boostache_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { boostache_includedirs }
	end,

	_add_defines = function()
		defines { boostache_defines }
	end,

	_add_libdirs = function()
		libdirs { boostache_libdirs }
	end,

	_add_external_links = function()
		links { boostache_links }
	end,

	_add_self_links = function()
		links { "boostache" }
	end,

	_create_projects = function()

project "boostache"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		boostache_includedirs,
	}

	defines {}

	files {
		path.join(boostache_script, "config", "**.h"),
		path.join(boostache_root, "**.h"),
		path.join(boostache_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
