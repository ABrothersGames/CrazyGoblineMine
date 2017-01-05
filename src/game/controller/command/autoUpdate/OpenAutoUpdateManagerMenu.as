package game.controller.command.autoUpdate {
    import game.controller.command.common.SimpleGameCommand;
    import game.view.mediator.AutoUpdateMangerMenuMediator;
    import game.view.vl.AutoUpdateMangerMenuVL;

    import org.puremvc.as3.interfaces.INotification;

    import popup.view.component.PopupViewLogic;

    import popup.view.mediator.PopupMediator;

    public class OpenAutoUpdateManagerMenu extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            facade.registerMediator(new AutoUpdateMangerMenuMediator(new AutoUpdateMangerMenuVL()));

            //for test
            //facade.registerMediator(new PopupMediator("baseInfoPopup", new PopupViewLogic("baseInfoPopup")));
        }
    }
}
