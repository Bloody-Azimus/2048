#include "qtile.h"
#include <QString>
#include <QDebug>

#include "game.h"

// создаём Qtile
Qtile::Qtile(QObject *parent) : QObject(parent)
{
    currentGame = new Game;
}

// Запуск новой игры
void Qtile::restartGame()
{
    currentGame->restartGame();
    gameIsWon = false;
    gameIsOver = false;
    emit ChangeWinStatus();
    emit ChangeOverStatus();
}

// Возвращает число, содержащееся в поле, как QString для отображения
QString Qtile::readValue(int index)
{
    QString qValue = currentGame->getGameBoard()->getTileValue(index);
    return (qValue);
}

// Возвращает цвет для отображения в поле в соответствии со значением, которое он содержит
QColor Qtile::readColor(int index)
{
    int valueForColor = currentGame->getGameBoard()->getTileValueForColor(index);
    QColor color;
    switch(valueForColor)
    {
        case 0: color = "#ccc0b2"; break;
        case 2: color = "#F4ECE4"; break;
        case 4: color = "#ece0c8"; break;
        case 8: color = "#f2b179"; break;
        case 16: color = "#f59563"; break;
        case 32: color = "#f57c5f"; break;
        case 64: color = "#f95c3b"; break;
        case 128: color = "#edce71"; break;
        case 256: color = "#eecc61"; break;
        case 512: color = "#ebc850"; break;
        case 1024: color = "#edc53f"; break;
        case 2048: color = "#eec22e"; break;
        case 4096: color = "#3d3a33"; break;
        case 8192: color = "#3d3a33"; break;
        case 16384: color = "#3d3a33"; break;
        default: color = "#ccc0b2"; break;
    }
    return color;
}

// Возвращает счет для отображения
QString Qtile::getScore()
{
    int gameScore = currentGame->getGameScore();
    return (QString::number(gameScore));
}

// Выполняет перемещение плитки в соответствии с направлением движения
void Qtile::performMove(int direction)
{
    if (direction == 1){
        currentGame->move(UP);
    }
    if (direction == 2){
        currentGame->move(DOWN);
    }
    if (direction == 3){
        currentGame->move(LEFT);
    }
    if (direction == 4){
        currentGame->move(RIGHT);
    }
    gameIsWon = currentGame->isGameWon();
    if (gameIsWon) emit ChangeWinStatus();

    gameIsOver = currentGame->isGameOver();
    if (gameIsOver)
    {
        emit ChangeOverStatus();
    }
}

// Возвращает переменную, которая позволяет узнать, выиграна ли игра (достигнут 2048)
bool Qtile::GameIsWon()
{
    return gameIsWon;
}

// Возвращает переменную, которая сообщает, закончена ли игра (возможно больше ходов)
bool Qtile::GameIsOver()
{
    return gameIsOver;
}
