ExternalProject_Add(PythonChardet
    URL https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz
    URL_MD5 7dd1ba7f9c77e32351b0a0cfacf4055c
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Python3_EXECUTABLE} setup.py build
    INSTALL_COMMAND ${Python3_EXECUTABLE} setup.py install --single-version-externally-managed --record=chardet-install.log
    BUILD_IN_SOURCE 1
)
SetProjectDependencies(TARGET PythonChardet DEPENDS Python)
