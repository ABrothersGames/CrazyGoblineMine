package core.view.components
{
	import core.warehouses.WarehouseResources;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
		
	public class ViewLogic extends EventDispatcher
	{
		private var _content:DisplayObjectContainer;
		public function ViewLogic(assetInstanceName:String=null, nameSpace:String = null)
		{
			if (assetInstanceName != null){
				_content = WarehouseResources.instance.getAsset(assetInstanceName, nameSpace) as DisplayObjectContainer;
			}
		}
		
		public function addContent(tempCont:DisplayObject):void{
			_content.addChild(tempCont);
		}
		
		public function get content():DisplayObjectContainer{
			return _content;
		}

		public function set content(content:DisplayObjectContainer):void {
			_content = content;
		}
		
		public function destroy():void {
			if (_content!=null && _content.parent!=null){
				content.parent.removeChild(_content);
			}
			_content = null;
		}
	}
}