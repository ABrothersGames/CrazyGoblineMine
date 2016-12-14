package game.view.mediator {
    import core.view.mediators.UIMediator;

    import flash.events.Event;

    import game.config.GameEvents;

    import game.config.GameNotifications;

    import game.view.vl.GameMainSceneVL;

    import org.puremvc.as3.interfaces.INotification;

    public class GameMainSceneMediator extends UIMediator {

        public static const NAME:String = "GameMainSceneMediator";
        public function GameMainSceneMediator(viewComponent:GameMainSceneVL = null) {

            super(NAME, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            registerListener();
        }


        override public function listNotificationInterests():Array {
            return [GameNotifications.USER_BALANCE_UPDATED
            ];
        }

        override public function handleNotification(notification:INotification):void {

            switch (notification.getName()){
                case GameNotifications.USER_BALANCE_UPDATED:{
                    mainGameSceneVL.updateWinAmount(notification.getBody() as Number);
                    break;
                }
            }
        }

        private function registerListener():void {

            mainGameSceneVL.addEventListener(GameEvents.UPDATE_MANAGER_MENU_BTN_CLICKED, updateManagerMenuBtnClicked);
        }

        private function get mainGameSceneVL():GameMainSceneVL {

            return viewComponent as GameMainSceneVL;
        }

        private function updateManagerMenuBtnClicked(event:Event):void {

            sendNotification(GameNotifications.OPEN_UPDATE_MANAGER_MENU);
        }
    }
}
