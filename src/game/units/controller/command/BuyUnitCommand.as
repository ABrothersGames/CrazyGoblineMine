package game.units.controller.command {
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class BuyUnitCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            defenderUnitsProxy.unitBay(notification.getBody() as int);
        }
    }
}
