// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle{
    Row{
        Text{text: "Строки:"}

        Rectangle{
            border.width: 1
            width: 80
            height: 20
            TextInput {
                id: txtRows
                font.pixelSize: 12
                anchors.fill: parent
            }
        }

        Text{text: "Колонки:"}

        Rectangle{
            border.width: 1
            width: 80
            height: 20

            TextInput {
                id: txtCols
                font.pixelSize: 12
                anchors.fill: parent
            }
        }

        Rectangle{
            border.width: 1
            radius: 5
            width: 150
            height:20
            Text{text: "Применить!"}
            MouseArea{
                anchors.fill: parent
                onClicked: mosaic.changeDimensions(txtRows.text, txtCols.text)
            }
        }
    }
    Rectangle{
        border.width: 1
        radius: 5
        width: 150
        height:20
        anchors.right: parent.right
        Text{text: "Сохранить!"}
        MouseArea{
            anchors.fill: parent
            onClicked: mosaic.parseMosaic()
        }
    }
}
