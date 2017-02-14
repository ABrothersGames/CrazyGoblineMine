package popup.controller.command {
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;
    import popup.model.proxy.PopupDto;
    import popup.view.component.PopupViewLogic;

    import popup.view.mediator.PopupMediator;

    public class OpenPopupCommand extends SimpleGameCommand {

        override public function execute(notification:INotification):void {
            var popupDto:PopupDto = notification.getBody() as PopupDto;
            facade.registerMediator(new popupDto.popupMediator(new popupDto.popupViewLogic(popupDto.id) as PopupViewLogic) as PopupMediator);
        }
    }
}
