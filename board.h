#ifndef BOARD_H
#define BOARD_H
#include "tile.h"

#include <QVector>
#include <QString>
#include <QDebug>

using namespace std;

class Tile;

enum Direction {UP, DOWN, LEFT, RIGHT};

class Board
{
public:
    Board(int rowCount, int colCount, double valueThr = 0.3);
    Board(const Board& otherBoard);
    ~Board();

    // Открытые методы, к которым обращается класс Game
    void resetBoard(); // Сбросить доску до начала игрового состояния
    int getRowCount() {return rows;}
    int getColCount() {return cols;}
    Tile* getTile(int row, int col);
    QString getTileValue(int tileIndex); // Возврат значения плитки по индексу в форме QString
    int getTileValueForColor(int tileIndex);
    void move(Direction dir); // Выполнить движение в заданном направлении
    bool isFull() const; // Проверка - заполнена ли доска
    int getPointsScoredLastMove() const {return pointsScoredLastMove;}
    bool getTileCollisionLastMove() const {return tileCollisionLastMove;}
    bool canMove() const;

private:
    int rows;
    int cols;
    double valueThr; // Вероятность появления 4 вместо 2
    QVector<QVector<Tile*>> tileBoard;
    int pointsScoredLastMove;
    bool tileCollisionLastMove;

    // Частные внутренние методы, которые изменяют состояние
    void initRandomTile();
    void initBoard(); // Создать пустую доску
    bool onBoard(int row, int col); // Проверяет, находятся ли заданные координаты в пределах досок
    void moveVertically(int row, int col, Direction dir);
    void moveHorizontally(int row, int col, Direction dir);
    void handleCollision(int collRow, int collCol); // контроллер столкновения двух плиток
    bool changedState(Board& otherBoard) const; // Проверяет, отличается ли доска от доски аргументов
    void endCurrentMove(); // Сбрасывает некоторые параметры перед следующим ходом
};

#endif // BOARD_H
