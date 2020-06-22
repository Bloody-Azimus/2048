import QtQuick 2.0

// Отображение счета
Rectangle
{
    id: score
    color: "#ccc0b2"
    visible: true
    width: parent.width/2
    height: 30
    radius: 3

    anchors {
        right: parent.right; rightMargin: 5
        top: parent.top; topMargin: 5
    }

    // Текстовая зона
    Text
    {
        id: scoredisplay
        anchors.fill: parent
        text: " Счёт : " + vueObjetCpt.getScore()
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.family: "Verdana"
        font.pixelSize: 16
    }

    // функция обновления отображения счета
    function scoreUpdate()
    {
        scoredisplay.text = " Счёт : " + vueObjetCpt.getScore()
    }

    // Связь с логической частью программы
    Connections
    {
        target: window
        onUpdate:
        {
            scoreUpdate();
        }
    }
}



