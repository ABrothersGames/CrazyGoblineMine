package game.view.vl {
    import core.view.components.ViewLogic;

    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    import game.config.GameEvents;

    import utils.EventWithData;

    public class DiamondSellerVL extends ViewLogic {

        private var diamondSellerContainer:MovieClip;
        private var diamondSeller:MovieClip;
        public function DiamondSellerVL() {

            super("mainGameScene");
            initArt();
        }

        private function initArt():void {

            diamondSellerContainer = content["diamondSellerContainer"];

            diamondSeller = diamondSellerContainer["diamondSeller"];
            diamondSeller.stop();
        }

        public function enableDiamondSeller():void {

            diamondSeller.gotoAndStop("enable");
            diamondSeller.addEventListener(MouseEvent.CLICK, diamondButtonClicked);
        }

        public function disableDiamondSeller():void {

            diamondSeller.gotoAndStop("disable");
            diamondSeller.removeEventListener(MouseEvent.CLICK, diamondButtonClicked);
        }

        private function diamondButtonClicked(event:MouseEvent):void {

            dispatchEvent(new EventWithData(GameEvents.DIAMOND_SELLER_CLICKED));
        }
    }
}
