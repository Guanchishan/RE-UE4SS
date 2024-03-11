local projectName = "SinglePassSigScanner"

target(projectName)
    set_kind("static")
    set_languages("cxx20")
    set_exceptions("cxx")

    add_includedirs("include", { public = true })
    add_headerfiles("include/**.hpp")

    add_files("src/**.cpp")
    
    add_deps("Profiler")

    on_load(function (target)
        import("target_helpers", { rootdir = get_config("ue4ssRoot") })
        
        print("Project: " .. projectName .. " (STATIC)")

        target:add("defines", target_helpers.project_name_to_exports_define(projectName))
        target:add("defines", target_helpers.project_name_to_build_static_define(projectName), { public = true })
    end)