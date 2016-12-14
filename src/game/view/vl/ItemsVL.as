package game.view.vl {
    import core.view.components.ViewLogic;

    import flash.display.MovieClip;

    import flash.display.MovieClip;
    import flash.events.Event;

    import flash.events.MouseEvent;

    import game.config.GameEvents;
    import game.config.GameItemClickedTypes;

    import game.model.vo.items.ItemVO;

    import utils.EventWithData;

    public class ItemsVL extends ViewLogic {

        private var itemsContainer:MovieClip;

        public function ItemsVL() {
            super("mainGameScene");
            initArt();
        }

        private function initArt():void {

            itemsContainer = content["itemsContainer"];
        }


        public function enableItem(itemVO:ItemVO):void {
            var itemMC:MovieClip = itemsContainer[itemVO.itemID];

            itemMC.gotoAndStop("enable");
            itemMC.addEventListener(MouseEvent.CLICK, enableClicked);
            itemMC.removeEventListener(MouseEvent.CLICK, unlockClicked);
            itemMC["itemPrize"].text = itemVO.coinsPrize;
        }

        public function disableItem(itemVO:ItemVO):void {
            var itemMC:MovieClip = itemsContainer[itemVO.itemID];

            itemMC.gotoAndStop("disable");
            itemMC.removeEventListener(MouseEvent.CLICK, enableClicked);
            itemMC["itemPrize"].text = itemVO.coinsPrize;
        }

        public function unlockItem(itemVO:ItemVO):void {
            var itemMC:MovieClip = itemsContainer[itemVO.itemID];

            itemMC.gotoAndStop("unlock");
            itemMC.addEventListener(MouseEvent.CLICK, unlockClicked);
            itemMC["itemUnlockPrize"].text = itemVO.unlockCoins;
        }

        public function lockItem(itemVO:ItemVO):void {
            var itemMC:MovieClip = itemsContainer[itemVO.itemID];

            itemMC.gotoAndStop("lock");
            itemMC.removeEventListener(MouseEvent.CLICK, unlockClicked);
            itemMC["itemUnlockPrize"].text = itemVO.unlockCoins;
        }

        private function unlockClicked(event:MouseEvent):void {

            itemClicked(event, GameItemClickedTypes.UNLOCK_CLICKED_TYPE);
        }

        private function enableClicked(event:MouseEvent):void {

            itemClicked(event, GameItemClickedTypes.ENABLE_CLICKED_TYPE);
        }

        private function itemClicked(event:MouseEvent, eventType:String):void {

            dispatchEvent(new EventWithData(GameEvents.ITEM_CLICKED, {itemID:event.currentTarget.name, itemClickType:eventType}));
        }
    }
}
