import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick 2.14

// Игровая доска
Rectangle {
    // Игровая панель
    id: gamepanel
    property int col: 4
    property int row: 4

    radius: 3;

    anchors {
        right: parent.right; rightMargin: 5
        left: parent.left; leftMargin: 5
        bottom: parent.bottom; bottomMargin: 5
        top: parent.top; topMargin: 100
    }
    color: "#bbada0"

    // Сетка игровых боксов
    Grid {
        id: grid
        anchors.fill: parent;
        columns: col;
        rows: row;
        Repeater {
            model: grid.columns * grid.rows;

            // Сетка
            Case {
                num: index
                width: grid.width / grid.columns;
                height: grid.height / grid.rows;


            }
        }
    }


    // Отображет, когда игра выиграна, и больше нет возможных ходов.
    Win{
        id:gamewon

        opacity: 0.0
        states: [
                State { when: vueObjetCpt.gameIsWon & vueObjetCpt.gameIsOver;
                    PropertyChanges {   target: gamewon; visible:true; opacity: 0.8    }
                },
                State { when: !vueObjetCpt.gameIsWon & !vueObjetCpt.gameIsOver;
                    PropertyChanges {   target: gamewon; visible:false; opacity: 0.0    }
                }
            ]
        transitions: Transition {
            NumberAnimation { property: "opacity"; duration: 500}
        }

    }

    // Показывает, когда игра проиграна
    Lose{
        id:gamelost

        opacity: 0.0

        states: [
             State { when: !vueObjetCpt.gameIsWon & vueObjetCpt.gameIsOver;
                PropertyChanges {   target: gamelost; visible:true; opacity: 0.8    }
            },

            State { when: !vueObjetCpt.gameIsWon & !vueObjetCpt.gameIsOver;
               PropertyChanges {   target: gamelost; visible:false; opacity: 0.0    }
            }
        ]
        transitions: Transition {
            NumberAnimation { property: "opacity"; duration: 500}
        }
    }

    // Показывает, когда игра выиграна, и можно продолжить
    Tempwin{
        id:gametempwin

        opacity: 0.0
        states: [
                State { when: vueObjetCpt.gameIsWon & !vueObjetCpt.gameIsOver;
                    PropertyChanges {   target: gametempwin; visible:true; opacity: 0.8    }
                },
                State { when: !vueObjetCpt.gameIsWon & !vueObjetCpt.gameIsOver;
                    PropertyChanges {   target: gametempwin; visible:false; opacity: 0.0    }
                }
            ]
        transitions: Transition {
            NumberAnimation { property: "opacity"; duration: 500}
        }
    }

}


