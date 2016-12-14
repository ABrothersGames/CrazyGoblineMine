package game.view.mediator {
    import core.view.mediators.UIMediator;

    import flash.events.Event;

    import game.config.GameEvents;
    import game.config.GameNotifications;
    import game.controller.command.PrepareNewGameParamsCommand;

    import game.view.vl.GameMenuVL;

    public class GameMenuMediator extends UIMediator {

        public static const NAME:String = "GameMenuMediator";
        public function GameMenuMediator(viewComponent:GameMenuVL) {

            super(mediatorName, viewComponent);
        }
        
        override public function onRegister():void {
            super.onRegister();
            registerListeners();
        }

        private function registerListeners():void {

            (viewComponent as GameMenuVL).addEventListener(GameEvents.START_NEW_GAME, startGameEventHandler);
        }

        private function startGameEventHandler(event:Event):void {

            sendNotification(GameNotifications.PREPARE_NEW_GAME_PARAMS);
        }
    }
}
