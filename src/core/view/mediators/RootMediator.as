package core.view.mediators
{
	import core.configs.GeneralNotifViewConfig;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class RootMediator extends Mediator
	{
		public static const NAME:String = "RootMediator";
		
		public function RootMediator(viewComponent:Sprite)
		{
			super(NAME, viewComponent);
		}
		
		override public function  listNotificationInterests():Array{
			return[GeneralNotifViewConfig.ADD_CHILD_TO_ROOT,
				GeneralNotifViewConfig.REMOVE_CHILD_FROM_ROOT
			]
		}
		
		override public function handleNotification(notification:INotification):void{
			switch(notification.getName()){
				case GeneralNotifViewConfig.ADD_CHILD_TO_ROOT:
					(viewComponent as Sprite).addChild(notification.getBody() as DisplayObject);
					break;
				case GeneralNotifViewConfig.REMOVE_CHILD_FROM_ROOT:
					(viewComponent as Sprite).removeChild(notification.getBody() as DisplayObject);
					break;
			}
		}
	}
}