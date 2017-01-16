/**
 * Created by SalamandeR on 26.12.2016.
 */
package game.view.mediator {
    import core.view.mediators.UIMediator;

import flash.events.Event;

import game.config.GameEvents;

import game.config.GameEvents;

import game.config.GameNotifications;
import game.view.vl.SaveAndLoadVL;

import org.puremvc.as3.interfaces.INotification;

import utils.EventWithData;

public class SaveAndLoadMediator extends UIMediator{

        public static const NAME:String = "SaveAndLoadMediator";
        private var slotsAmount:int = 4;
        private var slotsClickType:String;
        public function SaveAndLoadMediator(viewComponent:SaveAndLoadVL) {
            super(NAME, viewComponent);
        }
        override public function onRegister():void {
            super.onRegister();
            registerLoadListener();
        }
        private function registerLoadListener():void {
            saveAndLoadVL.addEventListener(GameEvents.CANCEL_BTN_CLICKED, cancelBtnClicked);
            saveAndLoadVL.addEventListener(GameEvents.SLOT_CLICKED, slotClicked);
        }

        override public function listNotificationInterests():Array {
            return [GameNotifications.CHECK_SLOTS];
        }

        override public function handleNotification(notification:INotification):void {

            switch (notification.getName()){
                case GameNotifications.CHECK_SLOTS:
                {
                    slotsClickType = notification.getType() as String;
                    checkSlots(notification.getBody() as Array);
                    break;
                }
                case GameNotifications.SUCCESSFUL_SAVE:{
                    sendNotification(GameNotifications.CANCEL_CLICKED_COMMAND);
                break;
                }
            }
        }
        private function checkSlots(slots:Array):void{
            for(var i:int = 0; i<slotsAmount; i++){
                if(i<slots.length) {
                    saveAndLoadVL.checkSlot(i+1,slots[i])
                    continue;
                }
                saveAndLoadVL.checkSlot(i+1,'Empty');
            }
        }

        private function get saveAndLoadVL():SaveAndLoadVL {

            return viewComponent as SaveAndLoadVL;
        }
        override public function onRemove():void{
            removeListeners();
            super.onRemove();
        }
        private function slotClicked(event:EventWithData):void {
            var data:Object = event.data;
            if(slotsClickType == 'saving'){
                var time:Date = new Date();
                var slotName:String = time.getDate()+ '-' + time.getMonth() + '_' + time.getHours()+':'+ time.getMinutes();
                data['name'] = slotName;
            }
            removeListeners();
            sendNotification(GameNotifications.SLOT_ACCEPTED_COMMAND,data,slotsClickType);
        }

        private function cancelBtnClicked(event:Event):void {
            sendNotification(GameNotifications.CANCEL_CLICKED_COMMAND);
        }
        private function removeListeners():void{
            saveAndLoadVL.removeEventListener(GameEvents.CANCEL_BTN_CLICKED, cancelBtnClicked);
            saveAndLoadVL.removeEventListener(GameEvents.SLOT_CLICKED, slotClicked);
        }
    }
}
