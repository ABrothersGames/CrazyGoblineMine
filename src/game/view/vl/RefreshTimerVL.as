package game.view.vl {
    import core.view.components.ViewLogic;

    import fl.transitions.Tween;
    import fl.transitions.TweenEvent;

    import flash.display.MovieClip;
    import flash.events.Event;

    import game.config.GameEvents;

    import utils.EventWithData;

    public class RefreshTimerVL extends ViewLogic{
        
        public function RefreshTimerVL() {

            super("mainGameScene");
        }

        public function startRefresh(itemID:String, refreshTime:Number):void {

            var refreshTimeLine:MovieClip = getRefreshItemByID(itemID);
            var itemMC:MovieClip = content["itemsContainer"][itemID];
            var tween:Tween = new Tween(refreshTimeLine,
                    "x",
                    null,
                    -refreshTimeLine.width,
                    0, refreshTime, true);

            itemMC.addEventListener(Event.COMPLETE, progressAnimFinished);
            tween.addEventListener(TweenEvent.MOTION_FINISH, tweenAnimFinished);
        }

        private function getRefreshItemByID(itemID:String):MovieClip {

            return content["itemsContainer"][itemID]["refreshTimeLine"]["timeLineMC"] as MovieClip;
        }

        private function tweenAnimFinished(event:Event):void {

            ((event.currentTarget as Tween).obj as MovieClip).dispatchEvent(new Event(Event.COMPLETE, true));
        }

        private function progressAnimFinished(event:Event):void {

            var itemID:String = (event.currentTarget as MovieClip).name;

            dispatchEvent(new EventWithData(GameEvents.PROGRESS_ITEM_FINISHED, itemID));
        }
    }
}
