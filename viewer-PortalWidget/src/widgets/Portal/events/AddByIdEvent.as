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
package widgets.Portal.events
{
	import flash.events.Event;
	
	public class AddByIdEvent extends Event
	{
		public static const ADD_BY_ID:String="Add_By_Id";
		public static const ADD_BY_SUBMIT:String="Add_By_Id_Submit";
		public static const ADD_BY_ID_CANCEL:String="Add_By_Id_CANCEL";
		
		
		public var data:Object;
		public var isSelected:Boolean;
		public function AddByIdEvent(data:Object=null,type:String="",isSelected:Boolean=false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			
			super(type, bubbles, cancelable);
			this.data=data;
			this.isSelected=isSelected;
			
		}
	}
}