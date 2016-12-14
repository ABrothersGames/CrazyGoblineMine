package game.view.mediator {
    import core.view.components.ViewLogic;
    import core.view.mediators.UIMediator;

    import flash.events.Event;

    import game.config.GameEvents;
    import game.config.GameNotifications;

    import game.view.vl.DiamondSellerVL;

    import org.puremvc.as3.interfaces.INotification;

    import utils.EventWithData;

    public class DiamondSellerMediator extends UIMediator {

        public static const NAME:String  = "DiamondSellerMediator";
        public function DiamondSellerMediator(viewComponent:DiamondSellerVL) {
            super(NAME, viewComponent);
        }

        override public function onRegister():void {

            registerListeners();
        }

        private function registerListeners():void {

            diamondSellerVL.addEventListener(GameEvents.DIAMOND_SELLER_CLICKED, diamondSellerClicked);
        }

        override public function listNotificationInterests():Array {
            return [GameNotifications.ENABLE_DIAMOND_SELLER,
                GameNotifications.DISABLE_DIAMOND_SELLER,
            ]
        }

        override public function handleNotification(notification:INotification):void {

            switch(notification.getName()){
                case GameNotifications.ENABLE_DIAMOND_SELLER:
                    diamondSellerVL.enableDiamondSeller();
                    break;
                case GameNotifications.DISABLE_DIAMOND_SELLER:
                    diamondSellerVL.disableDiamondSeller();
                    break;
            }
        }

        private function get diamondSellerVL():DiamondSellerVL {

            return viewComponent as DiamondSellerVL;
        }

        private function diamondSellerClicked(event:Event):void {

            sendNotification(GameNotifications.DIAMOND_BOUGHT);
        }
    }
}
