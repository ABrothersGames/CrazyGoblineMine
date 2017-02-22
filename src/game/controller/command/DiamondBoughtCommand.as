package game.controller.command {
    import game.config.GameNotifications;
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class DiamondBoughtCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {
            userBalanceProxy.userDiamondBalance += 1;
            userBalanceProxy.userSessionDiamondBalance += 1;
            sendNotification(GameNotifications.USER_DIAMOND_BALANCE_UPDATED, userBalanceProxy.userDiamondBalance);
            sendNotification(GameNotifications.UPDATE_USER_BALANCE, -(diamondSellerProxy.diamondSellerVO.diamondCost));

            diamondSellerProxy.increaseDiamondPrize();
        }
    }
}
