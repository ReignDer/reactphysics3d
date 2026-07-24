target("ReactPhysics")
	set_kind("static")
	set_languages("cxx23")

	set_targetdir ("bin/" .. outputdir .. "/ReactPhysics")
	set_objectdir ("bin-int/" .. outputdir .. "/ReactPhysics")

	add_headerfiles(
        "include/**.h"


	)

	add_files(
		"src/**.cpp"

	)

	if is_os("windows") then
		add_defines("WINVER=0x0A00")
		add_defines("_WIN32_WINNT=0x0A00") 
		
	end

	if is_mode("debug") then
		set_runtimes("MTd")
		set_symbols("debug")
	end

	if is_os("windows") and is_mode("asan") then
		set_runtimes("MTd")
		set_symbols("debug")
	end
	
	if is_mode("release") then
		set_runtimes("MT")
		set_optimize("fastest")
	end
