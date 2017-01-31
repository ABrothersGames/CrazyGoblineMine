package popup.controller.command {
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    import popup.view.component.PopupViewLogic;

    import popup.view.mediator.PopupMediator;

    public class OpenPopupCommand extends SimpleGameCommand {

        override public function execute(notification:INotification):void {

            if(!popupProxy.isFreeForOpen){
                return;
            }

            var popupName:String = popupProxy.getNextPopupForOpen();
            facade.registerMediator(new PopupMediator(popupName, new PopupViewLogic(popupName)));
        }
    }
}
