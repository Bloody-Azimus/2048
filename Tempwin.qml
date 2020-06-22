import QtQuick 2.0

// Показывает, когда игра выиграна, и можно продолжать играть
Rectangle
{
    id: gamewon
    anchors.fill: parent
    color: "#bbada0"
    radius: 3
    opacity: 0.7

    // Текстовая зона
    Text {
        id: textwin
        anchors.fill: parent
        color: "#766d65"
        text: qsTr("ИГРА ЗАКОНЧЕНА, ВЫ ВЫИГРАЛИ!")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 24
    }

}
