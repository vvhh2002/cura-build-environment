ExternalProject_Add(PythonUrllib3
    URL https://files.pythonhosted.org/packages/4c/13/2386233f7ee40aa8444b47f7463338f3cbdf00c316627558784e3f542f07/urllib3-1.25.3.tar.gz
    URL_MD5 f09e95a5c42a7cc7ff7cb6a14c55fb69
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Python3_EXECUTABLE} setup.py build
    INSTALL_COMMAND ${Python3_EXECUTABLE} setup.py install --single-version-externally-managed --record=urllib3-install.log
    BUILD_IN_SOURCE 1
)
SetProjectDependencies(TARGET PythonUrllib3 DEPENDS Python)
