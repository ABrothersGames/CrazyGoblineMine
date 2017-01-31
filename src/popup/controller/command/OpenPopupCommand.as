package popup.controller.command {
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

<<<<<<< Updated upstream
=======
    import popup.model.proxy.PopupDto;

>>>>>>> Stashed changes
    import popup.view.component.PopupViewLogic;

    import popup.view.mediator.PopupMediator;

    public class OpenPopupCommand extends SimpleGameCommand {

        override public function execute(notification:INotification):void {

<<<<<<< Updated upstream
            if(!popupProxy.isFreeForOpen){
                return;
            }

            var popupName:String = popupProxy.getNextPopupForOpen();
            facade.registerMediator(new PopupMediator(popupName, new PopupViewLogic(popupName)));
=======
            var popupDto:PopupDto = notification.getBody() as PopupDto;

            facade.registerMediator(new popupDto.popupMediator(new popupDto.popupViewLogic(popupDto.id) as PopupViewLogic) as PopupMediator);
>>>>>>> Stashed changes
        }
    }
}
