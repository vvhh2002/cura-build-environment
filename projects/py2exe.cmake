ExternalProject_Add(py2exe
    URL http://thopiekar.synology.me/dl/py2exe-0.9.2.2-dllfix.zip
    URL_MD5 7fb77ff74079815db8616cbd5a980f3d
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${PYTHON_EXECUTABLE} setup.py build
    INSTALL_COMMAND ${PYTHON_EXECUTABLE} setup.py install --single-version-externally-managed --record=cxfreeze-install.log
    BUILD_IN_SOURCE 1
)
SetProjectDependencies(TARGET py2exe DEPENDS Python)
