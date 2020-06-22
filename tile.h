#ifndef TILE_H
#define TILE_H

#define VALUE_MULTIPLIER 2 // Определяет макрос для умножения значения плитки

class Tile
{
public:
    Tile(int initValue) {value = initValue;}
    Tile(const Tile& otherTile) {value = otherTile.value;}

    int getValue() {return value;}
    void setValue(int newValue) {value = newValue;}
    void upgradeTile() {value *= VALUE_MULTIPLIER;} // Обновляет значение плитки
    void setUpgradedThisMove(bool newBool) {this->upgradedThisMove = newBool;}
    bool getUpgradedThisMove() const {return this->upgradedThisMove;}

private:
    int value;
    bool upgradedThisMove; // Это позволяет избежать нескольких обновлений за один ход
};

#endif // TILE_H
