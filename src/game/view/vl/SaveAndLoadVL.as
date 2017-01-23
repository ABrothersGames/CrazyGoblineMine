/**
 * Created by SalamandeR on 26.12.2016.
 */
package game.view.vl {
import core.view.components.ViewLogic;

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

import game.config.GameEvents;

import utils.EventWithData;

public class SaveAndLoadVL extends ViewLogic{
        private var slot:MovieClip;
        private var cancelButton:MovieClip;
        public function SaveAndLoadVL() {
            super("saveAndLoadMenu");
            initArt();
        }
        private function initArt():void{
            cancelButton = content['cancelButton'];
            registerListener();
        }
        private function  registerListener():void {
            cancelButton.addEventListener(MouseEvent.CLICK, cancelClickHandler);
        }

        public function checkSlot(slotNumber:int,slotName:String):void{
            var t:String = 'saveSlot_'+ slotNumber;
            slot = content[t];
            (slot['saveName'] as TextField).text = slotName;
            slot.addEventListener(MouseEvent.CLICK, onSlotClickHandler);
        }

        private function cancelClickHandler(event:MouseEvent):void {
            cancelButton.removeEventListener(MouseEvent.CLICK, cancelClickHandler);
            dispatchEvent(new Event(GameEvents.CANCEL_BTN_CLICKED));
        }

        private function onSlotClickHandler(event:MouseEvent):void {

            var slotName:String = event.currentTarget.name;
            var slotNumber:int = int(slotName.substring(slotName.length-1,slotName.length));
            dispatchEvent(new EventWithData(GameEvents.SLOT_CLICKED,{id:slotNumber,name:slotName}));
        }
    }
}
