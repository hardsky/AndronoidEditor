// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

GridView {
    id: gvBricks
    width: 196
    height: 140
    boundsBehavior: Flickable.StopAtBounds
    cellHeight: 70
    cellWidth: 70
    property color colorCode: "lightgreen"

    delegate: Item {
        x: 5
        height: 50
        Column {
            spacing: 5
            Rectangle {
                width: 40
                height: 40
                color: colorCode
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    id: mouse_area1
                    anchors.fill: parent
                    onClicked: gvBricks.colorCode = parent.color
                }

            }

            Text {
                x: 5
                text: name
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
            }
        }
    }
    model: ListModel {
        ListElement {
            name: "Grey"
            colorCode: "grey"
        }

        ListElement {
            name: "Red"
            colorCode: "red"
        }

        ListElement {
            name: "Blue"
            colorCode: "blue"
        }

        ListElement {
            name: "Green"
            colorCode: "green"
        }
    }
}
