package game.view.mediator {
    import core.view.mediators.UIMediator;

    import game.config.GameEvents;
    import game.config.GameItemClickedTypes;
    import game.config.GameNotifications;

    import game.model.proxy.items.ItemsProxy;

    import game.model.vo.items.ItemVO;
    import game.view.vl.ItemsVL;

    import org.puremvc.as3.interfaces.INotification;

    import utils.EventWithData;

    public class ItemsMediators extends UIMediator {

        public static const NAME:String = "ItemsMediators";
        public function ItemsMediators(viewComponent:ItemsVL) {
            super(NAME, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            registerListeners();
        }

        private function registerListeners():void {

            itemsVL.addEventListener(GameEvents.ITEM_CLICKED, itemClicked);
        }

        private function itemClicked(event:EventWithData):void {


            sendNotification(GameNotifications.ITEM_CLICKED, event.data);
        }

        override public function listNotificationInterests():Array {
            return [GameNotifications.ITEM_TO_ENABLE_STATE,
                    GameNotifications.ITEM_TO_DISABLE_STATE,
                    GameNotifications.ITEM_TO_LOCK_STATE,
                    GameNotifications.ITEM_TO_UNLOCK_STATE
            ]
        }

        override public function handleNotification(notification:INotification):void {

            switch(notification.getName()){
                case GameNotifications.ITEM_TO_ENABLE_STATE:
                        itemsVL.enableItem(notification.getBody() as ItemVO);
                    break;
                case GameNotifications.ITEM_TO_DISABLE_STATE:
                        itemsVL.disableItem(notification.getBody() as ItemVO);
                    break;
                case GameNotifications.ITEM_TO_LOCK_STATE:
                    itemsVL.lockItem(notification.getBody() as ItemVO);
                    break;
                case GameNotifications.ITEM_TO_UNLOCK_STATE:
                    itemsVL.unlockItem(notification.getBody() as ItemVO);
                    break;
            }
        }

        private function get itemsProxy():ItemsProxy {

            return facade.retrieveProxy(ItemsProxy.NAME) as ItemsProxy;
        }

        private function get itemsVL():ItemsVL {

            return viewComponent as ItemsVL;
        }
    }
}
