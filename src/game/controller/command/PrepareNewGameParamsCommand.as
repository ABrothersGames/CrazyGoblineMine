package game.controller.command {
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    import game.config.GameNotifications;
    import game.controller.command.common.SimpleGameCommand;

    import org.puremvc.as3.interfaces.INotification;

    public class PrepareNewGameParamsCommand extends SimpleGameCommand {

        override public function execute(notification:INotification):void {
            var goldAmount:Number = 0;
            var diamondAmount:Number = 0;
            var diamondCost:Number;
            if(notification.getBody() as Object){
                goldAmount = Number(notification.getBody().goldAmount);
                diamondAmount = Number(notification.getBody().diamondAmount);
                diamondCost = Number(notification.getBody().diamondCost);
            }
            //need register all start params
            userBalanceProxy.userBalance = goldAmount;
            userBalanceProxy.userDiamondBalance = diamondAmount;
            diamondSellerProxy.diamondCost = diamondCost;

            loadItemsConfiguration();
        }

        private function loadItemsConfiguration():void {
            var url:URLRequest = new URLRequest("https://drive.google.com/uc?export=download&confirm=no_antivirus&id=0B5PpEZhbFty_REdOU1lnQzBBdjA");
            var jsonLoader:URLLoader = new URLLoader();

            jsonLoader.addEventListener(Event.COMPLETE, jsonLoaded);

            jsonLoader.load(url);
        }

        private function jsonLoaded(event:Event):void {

            var data:Array = JSON.parse(event.target.data) as Array;

            itemsProxy.parseItemsConfiguration(data);

            sendNotification(GameNotifications.START_GAME, /*itemsProxy*/{goldAmount:userBalanceProxy.userBalance,diamondAmount:userBalanceProxy.userDiamondBalance,diamondCost: diamondSellerProxy.diamondCost});

            //here need get user balance in start game from SAVE
            itemsProxy.tryUpdateItemsParametersByBalance(0);
        }
    }
}
