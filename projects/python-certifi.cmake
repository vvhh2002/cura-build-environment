ExternalProject_Add(PythonCertifi
    URL https://files.pythonhosted.org/packages/c5/67/5d0548226bcc34468e23a0333978f0e23d28d0b3f0c71a151aef9c3f7680/certifi-2019.6.16.tar.gz
    URL_MD5 af8fea5f3df6f7f81e9c6cbc6dd7c1e8
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${PYTHON_EXECUTABLE} setup.py build
    INSTALL_COMMAND ${PYTHON_EXECUTABLE} setup.py install --single-version-externally-managed --record=certifi-install.log
    BUILD_IN_SOURCE 1
)
SetProjectDependencies(TARGET PythonCertifi DEPENDS Python)
