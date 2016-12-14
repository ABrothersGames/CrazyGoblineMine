package game.controller.command {

    import game.config.GameNotifications;
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class UpdateUserBalanceCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            var balance:Number = notification.getBody() as Number;

            userBalanceProxy.userBalance += balance;

            itemsProxy.tryUpdateItemsParametersByBalance(userBalanceProxy.userBalance);
            diamondSellerProxy.updateDiamondSellerState(userBalanceProxy.userBalance);

            sendNotification(GameNotifications.USER_BALANCE_UPDATED, userBalanceProxy.userBalance);
        }
    }
}
