set(pyqt_command "")
if(BUILD_OS_WINDOWS)
    add_custom_target(PyQt
        COMMAND ${Python3_EXECUTABLE} -m pip install PyQt5==5.9.2
        COMMENT "Installing PyQt5"
    )

    SetProjectDependencies(TARGET PyQt DEPENDS Python)
else()
    if(BUILD_OS_OSX)
        set(pyqt_command
            "DYLD_LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/lib"
            ${Python3_EXECUTABLE} configure.py
            --sysroot ${CMAKE_INSTALL_PREFIX}
            --qmake ${CMAKE_INSTALL_PREFIX}/bin/qmake
            --sip ${CMAKE_INSTALL_PREFIX}/bin/sip
            --confirm-license
        )
    else()
        set(pyqt_command
            # On Linux, PyQt configure fails because it creates an executable that does not respect RPATH
            "LD_LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/lib"
            ${Python3_EXECUTABLE} configure.py
            --sysroot ${CMAKE_INSTALL_PREFIX}
            --qmake ${CMAKE_INSTALL_PREFIX}/bin/qmake
            --sip ${CMAKE_INSTALL_PREFIX}/bin/sip
            --confirm-license
        )
    endif()

    ExternalProject_Add(PyQt
        URL https://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-5.9.2/PyQt5_gpl-5.9.2.tar.gz
        URL_MD5 33d6d2ab8183da17ac18b8132a4b278e
        CONFIGURE_COMMAND ${pyqt_command}
        BUILD_COMMAND make -j${N}
        BUILD_IN_SOURCE 1
    )

    SetProjectDependencies(TARGET PyQt DEPENDS Qt Sip)

endif()
