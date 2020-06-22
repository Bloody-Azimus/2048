#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <stdlib.h>
#include <time.h>

#include "game.h"
#include "board.h"
#include "tile.h"
#include "qtile.h"


int main(int argc, char *argv[])
{
    srand(time(NULL)); // генератор случайных чисел

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling); //повышение плотности пикселизации
    QGuiApplication app(argc, argv);

    Qtile aQtile;

    aQtile.restartGame();

    QQmlApplicationEngine engine; //qml движок
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("vueObjetCpt",&aQtile);
    engine.load(url);

    return app.exec();
}
