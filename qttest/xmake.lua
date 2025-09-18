set_version("1.0.0")
add_rules("mode.debug", "mode.release")

includes("@builtin/xpack")

add_requires("qt5widgets")

target("qttest")
    add_rules("qt.widgetapp")
    add_packages("qt5widgets")

    add_includedirs("include")
    add_headerfiles("include/*.h")
    add_files("src/*.cpp")
    add_files("src/mainwindow.ui")
    -- add files with Q_OBJECT meta (only for qt.moc)
    add_files("include/mainwindow.h")
   
   
  xpack("qttest")
    --set_formats("zip", "targz", "srczip", "srctargz")
    set_formats("appimage", "runself")
    set_title("qttest")
    set_author("wgx")
    set_description("A test installer.")
    set_homepage("https://xmake.io")
    set_licensefile("LICENSE.md")
    set_iconfile("src/xmake.png")
    add_targets("qttest")
    add_installfiles("src/(assets/*.png)", {prefixdir = "images"})
    add_sourcefiles("(src/**)")
    -- set_iconname("xmake")
    --set_iconname("xmake")

    after_installcmd(function (package, batchcmds)
        batchcmds:mkdir(package:installdir("resources"))
        batchcmds:cp("src/assets/*.txt", package:installdir("resources"), {rootdir = "src"})
        batchcmds:mkdir(package:installdir("stub"))
    end)

    after_uninstallcmd(function (package, batchcmds)
        batchcmds:rmdir(package:installdir("resources"))
        batchcmds:rmdir(package:installdir("stub"))
    end)
