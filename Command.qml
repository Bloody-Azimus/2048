import QtQuick 2.0

// Область управления игрой
Rectangle {
    id: panelcommand

    height: 90
    color: "transparent"
    radius: 5

    anchors {
        right: parent.right; rightMargin: 5
        left: parent.left; leftMargin: 5
        top: parent.top; topMargin: 5
    }

    // Область отображения заголовка
    Rectangle {
        id: header
        width: 80
        height: 70
        color: "transparent" //"#F4ECE4"
        radius: 5

        anchors {
            left: parent.left; leftMargin: 15
            top: parent.top; topMargin: 5
        }

        // Текстовая зона
        Text {

            anchors.fill: parent
            color: "#eea15d"
            text: "ИГРА \n2048"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Verdana"
            font.bold: true
            font.pixelSize: 32
        }

    }

    // Область отображения счета
    Score{
        id : score
    }

    // Область отображения кнопки «NewGameButton»
    NewGameButton {
        id: newgame
    }

}

