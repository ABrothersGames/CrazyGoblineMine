package game.units.controller.command {
    import game.controller.command.common.SimpleGameCommand;
    import game.units.model.proxy.DefenderUnitsProxy;

    import org.puremvc.as3.interfaces.INotification;

    public class UpdateUnitsCommand extends SimpleGameCommand {
        override public function execute(notification:INotification):void {

            var unitsCount = notification.getBody().unitsCount;
            var unitsId = notification.getBody().unitsId;

            var defenderProxy:DefenderUnitsProxy = defenderUnitsProxy;

        }
    }
}
