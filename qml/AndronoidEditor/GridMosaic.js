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
