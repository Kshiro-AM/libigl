project "libigl"
    kind "StaticLib"
    language "C++"
    characterset "MBCS"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "include/igl/*.h",
        "include/igl/*.hpp",
        "include/igl/*.c",
        "include/igl/*.cpp",
        "include/igl/opengl/**.h",
        "include/igl/opengl/**.hpp",
        "include/igl/opengl/**.c",
        "include/igl/opengl/**.cpp",
    }

    includedirs
    {
        "include",
        "../eigen",
        "../glad/include",
        "../glfw/include",
        "../imgui",
        "../stb",
        "../ImGuizmo"
    }

    defines
    {
        "IGL_STATIC_LIBRARY",
        "WIN32"
    }

    filter { "system:windows", "action:vs*" }
        buildoptions {"/bigobj"}

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

    filter "configurations:Debug"
        symbols "On"
    filter "configurations:Release"
        optimize "On"