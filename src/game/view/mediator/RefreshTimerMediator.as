package game.view.mediator {
    import core.view.mediators.UIMediator;

    import flash.events.Event;

    import game.config.GameEvents;

    import game.config.GameNotifications;
    import game.model.proxy.items.ItemsProxy;

    import game.view.vl.RefreshTimerVL;

    import org.puremvc.as3.interfaces.INotification;

    import utils.EventWithData;

    public class RefreshTimerMediator extends UIMediator {

        public static const NAME:String = "RefreshTimerMediator";
        public function RefreshTimerMediator(viewComponent:RefreshTimerVL) {
            super(NAME, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            registerListeners();
        }

        private function registerListeners():void {
            refreshTimerVL.addEventListener(GameEvents.PROGRESS_ITEM_FINISHED, progressItemAnimFinished);
        }

        override public function listNotificationInterests():Array {
            return [
                    GameNotifications.REFRESH_ITEM_START
            ];
        }

        override public function handleNotification(notification:INotification):void {

            switch (notification.getName()){
                case GameNotifications.REFRESH_ITEM_START:
                    var itemID:String = notification.getBody() as String;
                    var timeForRefresh:Number = itemProxy.getItemVO(itemID).refreshTime;
                    refreshTimerVL.startRefresh(itemID, timeForRefresh);
                    break;
            }
        }

        private function get refreshTimerVL():RefreshTimerVL {
            return viewComponent as RefreshTimerVL;
        }

        private function progressItemAnimFinished(event:EventWithData):void {

            itemProxy.getItemVO(event.data as String).refreshFinished = true;
            sendNotification(GameNotifications.ITEM_TO_ENABLE_STATE, itemProxy.getItemVO(event.data as String));
        }

        //TODO: temp need move to command
        private function get itemProxy():ItemsProxy {

           return facade.retrieveProxy(ItemsProxy.NAME) as ItemsProxy;
        }
    }
}
