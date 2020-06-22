#ifndef GAME_H
#define GAME_H

#define WIN_VALUE 2048 // Опредяет макрос для значения выигрыша

#include "board.h"


class Game
{
public:
    Game(int rowCount = 4, int colCount = 4);
    ~Game();
    void restartGame(); // Сбросить всю игру
    Board* getGameBoard() const {return gameBoard;}
    void move(Direction dir); // Движение в указанном направлении ВВЕРХ, ВНИЗ, ВЛЕВО или ВПРАВО
    int getGameScore() const {return gameScore;}
    bool isGameOver(){return gameOver;}
    bool isGameWon();

private:
    Board* gameBoard;
    int gameScore;
    bool gameOver;
};
#endif // GAME_H
