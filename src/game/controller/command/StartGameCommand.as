package game.controller.command {
import game.config.GameNotifications;
import game.model.proxy.items.ItemsProxy;
    import game.view.mediator.DiamondSellerMediator;
    import game.view.mediator.GameMainSceneMediator;
    import game.view.mediator.ItemsMediators;
    import game.view.mediator.RefreshTimerMediator;
    import game.view.vl.DiamondSellerVL;
    import game.view.vl.GameMainSceneVL;
    import game.view.vl.ItemsVL;
    import game.view.vl.RefreshTimerVL;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class StartGameCommand extends SimpleCommand {
        override public function execute(notification:INotification):void {

            facade.registerMediator(new GameMainSceneMediator(new GameMainSceneVL()));
            facade.registerMediator(new ItemsMediators(new ItemsVL()));
            facade.registerMediator(new DiamondSellerMediator(new DiamondSellerVL()));
            facade.registerMediator(new RefreshTimerMediator(new RefreshTimerVL()));
            refreshUserBalance(notification.getBody() as Object);
        }
        private function refreshUserBalance(data:Object):void{
            sendNotification(GameNotifications.BALANCE_REFRESH, data)
            sendNotification(GameNotifications.START_GAME_TIMER, 60);
        }
    }
}
