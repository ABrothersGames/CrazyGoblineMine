package game.controller.command {
    import game.config.GameNotifications;
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class DiamondBoughtCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            sendNotification(GameNotifications.UPDATE_USER_BALANCE, -(diamondSellerProxy.diamondSellerVO.diamondCost));

            diamondSellerProxy.increaseDiamondPrize();
        }
    }
}
