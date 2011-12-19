// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

ListView {
    id: lvBackgrounds
    width: 196
    cacheBuffer: 75
    boundsBehavior: Flickable.StopAtBounds
    delegate: Item {
        x: 5
        height: 40
        Row {
            id: row1
            spacing: 10
            Rectangle {
                width: 40
                height: 40
                color: colorCode
            }

            Text {
                text: name
                anchors.verticalCenter: parent.verticalCenter
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
