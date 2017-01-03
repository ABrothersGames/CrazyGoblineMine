package popup.view.mediator {
    import core.view.components.ViewLogic;
    import core.view.mediators.UIMediator;

    import flash.display.DisplayObject;
    import flash.events.Event;

    import popup.config.PopupEventsConfig;
    import popup.config.PopupNotificationsConfig;

    public class PopupMediator extends UIMediator {

        public function PopupMediator(name:String, viewComponent:ViewLogic, modalBackground:Boolean = true) {
            super(name, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            registerListeners();
        }

        override public function onRemove():void {
            super.onRemove();
        }

        private function registerListeners():void {

            (viewComponent as DisplayObject).addEventListener(PopupEventsConfig.CLOSE_BTN_CLICKED, closeBtnClicked);
        }

        private function closeBtnClicked(event:Event):void {
            sendNotification(PopupNotificationsConfig.CLOSE_POPUP, mediatorName);
        }
    }
}


