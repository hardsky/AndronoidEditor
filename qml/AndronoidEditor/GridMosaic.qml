// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0
import MosaicModule 1.0
import "GridMosaic.js" as MosaicFunctions

Rectangle {

    id: componentMosaic
    property string brickPath: ""
    property alias backgroundPath: gridBackground.source
    signal changeDimensions(int nRows, int nCols)
    onChangeDimensions: {
        brickRpt.model = nRows*nCols;
        gridMosaic.rows = nRows;
        gridMosaic.columns = nCols;
    }
    signal parseMosaic()
    Component.onCompleted: {
        componentMosaic.parseMosaic.connect(MosaicFunctions.parseMosaic)
    }


    Image{
        id: gridBackground
        source: "backgrounds/back_1.png"
        anchors.fill: parent

        XmlMosaic{
            id: mosaic
        }

        Grid {
            id: gridMosaic
            anchors.centerIn: parent
            spacing: 1
            rows: 10
            columns: 10

            Repeater {
                id: brickRpt
                model: 100
                Rectangle{
                    id: wrapper
                    width: 50
                    height: 50
                    color: "#00000000"
                    opacity: 1
                    border.color: "lightgreen"
                    border.width: 1

                    Image{
                        id: mosaicBrick
                        source: ""
                        anchors.fill: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: mosaicBrick.source = (mosaicBrick.source == componentMosaic.brickPath) ? "": componentMosaic.brickPath
                    }
                }
            }
        }
    }
}
