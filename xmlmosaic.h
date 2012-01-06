#ifndef XMLMOSAIC_H
#define XMLMOSAIC_H

#include <QtGui>
#include <QObject>
#include <QXmlStreamWriter>

class XmlMosaic : public QObject
{
    Q_OBJECT
public:
    explicit XmlMosaic(QObject *parent = 0);
    Q_INVOKABLE void init();
    Q_INVOKABLE void save();
    Q_INVOKABLE int createRow();
    Q_INVOKABLE void addBrick(int handleRow, const QString &brickName);
signals:
    
public slots:

private:
    QFile* file;
    QXmlStreamWriter* xml;
    bool isRowOpened;
    
};

#endif // XMLMOSAIC_H
