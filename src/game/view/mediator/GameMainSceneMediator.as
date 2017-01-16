package game.view.mediator {
    import core.view.mediators.UIMediator;

    import flash.events.Event;

    import game.config.GameEvents;

    import game.config.GameNotifications;
import game.model.proxy.DiamondSellerProxy;

import game.view.vl.GameMainSceneVL;

    import org.puremvc.as3.interfaces.INotification;

import utils.EventWithData;

public class GameMainSceneMediator extends UIMediator {

        public static const NAME:String = "GameMainSceneMediator";
        public function GameMainSceneMediator(viewComponent:GameMainSceneVL = null) {

            super(NAME, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            mainGameSceneVL.updateDiamondCost(diamondSellerProxy.diamondSellerVO.diamondCost);
            registerListener();
        }


        override public function listNotificationInterests():Array {
            return [GameNotifications.USER_BALANCE_UPDATED,
                    GameNotifications.USER_DIAMOND_BALANCE_UPDATED
            ];
        }

        override public function handleNotification(notification:INotification):void {

            switch (notification.getName()){
                case GameNotifications.USER_BALANCE_UPDATED:{
                    mainGameSceneVL.updateWinAmount(notification.getBody() as Number);
                    break;
                }
                case GameNotifications.USER_DIAMOND_BALANCE_UPDATED:{
                    mainGameSceneVL.updateDiamondAmount(notification.getBody() as Number);
                    break;
                }
                /*case GameNotifications.USER_DIAMOND_COST_UPDATED:{
                    mainGameSceneVL.updateDiamondCost(diamondSellerProxy.diamondSellerVO.diamondCost);
                    break;
                }*/
            }
        }

        private function registerListener():void {

            mainGameSceneVL.addEventListener(GameEvents.UPDATE_MANAGER_MENU_BTN_CLICKED, updateManagerMenuBtnClicked);
            mainGameSceneVL.addEventListener(GameEvents.OPEN_SAVE_MENU, saveGameButtonClicked);
        }

        private function get mainGameSceneVL():GameMainSceneVL {

            return viewComponent as GameMainSceneVL;
        }
        private function get diamondSellerProxy():DiamondSellerProxy {

            return facade.retrieveProxy(DiamondSellerProxy.NAME) as DiamondSellerProxy;
        }

        private function updateManagerMenuBtnClicked(event:Event):void {

            sendNotification(GameNotifications.OPEN_UPDATE_MANAGER_MENU);
        }

        private function saveGameButtonClicked(event:EventWithData):void {
            var data:* = event.data;
            sendNotification(GameNotifications.CHECK_SLOTS_COMMAND, data, 'saving');
        }
        override public function onRemove():void{
            mainGameSceneVL.removeEventListener(GameEvents.UPDATE_MANAGER_MENU_BTN_CLICKED, updateManagerMenuBtnClicked);
            mainGameSceneVL.removeEventListener(GameEvents.OPEN_SAVE_MENU, saveGameButtonClicked);
            super.onRemove();
        }
    }
}
