package game.controller.command {
    import game.config.GameNotifications;
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class AutoUpdateUserBalanceCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            sendNotification(GameNotifications.USER_BALANCE_UPDATED, 10);
        }
    }
}
