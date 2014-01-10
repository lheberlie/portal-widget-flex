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
	import com.esri.ags.utils.JSONUtil;
	import com.esri.viewer.AppEvent;
	
	import flash.events.EventDispatcher;
	import flash.net.URLRequestMethod;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import widgets.Portal.events.RestQueryEvent;

	public class JsonFeatureServer extends EventDispatcher
	{
		private var obj:Object;
		public function doQuery(url:String,type:String,proxyURL:String=null):Object
		{
			
			var jsonService:HTTPService=new HTTPService();
			if(type=="WMS")
			{
				jsonService.url=proxyURL+"?"+url+"?SERVICE=WMS&REQUEST=GetCapabilities";
				jsonService.resultFormat="object";
			}
			else
			{
			jsonService.url=url+"?f=pjson";
			jsonService.resultFormat="text";
			}
			
			jsonService.method=URLRequestMethod.POST;
			var token:AsyncToken = jsonService.send();
			token.type=type;
			token.addResponder( new mx.rpc.Responder(HTTPService_ResultHandler, HTTPService_FaultHandler));
			
			
			 return obj;
			
		}
		private function HTTPService_ResultHandler(event:ResultEvent):void
		{
			try
			{
			if(event.token.type)
			{
				var rawData:String=new String(event.result);
				obj=JSONUtil.decode(rawData);
				
			}
			
			if(obj.error)
			{
				Alert.show("Secure services not implemented in this sample.", "Unable to process layer type.");
				CursorManager.removeBusyCursor();
			}
			else
			{
			var sentEvent:RestQueryEvent=new RestQueryEvent(obj,RestQueryEvent.TYPE,true);
			dispatchEvent(sentEvent)
			
			}
			}
			catch(e:Error)
			{
				CursorManager.removeBusyCursor();
				if((event.result.toString() as String).toLowerCase().indexOf("token")!=-1)
				{
					Alert.show("Secure services not implemented in this sample.", "Unable to process layer type.");
					CursorManager.removeBusyCursor();
				}
				trace(e.message);
			}
		}
		private function HTTPService_FaultHandler(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show("Unable to load layer.", "Error");
		}
	}
}