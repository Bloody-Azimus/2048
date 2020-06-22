QT += quick

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        board.cpp \
        game.cpp \
        main.cpp \
        qtile.cpp \
        tile.cpp

RESOURCES += qml.qrc

# Дополнительный путь импорта, используемый для разрешения модулей QML в модели кода Qt Creator
QML_IMPORT_PATH =

# Дополнительный путь импорта, используемый для разрешения модулей QML только для Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Правила по умолчанию для развертывания.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    board.h \
    game.h \
    qtile.h \
    tile.h
