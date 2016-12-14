package core.view.mediators
{
	import core.configs.GeneralNotifViewConfig;
	import core.view.components.ViewLogic;

	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class UIMediator extends Mediator
	{
		public function UIMediator(mediatorName:String=null, viewComponent:ViewLogic = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void{
			super.onRegister();
			sendNotification(GeneralNotifViewConfig.ADD_CHILD_TO_ROOT, viewComponent.content);
		}
		override public function onRemove():void{
			sendNotification(GeneralNotifViewConfig.REMOVE_CHILD_FROM_ROOT, viewComponent.content);
			(viewComponent as ViewLogic).destroy();
		}
		
		public function get mainView():ViewLogic{
			return viewComponent as ViewLogic;
		} 
	}
}