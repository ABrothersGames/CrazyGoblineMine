package game.controller.command {
    import game.controller.command.common.SimpleGameCommand;
    import game.view.mediator.DiamondSellerMediator;
    import game.view.mediator.GameMainSceneMediator;
    import game.view.mediator.ItemsMediators;
    import game.view.mediator.RefreshTimerMediator;
    import game.view.vl.DiamondSellerVL;
    import game.view.vl.GameMainSceneVL;
    import game.view.vl.ItemsVL;
    import game.view.vl.RefreshTimerVL;

    import org.puremvc.as3.interfaces.INotification;

import popup.config.PopupNotificationsConfig;

import popup.model.proxy.PopupDto;

import popup.model.proxy.PopupsProxy;

    public class StartGameCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            facade.registerMediator(new GameMainSceneMediator(new GameMainSceneVL()));
            facade.registerMediator(new ItemsMediators(new ItemsVL()));
            facade.registerMediator(new DiamondSellerMediator(new DiamondSellerVL()));
            facade.registerMediator(new RefreshTimerMediator(new RefreshTimerVL()));

            var popupsProxy:PopupsProxy = popupsProxy;

            var popup1:PopupDto = new PopupDto();
            popup1.id = "popup1";
            var popup2:PopupDto = new PopupDto();
            popup2.id = "popup2";

            popupsProxy.addPopupToQueue(popup1);
            popupsProxy.addPopupToQueue(popup2);

            sendNotification(PopupNotificationsConfig.OPEN_POPUP, popupsProxy.getNextPopupForOpen());
        }
    }
}
