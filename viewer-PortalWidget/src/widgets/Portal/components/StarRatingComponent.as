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

import mx.events.FlexEvent;

import spark.components.HGroup;
import spark.components.Image;

public class StarRatingComponent extends HGroup
{
    [Embed(source="../assets/images/i_yellow_star.png")]
    private static var yellow_star:Class;

    [Embed(source="../assets/images/i_white_star.png")]
    private static var white_star:Class;

    private var images:Array = [];
    public var myStarRating:int = 0;

    public function StarRatingComponent()
    {
        super();
        this.gap = 0;
    }

    override protected function createChildren():void
    {
        for (var i:int = 0; i < 5; i++)
        {
            images[i] = new Image();
            images[i].source = white_star;
            this.addElement(images[i]);
        }
    }

    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.updateDisplayList(unscaledWidth, unscaledHeight);

        for (var i:int = 0; i < 5; i++)
        {
            if (myStarRating > i)
            {
                images[i].source = yellow_star;
            }
            else
            {
                images[i].source = white_star;
            }
        }
    }

    // Internal variable for the property value.
    private var _data:Object;

    // Make the data property bindable.
    [Bindable("dataChange")]

    // Define the getter method.
    public function get data():Object
    {
        return _data;
    }

    // Define the setter method, and dispatch an event when the property
    // changes to support data binding.
    public function set data(value:Object):void
    {
        _data = value;
        myStarRating = Math.floor(Number(value));
        invalidateDisplayList();
        dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
    }

}
}
