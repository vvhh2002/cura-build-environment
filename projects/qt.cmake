set(qt_url http://download.qt.io/official_releases/qt/5.9/5.9.9/single/qt-everywhere-opensource-src-5.9.9.tar.xz)
set(qt_md5 97e81709b57e82ab2b279408eaa9270e)

if(BUILD_OS_WINDOWS)
    # For some as of yet unknown reason, building Qt on Windows fails because it does not create moc targets.
    # Due to that we install the PyQt wheel into the built Python manually.
    return()
endif()

set(qt_options
    -release
    -prefix ${CMAKE_INSTALL_PREFIX}
    -archdatadir ${CMAKE_INSTALL_PREFIX}/lib
    -datadir ${CMAKE_INSTALL_PREFIX}/share
    -opensource
    -confirm-license
    -nomake examples
    -nomake tests
    -nomake tools
    -no-cups
    -no-sql-db2
    -no-sql-ibase
    -no-sql-mysql
    -no-sql-oci
    -no-sql-odbc
    -no-sql-psql
    -no-sql-sqlite
    -no-sql-sqlite2
    -no-sql-tds
    -skip qtconnectivity
    -skip qtdoc
    -skip qtlocation
    -skip qtmultimedia
    -skip qtscript
    -skip qtsensors
    -skip qtwebchannel
    -skip qtwebengine
    -skip qtwebsockets
    -skip qtandroidextras
    -skip qtactiveqt
    -skip qttools
    -skip qtxmlpatterns
    -skip qt3d
    -skip qtcanvas3d
    -skip qtserialport
    -skip qtwayland
    -skip qtgamepad
    -skip qtscxml
)

if(BUILD_OS_OSX)
    list(APPEND qt_options -no-framework)
elseif(BUILD_OS_LINUX)
    list(APPEND qt_options -no-gtk -no-rpath -qt-xcb)
endif()

if(BUILD_OS_LINUX)
    ExternalProject_Add(Qt
        URL ${qt_url}
        URL_MD5 ${qt_md5}
        PATCH_COMMAND patch -p1 < ${CMAKE_SOURCE_DIR}/projects/fix_qt_eglfs_device.patch
        CONFIGURE_COMMAND ./configure ${qt_options}
        BUILD_COMMAND make -j${N}
        BUILD_IN_SOURCE 1
    )
else()
    ExternalProject_Add(Qt
        URL ${qt_url}
        URL_MD5 ${qt_md5}
        CONFIGURE_COMMAND ./configure ${qt_options}
        BUILD_IN_SOURCE 1
    )
endif()