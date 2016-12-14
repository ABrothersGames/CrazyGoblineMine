package game.view.mediator {
    import core.view.components.ViewLogic;
    import core.view.mediators.UIMediator;

    import flash.events.Event;

    import game.config.GameEvents;

    import game.view.vl.AutoUpdateMangerMenuVL;

    public class AutoUpdateMangerMenuMediator extends UIMediator {

        public static const NAME:String = "AutoUpdateMangerMenuMediator";

        public function AutoUpdateMangerMenuMediator(viewComponent:AutoUpdateMangerMenuVL) {

            super(NAME, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            registerListeners();
        }

        private function registerListeners():void {

            autoUpdateMangerMenuVL.addEventListener(GameEvents.UPDATE_MANAGER_MENU_CLOSE_BTN_CLICKED, closeAutoUpdateManagerMenu);
        }

        private function get autoUpdateMangerMenuVL():AutoUpdateMangerMenuVL {

            return viewComponent as AutoUpdateMangerMenuVL;
        }

        private function closeAutoUpdateManagerMenu(event:Event):void {

            facade.removeMediator(AutoUpdateMangerMenuMediator.NAME);
        }
    }
}
