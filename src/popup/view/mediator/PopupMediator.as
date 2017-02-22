package popup.view.mediator {
    import core.view.components.ViewLogic;
    import core.view.mediators.UIMediator;

    import flash.display.DisplayObject;
    import flash.events.Event;

import org.puremvc.as3.interfaces.INotification;

import popup.config.PopupEventsConfig;
    import popup.config.PopupNotificationsConfig;
    import popup.view.component.PopupViewLogic;

import popup.config.PopupEventsConfig;
import popup.config.PopupNotificationsConfig;

    public class PopupMediator extends UIMediator {

    public static var name:String = "";
    public function PopupMediator(viewComponent:ViewLogic, eclipseBackground:Boolean = true) {
            name = (viewComponent as PopupViewLogic).popupContent.name + "Mediator";
            super(name, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();
            registerListeners();
        }

        override public function onRemove():void {
            removeListeners();
            super.onRemove();
        }

        override public function listNotificationInterests():Array {
            return [];
        }

        override public function handleNotification(notification:INotification):void {
            switch (notification.getName()){

            }
        }

        protected function registerListeners():void {

            popupVL.addEventListener(PopupEventsConfig.CLOSE_BTN_CLICKED, closeBtnClicked);
        }

        protected function closeBtnClicked(event:Event):void {

            sendNotification(PopupNotificationsConfig.CLOSE_POPUP, name);
        }

        private function get popupVL():PopupViewLogic {

            return viewComponent as PopupViewLogic;
        }
        protected function removeListeners():void{
            popupVL.removeEventListener(PopupEventsConfig.CLOSE_BTN_CLICKED, closeBtnClicked);
        }
    }
}


