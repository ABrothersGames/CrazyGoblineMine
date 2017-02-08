package game.view.mediator {
    import core.view.mediators.UIMediator;

    import flash.events.Event;
import flash.events.TimerEvent;

import game.config.GameEvents;

    import game.config.GameNotifications;
import game.model.proxy.DiamondSellerProxy;

import game.view.vl.GameMainSceneVL;

    import org.puremvc.as3.interfaces.INotification;

import utils.EventWithData;
import utils.GameTimer;

public class GameMainSceneMediator extends UIMediator {

        public static const NAME:String = "GameMainSceneMediator";
        private var timer:GameTimer;
        public function GameMainSceneMediator(viewComponent:GameMainSceneVL = null) {

            super(NAME, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            //mainGameSceneVL.updateDiamondCost(diamondSellerProxy.diamondSellerVO.diamondCost);
            registerListener();
        }


        override public function listNotificationInterests():Array {
            return [GameNotifications.USER_BALANCE_UPDATED,
                    GameNotifications.USER_DIAMOND_BALANCE_UPDATED,
                    GameNotifications.BALANCE_REFRESH,
                    GameNotifications.START_GAME_TIMER,
                    GameNotifications.STOP_MINING
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
                case GameNotifications.USER_DIAMOND_COST_UPDATED:{
                    mainGameSceneVL.updateDiamondCost(diamondSellerProxy.diamondSellerVO.diamondCost);
                    break;
                }
                case GameNotifications.BALANCE_REFRESH:{
                    mainGameSceneVL.setUserBalance(notification.getBody() as Object);
                    break;
                }
                case GameNotifications.START_GAME_TIMER:{
                    initGameTimer(notification.getBody() as Number);
                    break;
                }
                case GameNotifications.STOP_MINING:{
                    mainGameSceneVL.saveUnlock();
                    break;
                }
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
            //var data:* = event.data;
            sendNotification(GameNotifications.CHECK_SLOTS_COMMAND, null, 'saving');
        }
        private function initGameTimer(time:Number):void{
            timer = new GameTimer(time);
            timer.addEventListener(GameEvents.TIMER_TICK, timerHandler);
            timer.addEventListener(GameEvents.TIMER_COMPLETE, timerCompleteHandler);
            timer.startTimer();
        }
        private function timerHandler(e:EventWithData):void{
            mainGameSceneVL.changeTime((e as EventWithData).data.time as String);
        }
        private function timerCompleteHandler(e:EventWithData):void{
            timer.stopTimer();
            timer.removeEventListener(GameEvents.TIMER_TICK, timerHandler);
            timer.removeEventListener(GameEvents.TIMER_COMPLETE, timerCompleteHandler);
            sendNotification(GameNotifications.TIME_LEFT_COMMAND);
        }
        override public function onRemove():void{
            mainGameSceneVL.removeEventListener(GameEvents.UPDATE_MANAGER_MENU_BTN_CLICKED, updateManagerMenuBtnClicked);
            mainGameSceneVL.removeEventListener(GameEvents.OPEN_SAVE_MENU, saveGameButtonClicked);
            super.onRemove();
        }
    }
}
