import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick 2.3
import QtQuick.Window 2.2
import Qt.labs.settings 1.0
import QtQuick 2.14

// Окно отображения игры
Window {
    id: window
    visible: true
    width: 600
    height: 600
    color: "#efe9e9"
    title: qsTr("2048")

    signal update() // Обновление дисплея
    // Игровая доска
    Panel {
        id: gamepanel
        visible: true
        focus: true

        // Действия во время команд клавиш клавиатуры
        Keys.onPressed: {
            switch (event.key) {
            case Qt.Key_Up:
                vueObjetCpt.performMove(1);
                window.update();
                break;
            case Qt.Key_Down:
                vueObjetCpt.performMove(2);
                window.update();
                break;
            case Qt.Key_Left:
                vueObjetCpt.performMove(3);
                window.update();
                break;
            case Qt.Key_Right:
                vueObjetCpt.performMove(4);
                window.update();
                break;
            case Qt.Key_Space:
                vueObjetCpt.restartGame();
                window.update();
                break;
            case Qt.Key_W:
                vueObjetCpt.performMove(1);
                window.update();
                break;
            case Qt.Key_S:
                vueObjetCpt.performMove(2);
                window.update();
                break;
            case Qt.Key_A:
                vueObjetCpt.performMove(3);
                window.update();
                break;
            case Qt.Key_D:
                vueObjetCpt.performMove(4);
                window.update();
                break;
            case Qt.Key_Escape:
                window.close();
                break;
            }
        }
    }


    // Панель управления игрой
    Command{
        id: panelcommand
    }

}
