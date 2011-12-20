// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

GridView {
    id: gvBricks
    boundsBehavior: Flickable.StopAtBounds
    property string brickPath: ""
    flickableDirection: Flickable.AutoFlickDirection
    cellWidth: 50; cellHeight: 20

    delegate: Image{
                source: path
                width: gvBricks.cellWidth - 4
                height: gvBricks.cellHeight - 4

                MouseArea {
                    id: mouse_area1
                    anchors.fill: parent
                    onClicked: gvBricks.brickPath = parent.source
                }
            }

    model: BrickListModel { }
}
