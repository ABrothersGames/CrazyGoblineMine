package game.view.vl {
    import core.view.components.ViewLogic;

    import flash.display.DisplayObjectContainer;

    import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
    import flash.events.MouseEvent;

    import game.config.GameEvents;

    public class GameMenuVL extends ViewLogic {

        private var startGameButton:MovieClip;

        public function GameMenuVL(assetInstanceName:String = null, nameSpace:String = null) {
            super(assetInstanceName, nameSpace);

            initArt(content);
            registerListener();

        }

        private function initArt(visualContent:DisplayObjectContainer):void {

            if(visualContent["startNewGameButton"]){
                startGameButton = visualContent["startNewGameButton"];
            }
        }

        private function registerListener():void {

            if(startGameButton){

                startGameButton.addEventListener(MouseEvent.CLICK, startGameButtonClicked);
            }
        }

        private function startGameButtonClicked(event:MouseEvent):void {
            startGameButton.removeEventListener(MouseEvent.CLICK, startGameButtonClicked);

            var aaa:Sprite = new Sprite();
            aaa.graphics.beginFill(0x00ff00);
            aaa.graphics.drawCircle(10, 10 ,10);

            startGameButton.addChild(aaa);
            dispatchEvent(new Event(GameEvents.START_NEW_GAME));
        }
    }
}
