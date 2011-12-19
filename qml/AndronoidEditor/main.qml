// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle {
    id: page
    width: 800
    height: 600
    color: "#343434"

    Rectangle {
        id: mosaic
        width: 596
        height: 597
        color: "#00000000"
        border.color: "#1c841c"
        anchors.left: parent.left
        anchors.leftMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 1

        GridMosaic {
            id: ctrGridMosaic
            anchors.centerIn: parent
        }
    }

    Rectangle {
        id: navig
        width: 200
        height: 597
        color: "#00000000"
        border.color: "#1c841c"
        anchors.top: parent.top
        anchors.topMargin: 1
        anchors.left: mosaic.right
        anchors.leftMargin: 2

        Bricks {
            id: ctrBricks
            contentWidth: 196
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 2
            onColorCodeChanged: ctrGridMosaic.colorCode = colorCode
        }

        Backgrounds {
            id: ctrBackgrounds
            contentWidth: 196
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: ctrBricks.bottom
            anchors.topMargin: 2
        }
    }
}
