// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0
import MosaicModule 1.0

Image{
    id: gridBackground
    property string brickPath: ""
    property alias backgroundPath: gridBackground.source
    source: "backgrounds/back_1.png"
    anchors.fill: parent

    XmlMosaic{
        id: mosaic
    }

    Column{
        Grid {
            id: gridMosaic
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 1
            rows: 10
            columns: 10

            Repeater {
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
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: mosaicBrick.source = (mosaicBrick.source == gridBackground.brickPath) ? "": gridBackground.brickPath
                    }
                }
            }

            function parseMosaic(){
                var cellWidth = 50 + 1;
                var cellHeight = 50 + 1;

                var Rows = [];

                for(var i=0;i <gridMosaic.height;i+= cellHeight){

                    var y = i + 2;
                    var Cols = []

                    for(var j=0 ; j < gridMosaic.width; j+=cellWidth){
                        var x = j + 25;

                        var oItem = gridMosaic.childAt(x, y);
                        Cols.push(oItem.children[0].source);
                    }

                    Rows.push(Cols);
                }

                mosaic.init();
                Rows.forEach(function(Bricks){
                                 var rowHandle = mosaic.createRow();
                                 for(var i = 0; i < Rows[0].length; i++){
                                     var brickFileName = Bricks[i].toString();
                                     var bricName = "hole";
                                     if(brickFileName.indexOf("blue") != -1)
                                         bricName = "blue";
                                     else if(brickFileName.indexOf("green") != -1)
                                         bricName = "green";
                                     else if(brickFileName.indexOf("pink") != -1)
                                         bricName = "pink";
                                     else if(brickFileName.indexOf("red") != -1)
                                         bricName = "red";
                                     else if(brickFileName.indexOf("sea") != -1)
                                         bricName = "sea";
                                     else if(brickFileName.indexOf("yellow") != -1)
                                         bricName = "yellow";
                                     mosaic.addBrick(rowHandle, bricName);
                                 }
                             });
                mosaic.save();
            }

            function getLeftRight(Rows){
                var left = -1, right = -1;
                console.log(Rows[0].toString());
                Rows.forEach(function(Cols){
                                 var rowLeft = -1, rowRight = -1;
                                 var fileName = null;
                                 var bPreviousBrick = false;
                                 Cols.forEach(function(cell, cellIdx){
                                                  fileName = cell.toString();
                                                  console.log("image source length: " + fileName.length);
                                                  if(fileName.length){
                                                      if(rowLeft == -1)
                                                          rowLeft = cellIdx;

                                                      rowRight = cellIdx;
                                                  }
                                              });

                                 if(left == -1){
                                     left = rowLeft;
                                     right = rowRight;
                                     return;
                                 }

                                 if(rowLeft < left)
                                     left = rowLeft;

                                 if(rowRight > right)
                                     right = rowRight;

                             });

                return [left, right];
            }
        }

        Rectangle{
            border.color: "black"
            border.width: 1
            width: 150
            height: 75

            MouseArea{
                anchors.fill: parent
                onClicked: gridMosaic.parseMosaic()
            }
        }
    }
}

