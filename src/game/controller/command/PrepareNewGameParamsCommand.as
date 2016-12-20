package game.controller.command {
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    import game.config.GameNotifications;
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class PrepareNewGameParamsCommand extends SimpleGameCommand {

        override public function execute(notification:INotification):void {

            //need register all start params
            loadItemsConfiguration();

            userBalanceProxy.userBalance = 0;
            userBalanceProxy.userDiamondBalance = 0;
        }

        private function loadItemsConfiguration():void {
            var url:URLRequest = new URLRequest("/itemConfiguration.json");
            var jsonLoader:URLLoader = new URLLoader();

            jsonLoader.addEventListener(Event.COMPLETE, jsonLoaded);

            jsonLoader.load(url);
        }

        private function jsonLoaded(event:Event):void {

            var data:Array = JSON.parse(event.target.data) as Array;

            itemsProxy.parseItemsConfiguration(data);

            sendNotification(GameNotifications.START_GAME, itemsProxy);

            //here need get user balance in start game from SAVE
            itemsProxy.tryUpdateItemsParametersByBalance(0);
        }
    }
}
