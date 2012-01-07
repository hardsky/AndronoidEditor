// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle {
    id: page
    width: 800
    height: 620
    color: "#343434"

    Rectangle{
        id: topToolbar
        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.width
        height: 20
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
                    onClicked: ctrGridMosaic.changeDimensions(txtRows.text, txtCols.text)
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
                onClicked: ctrGridMosaic.parseMosaic()
            }
        }
    }

    Rectangle {
        id: mosaic
        width: 596
        height: 597
        color: "#00000000"
        border.color: "#1c841c"
        anchors.left: parent.left
        anchors.leftMargin: 1
        anchors.top: topToolbar.bottom
        anchors.topMargin: 1

        GridMosaic {
            id: ctrGridMosaic
            anchors.fill: parent
        }
    }

    Rectangle {
        id: navig
        width: 200
        height: 597
        color: "#00000000"
        border.color: "#1c841c"
        anchors.top: topToolbar.bottom
        anchors.topMargin: 1
        anchors.left: mosaic.right
        anchors.leftMargin: 2

        Bricks {
            id: ctrBricks
            width: 196
            height: 140
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 2
            onBrickPathChanged: ctrGridMosaic.brickPath = brickPath
        }

        Backgrounds {
            id: ctrBackgrounds
            keyNavigationWraps: true
            contentWidth: 196
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: ctrBricks.bottom
            anchors.topMargin: 2
            onBgPathChanged: ctrGridMosaic.backgroundPath = bgPath
        }
    }
}
