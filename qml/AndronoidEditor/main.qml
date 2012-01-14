// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle {
    id: page

    width: 800
    height: 620
    color: "#343434"

    TopToolbar{
        id: topToolbar

        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.width
        height: 20
    }

    GridMosaic{
        id: mosaic

        width: 596
        height: 597
        color: "#00000000"
        border.color: "#1c841c"
        anchors.left: parent.left
        anchors.leftMargin: 1
        anchors.top: topToolbar.bottom
        anchors.topMargin: 1
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
            onBrickPathChanged: mosaic.brickPath = brickPath
        }

        Backgrounds {
            id: ctrBackgrounds

            width: 196
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: ctrBricks.bottom
            anchors.topMargin: 2
            onBgPathChanged: mosaic.backgroundPath = bgPath
        }
    }
}
