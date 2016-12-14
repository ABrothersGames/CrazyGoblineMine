package game.view.vl {
    import core.view.components.ViewLogic;

    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import game.config.GameEvents;

    import utils.EventWithData;

    public class GameMainSceneVL extends ViewLogic {

        private var updateManagerMenuBtn:MovieClip;

        public function GameMainSceneVL(assetInstanceName:String = null) {

            super("mainGameScene");

            initArt();
        }

        private function initArt():void {

            content["coinsTxt"].text = 0;

            updateManagerMenuBtn = content["autoUpdateStoreButton"];
            updateManagerMenuBtn.addEventListener(MouseEvent.CLICK, updateManagerMenuBtnClicked);
        }

        public function updateWinAmount(winAmount:Number):void {

            content["coinsTxt"].text = Math.floor(winAmount).toString();
        }

        private function updateManagerMenuBtnClicked(event:MouseEvent):void {

            dispatchEvent(new Event(GameEvents.UPDATE_MANAGER_MENU_BTN_CLICKED));
        }
    }
}
