package popup.view.mediator {
    import core.view.components.ViewLogic;
    import core.view.mediators.UIMediator;

    import flash.display.DisplayObject;
    import flash.events.Event;

    import popup.config.PopupEventsConfig;
    import popup.config.PopupNotificationsConfig;
    import popup.view.component.PopupViewLogic;

<<<<<<< Updated upstream
    public class PopupMediator extends UIMediator {

        public function PopupMediator(name:String, viewComponent:ViewLogic, modalBackground:Boolean = true, autoClose:int = 0) {
            super(name, viewComponent);
=======
import popup.config.PopupEventsConfig;
import popup.config.PopupNotificationsConfig;

    public class PopupMediator extends UIMediator {

    public static const NAME:String = "";
    public function PopupMediator(viewComponent:ViewLogic, eclipseBackground:Boolean = true) {
            super(NAME, viewComponent);
>>>>>>> Stashed changes
        }

        override public function onRegister():void {
            super.onRegister();
<<<<<<< Updated upstream
            registerListeners();
=======
>>>>>>> Stashed changes
        }

        override public function onRemove():void {
            super.onRemove();
<<<<<<< Updated upstream
=======
        }

        override public function listNotificationInterests():Array {
            return [];
        }

        override public function handleNotification(notification:INotification):void {
            switch (notification.getName()){

            }
>>>>>>> Stashed changes
        }

        private function registerListeners():void {

            popupVL.addEventListener(PopupEventsConfig.CLOSE_BTN_CLICKED, closeBtnClicked);
        }

        private function closeBtnClicked(event:Event):void {

<<<<<<< Updated upstream
            facade.removeMediator(mediatorName);
=======
            sendNotification(PopupNotificationsConfig.CLOSE_POPUP, getViewComponent().name);
>>>>>>> Stashed changes
        }

        private function get popupVL():PopupViewLogic {

            return viewComponent as PopupViewLogic;
        }
    }
}


