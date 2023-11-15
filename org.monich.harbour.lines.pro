TARGET = org.monich.harbour.lines
CONFIG += link_pkgconfig
CONFIG += sailfishapp
PKGCONFIG += glib-2.0 mlite5
QMAKE_CXXFLAGS += -Wno-unused-parameter -Wno-psabi
QT += qml quick
LIBS += -ldl

CONFIG(debug, debug|release) {
    DEFINES += DEBUG HARBOUR_DEBUG
    QMAKE_CXXFLAGS_DEBUG *= -O0
    QMAKE_CFLAGS_DEBUG *= -O0
}

SOURCES += \
    src/LinesBalls.cpp \
    src/LinesDir.cpp \
    src/LinesPrefs.cpp \
    src/LinesScores.cpp \
    src/LinesSet.cpp \
    src/LinesState.cpp \
    src/main.cpp \
    src/QuickLinesColors.cpp \
    src/QuickLinesGame.cpp \
    src/QuickLinesModel.cpp \
    src/QuickNextBallsModel.cpp \
    src/QuickScoresModel.cpp

HEADERS += \
    src/LinesBalls.h \
    src/LinesScores.h \
    src/LinesSet.h \
    src/LinesState.h \
    src/LinesPrefs.h \
    src/LinesTypes.h \
    src/QuickLines.h \
    src/QuickLinesColors.h \
    src/QuickLinesGame.h \
    src/QuickLinesModel.h \
    src/QuickNextBallsModel.h \
    src/QuickScoresModel.h

OTHER_FILES += \
    LICENSE \
    README.md \
    $${TARGET}.desktop \
    icons/*.svg \
    qml/common/*.qml \
    qml/common/images/*.svg \
    qml/common/sounds/*.wav \
    qml/common/styles/ball/*.svg \
    qml/common/styles/shape/*.svg \
    qml/sailfish/*.qml \
    qml/sailfish/cover/*.qml \
    qml/sailfish/images/*.svg \
    rpm/org.monich.harbour.lines.changes \
    rpm/org.monich.harbour.lines.spec \
    translations/*.ts

# harbour-lib

HARBOUR_LIB_REL = harbour-lib
HARBOUR_LIB_DIR = $${_PRO_FILE_PWD_}/$${HARBOUR_LIB_REL}
HARBOUR_LIB_INCLUDE = $${HARBOUR_LIB_DIR}/include
HARBOUR_LIB_SRC = $${HARBOUR_LIB_DIR}/src
HARBOUR_LIB_QML = $${HARBOUR_LIB_DIR}/qml

INCLUDEPATH += \
    $${HARBOUR_LIB_DIR}/include

HEADERS += \
    $${HARBOUR_LIB_INCLUDE}/HarbourDebug.h \
    $${HARBOUR_LIB_INCLUDE}/HarbourImageProvider.h \
    $${HARBOUR_LIB_INCLUDE}/HarbourJson.h \
    $${HARBOUR_LIB_INCLUDE}/HarbourSystem.h \
    $${HARBOUR_LIB_INCLUDE}/HarbourTheme.h

SOURCES += \
    $${HARBOUR_LIB_SRC}/HarbourImageProvider.cpp \
    $${HARBOUR_LIB_SRC}/HarbourJson.cpp \
    $${HARBOUR_LIB_SRC}/HarbourSystem.cpp \
    $${HARBOUR_LIB_SRC}/HarbourTheme.cpp

HARBOUR_QML_COMPONENTS = \
    $${HARBOUR_LIB_QML}/HarbourPressEffect.qml \
    $${HARBOUR_LIB_QML}/HarbourTextFlip.qml

OTHER_FILES += $${HARBOUR_QML_COMPONENTS}

qml_components.files = $${HARBOUR_QML_COMPONENTS}
qml_components.path = /usr/share/$${TARGET}/qml/harbour
INSTALLS += qml_components

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += \
    translations/org.monich.harbour.lines.ts \
    translations/org.monich.harbour.lines-hu.ts \
    translations/org.monich.harbour.lines-nl.ts \
    translations/org.monich.harbour.lines-ru.ts \
    translations/org.monich.harbour.lines-sv.ts \
    translations/org.monich.harbour.lines-zh_CN.ts
