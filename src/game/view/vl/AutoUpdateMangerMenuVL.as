package game.view.vl {
    import core.view.components.ViewLogic;

    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import game.config.GameEvents;
    import game.model.vo.items.ItemVO;

    public class AutoUpdateMangerMenuVL extends ViewLogic {

        private var closeBtn:MovieClip;

        public function AutoUpdateMangerMenuVL() {

            super("updateManagerStore");

            initArt();
            initAutoItems();
        }

        private function initArt():void {

            closeBtn = content["closeBtn"];
            closeBtn.addEventListener(MouseEvent.CLICK, closeBtmClicked);
        }

        //TODO: need refactoring
        private function initAutoItems():void {

            for(var i:int = 0; i < 12; i++){
                (content["autoUpdateItem_" + i] as MovieClip).addEventListener(MouseEvent.CLICK, autoUpdateItemClicked);
            }
        }

        private function closeBtmClicked(event:MouseEvent):void {
            closeBtn.removeEventListener(MouseEvent.CLICK, closeBtmClicked);
            for(var i:int = 0; i < 12; i++){
                (content["autoUpdateItem_" + i] as MovieClip).removeEventListener(MouseEvent.CLICK, autoUpdateItemClicked);
            }

            dispatchEvent(new Event(GameEvents.UPDATE_MANAGER_MENU_CLOSE_BTN_CLICKED));
        }

        private function autoUpdateItemClicked(event:MouseEvent):void {

            trace((event.currentTarget as MovieClip).name);
        }
    }
}
