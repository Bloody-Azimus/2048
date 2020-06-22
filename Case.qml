import QtQuick 2.0

// Игровая сетка
Rectangle{
    id: creationcase
    color: "transparent"
    visible: true

    property int num ;

    // Текстовый прямоугольник
    Rectangle
    {
        id: fondcase
        anchors.fill: parent
        color: vueObjetCpt.readColor(num) //"#ccc0b2"
        radius: 3
        anchors.rightMargin: 4
        anchors.leftMargin: 4
        anchors.bottomMargin: 4
        anchors.topMargin: 4

        // Текстовое поле для отображения номера поля
        Text
        {
            id: casenum
            x: 30
            y: 30

            text: vueObjetCpt.readValue(num)

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.family: "Tahoma"
            font.pixelSize: 50
        }

    }

    // Функция для обновления цвета и значения поля
    function caseUpdate()
    {
        casenum.text = vueObjetCpt.readValue(num)
        fondcase.color = vueObjetCpt.readColor(num)
    }

    // Ссылка с логической частью для обновления коробки
    Connections
    {
        target: window
        onUpdate:
        {
            caseUpdate();
        }
    }



}


