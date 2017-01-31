package popup.controller.command {
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    import popup.config.PopupNotificationsConfig;
    import popup.model.proxy.PopupDto;

    public class ClosePopupCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            var popupName:String = notification.getBody() as String;

            facade.removeMediator(popupName);

            var nextPopupForOpen:PopupDto = popupsProxy.getNextPopupForOpen();
            if(nextPopupForOpen != null){
                sendNotification(PopupNotificationsConfig.OPEN_POPUP, nextPopupForOpen);
            }
        }
    }
}
