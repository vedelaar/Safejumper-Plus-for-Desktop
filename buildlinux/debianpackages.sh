#!/bin/bash
VERSION=2018.11.06
QTVERSION=5.11.2
OLDPATH=$PATH
./cleanup.sh
export PATH=../../../staticqt/qt-$QTVERSION-32bit/qtbase/bin:$OLDPATH
./builddebian32.sh $VERSION
./cleanup.sh
export PATH=../../../staticqt/qt-$QTVERSION-64bit/qtbase/bin:$OLDPATH
./builddebian64.sh $VERSION
./cleanup.sh
export PATH=$OLDPATH
