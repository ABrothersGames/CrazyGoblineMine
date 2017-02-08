package game.view.vl {
    import core.view.components.ViewLogic;

import fl.motion.AdjustColor;

import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
import flash.filters.ColorMatrixFilter;
import flash.text.TextField;

import game.config.GameEvents;

    import utils.EventWithData;

    public class GameMainSceneVL extends ViewLogic {

        private var updateManagerMenuBtn:MovieClip;
        private var saveButton:MovieClip;
        private var timer:TextField;
        public function GameMainSceneVL(assetInstanceName:String = null) {

            super("mainGameScene");
            initArt();
        }

        private function initArt():void {
            saveButton = content["saveButton"];
            saveButton.alpha = 0.3;

            timer = content["timer"];
            updateManagerMenuBtn = content["autoUpdateStoreButton"];
            //updateManagerMenuBtn.addEventListener(MouseEvent.CLICK, updateManagerMenuBtnClicked);
        }
        public function setUserBalance(data:Object):void{

            content["coinsTxt"].text = data.goldAmount;
            content["diamondsTxt"].text = data.diamondAmount;
            content["diamondCost"].text =  data.diamondCost;
            updateManagerMenuBtn.addEventListener(MouseEvent.CLICK, updateManagerMenuBtnClicked);
        }
        public function saveUnlock():void{
            saveButton.addEventListener(MouseEvent.CLICK, saveGame);
        }
        public function updateWinAmount(winAmount:Number):void {

            content["coinsTxt"].text = Math.floor(winAmount).toString();
        }
        public function updateDiamondAmount(diamondAmount:Number):void {

            content["diamondsTxt"].text = Math.floor(diamondAmount).toString();
        }
        public function updateDiamondCost(diamondCost:Number):void {

            content["diamondCost"].text = Math.floor(diamondCost).toString();
        }
        public function changeTime(time:String):void{
            timer.text = time;
        }

        private function updateManagerMenuBtnClicked(event:MouseEvent):void {

            dispatchEvent(new Event(GameEvents.UPDATE_MANAGER_MENU_BTN_CLICKED));
        }
        private function saveGame(event:MouseEvent):void{
            dispatchEvent(new EventWithData(GameEvents.OPEN_SAVE_MENU,{coins:content["coinsTxt"].text, diamonds:content["diamondsTxt"].text,diamondsCost:content["diamondCost"].text}));
        }
    }
}
