/**
 * Created by SalamandeR on 20.02.2017.
 */
package popup.view.mediator {
import core.view.components.ViewLogic;

import flash.events.Event;

import game.model.proxy.UserBalanceProxy;

import game.model.vo.UserBalanceVO;

import org.puremvc.as3.interfaces.INotification;

import popup.config.PopupEventsConfig;
import popup.config.PopupNotificationsConfig;

import popup.view.component.MiningCompletePopupVL;

    public class MiningCompletePopupMediator extends PopupMediator{

        public function MiningCompletePopupMediator(viewComponent:ViewLogic, eclipseBackground:Boolean = true) {
            super(viewComponent,eclipseBackground);
        }
        override public function onRegister():void {
            super.onRegister();
            registerListeners();
        }
        override protected function registerListeners():void {
            super.registerListeners();
            popupVL.addEventListener(PopupEventsConfig.ACTIVATE_BTTNS, activateBttnsHandler);
        }
        override public function listNotificationInterests():Array {
            return [ PopupNotificationsConfig.ADD_USER_INFO_TO_POPUP];
        }

        override public function handleNotification(notification:INotification):void {
            switch (notification.getName()){
                case PopupNotificationsConfig.ADD_USER_INFO_TO_POPUP:
                    addInfoToPopup(notification.getBody() as UserBalanceVO);
                    break;
            }
        }
        private function addInfoToPopup(data:UserBalanceVO):void{
            popupVL.addMiningGold(data.sessionBalance);
            popupVL.addMiningDiamond(data.sessionDiamondBalance);
            popupVL.addTotalGold(data.balance);
            popupVL.addTotalDiamond(data.diamondBalance)
        }

        private function get popupVL():MiningCompletePopupVL {
            return viewComponent as MiningCompletePopupVL;
        }
        private function activateBttnsHandler(event:Event):void {

        }
        override public function onRemove():void {
            removeListeners();
            super.onRemove();
        }
        override protected function removeListeners():void{
            super.removeListeners();
            popupVL.removeEventListener(PopupEventsConfig.ACTIVATE_BTTNS, activateBttnsHandler);
        }
    }
}
