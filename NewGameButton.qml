import QtQuick 2.0
import QtQuick 2.14


// Кнопка Новая игра
Rectangle {
    id: newgame
    width: parent.width/2
    height: 30
    color: "#bbada0"
    //color: "#8c7963"
    radius: 3

    anchors {
        right: parent.right; rightMargin: 5
        top: parent.top; topMargin: 40
    }

    // Текстовая зона
    Text {

        anchors.fill: parent
        color: "#F4ECE4"
        text: "Рестарт"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 12
    }


    // Место, где пользователь может нажать, чтобы начать новую игру
    MouseArea {
        id: newgamemouseArea
        anchors.fill: parent;
        onClicked:
        {
            vueObjetCpt.restartGame();
            window.update();
        }
}
}

