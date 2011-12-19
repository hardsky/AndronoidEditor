// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Grid {
    id: gridMosaic
    spacing: 1
    rows: 10
    columns: 10
    property color colorCode: "lightgreen"
    Repeater {
        model: 100
        Rectangle{
            width: 50
            height: 50
            color: "lightgreen"

            MouseArea {
                anchors.fill: parent
                onClicked: parent.color = gridMosaic.colorCode
            }

        }
    }
}
