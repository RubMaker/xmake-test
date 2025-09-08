add_rules("mode.debug", "mode.release")

add_requires("qt5widgets")

target("test")
    add_rules("qt.widgetapp")
    add_packages("qt5widgets")

    add_includedirs("include")
    add_headerfiles("include/*.h")
    add_files("src/*.cpp")
    add_files("src/mainwindow.ui")
    -- add files with Q_OBJECT meta (only for qt.moc)
    add_files("include/mainwindow.h")