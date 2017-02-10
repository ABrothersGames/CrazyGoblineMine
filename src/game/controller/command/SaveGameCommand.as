package game.controller.command {
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class SaveGameCommand extends SimpleGameCommand{
        override public function execute(notification:INotification):void {
            var data:Object = notification.getBody() as Object;
            dataFileProxy.saveGameDataToFile(data);
           // dataFileProxy.loadGameDataFromFile(data);
    }
}
}
