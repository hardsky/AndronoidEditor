// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

ListView {
    id: lvBackgrounds
    clip: true
    cacheBuffer: 75
    boundsBehavior: Flickable.StopAtBounds
    property string bgPath: ""

    delegate: Image {

            id: imgBackground
            source: backPath
            width: 196

            MouseArea {
                id: mouse_area1
                anchors.fill: parent
                onClicked: lvBackgrounds.bgPath = imgBackground.source
            }
        }
    model: BackListModel { }
}
