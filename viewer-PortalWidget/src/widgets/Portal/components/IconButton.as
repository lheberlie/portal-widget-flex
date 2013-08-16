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

import spark.components.Button;

// button
[Style(name="paddingLeft", type="Number")]
[Style(name="paddingRight", type="Number")]
[Style(name="paddingTop", type="Number")]
[Style(name="paddingBottom", type="Number")]
[Style(name="topLeftRadiusX", type="Number")]
[Style(name="bottomLeftRadiusX", type="Number")]
[Style(name="topRightRadiusX", type="Number")]
[Style(name="bottomRightRadiusX", type="Number")]
public class IconButton extends Button
{
    private var _labelHorizontalCenter:Object;
    private var _imageSource:Object;
    private var _imageWidth:Number;
    private var _imageHeight:Number;
    private var _lastImageSource:Object;
    private var _lastImageSourceTop:Object;
    private var _lastImageSourceHorizontalCenter:Object;

    public function IconButton()
    {
        super();
    }

    [Bindable]
    public function get labelHorizontalCenter():Object
    {
        return _labelHorizontalCenter;
    }

    public function set labelHorizontalCenter(value:Object):void
    {
        _labelHorizontalCenter = value;
    }

    [Bindable]
    public function get imageSource():Object
    {
        return _imageSource;
    }

    public function set imageSource(value:Object):void
    {
        _imageSource = value;
    }

    [Bindable]
    public function get imageWidth():Number
    {
        return _imageWidth;
    }

    public function set imageWidth(value:Number):void
    {
        _imageWidth = value;
    }

    [Bindable]
    public function get imageHeight():Number
    {
        return _imageHeight;
    }

    public function set imageHeight(value:Number):void
    {
        _imageHeight = value;
    }

    [Bindable]
    public function get lastImageSource():Object
    {
        return _lastImageSource;
    }

    public function set lastImageSource(value:Object):void
    {
        _lastImageSource = value;
    }

    [Bindable]
    public function get lastImageSourceTop():Object
    {
        return _lastImageSourceTop;
    }

    public function set lastImageSourceTop(value:Object):void
    {
        _lastImageSourceTop = value;
    }

    [Bindable]
    public function get lastImageSourceHorizontalCenter():Object
    {
        return _lastImageSourceHorizontalCenter;
    }

    public function set lastImageSourceHorizontalCenter(value:Object):void
    {
        _lastImageSourceHorizontalCenter = value;
    }
}
}
