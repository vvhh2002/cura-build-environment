ExternalProject_Add(PythonRequests
    URL https://github.com/requests/requests/archive/v2.22.0.tar.gz
    URL_MD5 b32e3383fbcd173e515883b6631a2eed
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Python3_EXECUTABLE} setup.py build
    INSTALL_COMMAND ${Python3_EXECUTABLE} setup.py install --single-version-externally-managed --record=requests-install.log
    BUILD_IN_SOURCE 1
)
SetProjectDependencies(TARGET PythonRequests DEPENDS Python)
