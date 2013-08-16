/*
//////////////////////////////////////////////////////////////////
// Copyright (c) 2008-2013 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
////////////////////////////////////////////////////////////////
*/
package widgets.Portal.components
{

import com.esri.ags.portal.supportClasses.PortalQueryParameters;

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.controls.LinkButton;

import spark.components.HGroup;
import spark.components.Label;

import widgets.Portal.events.SortByEvent;

[Event(name="sortClick", type="widgets.Portal.events.SortByEvent")]

public class SortBy extends HGroup
{
    private var _options:Array;
    private var _label:Label;
    private var _buttons:ArrayCollection;
    private var _selectedSort:SortObject;

    public function SortBy()
    {
        super();
        verticalAlign = "middle";
        horizontalAlign = "center";
        gap = 0;

        _label = new Label();
        _label.text = "Sort By: ";
        _label.height = 13;
        _label.setStyle("verticalAlign", "bottom");
        addElement(_label);
    }

    public function set options(value:Array):void
    {
        _options = value;
        _buttons = new ArrayCollection;
        removeAllElements();
        addElement(_label);

        if (_options != null && _options.length > 0)
        {
            for each (var option:Object in _options)
            {
                var button:LinkButton = new LinkButton();
                button.styleName = "linkButton";
                button.label = option.label;
                button.addEventListener(MouseEvent.CLICK, sortButtonClick);
                _buttons.addItem(button);
                addElement(button);
            }

            selectedSort = new SortObject(_options[0].value, _options[0].label, PortalQueryParameters.ASCENDING_SORT);
        }

        validateNow();
    }

    public function get options():Array
    {
        return _options;
    }

    private function sortButtonClick(event:MouseEvent):void
    {
        if (selectedSort.sortLabel == (event.target as LinkButton).label)
        {
            selectedSort = new SortObject(selectedSort.sortField, selectedSort.sortLabel, (selectedSort.sortOrder == PortalQueryParameters.ASCENDING_SORT)
                                          ? PortalQueryParameters.DESCENDING_SORT : PortalQueryParameters.ASCENDING_SORT);
        }
        else
        {
            for each (var option:Object in _options)
            {
                if (option.label == (event.target as LinkButton).label)
                {
                    selectedSort = new SortObject(option.value, option.label, PortalQueryParameters.ASCENDING_SORT);
                    break;
                }
            }
        }
    }

    public function set selectedSort(value:SortObject):void
    {
        if (value != _selectedSort)
        {
            _selectedSort = value;

            for each (var button:LinkButton in _buttons)
            {
                if (button.label == _selectedSort.sortLabel)
                {
                    button.setStyle("color", getStyle('focusColor'));
                }
                else
                {
                    button.setStyle("color", getStyle('color'));
                    button.setStyle("alpha", getStyle('contentBackgroundAlpha'));
                }
            }
        }

        dispatchEvent(new SortByEvent());
    }

    public function get selectedSort():SortObject
    {
        return _selectedSort;
    }
}
}
