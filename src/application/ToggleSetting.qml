/***************************************************************************
 *   Copyright (C) 2018 by Jeremy Whiting <jeremypwhiting@gmail.com>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation version 2 of the License.                *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.          *
 ***************************************************************************/

import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

ShadowRect {
    id: toggleSetting

    width: 335
    height: 114
    color: "white"
    radius: 5

    signal toggled(bool toggleChecked)
    property bool toggleChecked: true
    property string title
    property string content

    RowLayout {
        id: titleRow
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 10

        Text {
            font.family: "Roboto"
            font.bold: true
            font.pixelSize: 16
            lineHeight: 24
            lineHeightMode: Text.FixedHeight
            color: defaultColor
            text: title
            elide: Text.ElideRight
            Layout.leftMargin: 20
            Layout.maximumWidth: 231
        }

        Image {
            Layout.preferredWidth: 66
            Layout.preferredHeight: 42
            Layout.rightMargin: 18
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            source: toggleSetting.toggleChecked ? "../images/checked-toggle.png" : "../images/unchecked-toggle.png"

        }
    }

    Text {
        id: body
        width: 295
        anchors.top: titleRow.bottom
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Roboto"
        font.pixelSize: 14
        font.weight: Text.Normal
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
        color: "#6C798F"
        text: content
        wrapMode: Text.WordWrap
    }

    MouseArea {
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
        onClicked: {
            console.log("Toggle clicked");
            toggleSetting.toggleChecked = !toggleSetting.toggleChecked;
            toggleSetting.toggled(toggleSetting.toggleChecked);
            console.log("Toggle checked is now " + toggleSetting.toggleChecked);
        }
    }
} // End of rect
