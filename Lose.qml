import QtQuick 2.0

// Показать, когда игра проиграна
Rectangle
{
    id: gamelost
    anchors.fill: parent
    color: "#bbada0"
    radius: 3
    opacity: 0.7

    // Текстовая зона
    Text {
        id: textlost
        anchors.fill: parent
        color: "#766d65"
        text: qsTr("ВЫ ПРОИГРАЛИ!")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 24
    }

}
