#include <QtDeclarative>
#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "xmlmosaic.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<XmlMosaic>("MosaicModule", 1,0, "XmlMosaic");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/AndronoidEditor/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
