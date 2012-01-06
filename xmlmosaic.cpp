#include "xmlmosaic.h"

XmlMosaic::XmlMosaic(QObject *parent) :
    QObject(parent)
{
    isRowOpened = false;
}

void XmlMosaic::init()
{
    QString fileName =
                QDesktopServices::storageLocation(QDesktopServices::DataLocation).left(1);//disk
    fileName.append("home/kotiki/Work/mosaic_new.xml");
    file = new QFile(fileName);
    if (!file->open(QFile::WriteOnly | QFile::Text)) {
             QMessageBox::warning(NULL, tr("XmlMosaic"),
                                  tr("Cannot write file %1:\n%2.")
                                  .arg(fileName)
                                  .arg(file->errorString()));
             return;
         }

    xml = new QXmlStreamWriter();
    xml->setDevice(file);
    xml->writeStartDocument();
    xml->writeStartElement("mosaic");
}

void XmlMosaic::save()
{
    if(isRowOpened){
        xml->writeEndElement(); //row
        isRowOpened = false;
    }
    xml->writeEndElement();//mosaic
    xml->writeEndDocument();
    file->close();
    delete file;
    file = NULL;
}

int XmlMosaic::createRow()
{
    if(isRowOpened){
        xml->writeEndElement(); //row
    }

    xml->writeStartElement("row");
    isRowOpened = true;
    return -1;
}

void XmlMosaic::addBrick(int handleRow, const QString &brickName)
{
    xml->writeStartElement(brickName);
    xml->writeEndElement();
}
