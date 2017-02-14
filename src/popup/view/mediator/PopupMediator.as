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

    public static const NAME:String = "";
    public function PopupMediator(viewComponent:ViewLogic, eclipseBackground:Boolean = true) {
            super(NAME, viewComponent);
        }

        override public function onRegister():void {
            super.onRegister();

        }

        override public function onRemove():void {
            super.onRemove();
        }

        override public function listNotificationInterests():Array {
            return [];
        }

        override public function handleNotification(notification:INotification):void {
            switch (notification.getName()){

            }
        }

        private function registerListeners():void {

            popupVL.addEventListener(PopupEventsConfig.CLOSE_BTN_CLICKED, closeBtnClicked);
        }

        private function closeBtnClicked(event:Event):void {
            sendNotification(PopupNotificationsConfig.CLOSE_POPUP, getViewComponent().name);
        }

        private function get popupVL():PopupViewLogic {

            return viewComponent as PopupViewLogic;
        }
    }
}


