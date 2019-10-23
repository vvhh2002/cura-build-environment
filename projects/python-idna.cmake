ExternalProject_Add(PythonIdna
    URL https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz
    URL_MD5 2e9ae0b4a0b26d1747c6127cdb060bc1
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${PYTHON_EXECUTABLE} setup.py build
    INSTALL_COMMAND ${PYTHON_EXECUTABLE} setup.py install --single-version-externally-managed --record=idna-install.log
    BUILD_IN_SOURCE 1
)
SetProjectDependencies(TARGET PythonIdna DEPENDS Python)
