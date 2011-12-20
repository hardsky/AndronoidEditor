// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Image{
    id: gridBackground
    property string brickPath: ""
    property alias backgroundPath: gridBackground.source
    source: "backgrounds/back_1.png"
    anchors.fill: parent

    Grid {
        id: gridMosaic
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 1
        rows: 10
        columns: 10

        Repeater {
            model: 100
            Rectangle{
                width: 50
                height: 50
                color: "#00000000"
                opacity: 1
                border.color: "lightgreen"
                border.width: 1

                Image{
                    id: mosaicBrick
                    source: ""
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: mosaicBrick.source = (mosaicBrick.source == gridBackground.brickPath) ? "": gridBackground.brickPath
                }
            }
        }
    }

}

