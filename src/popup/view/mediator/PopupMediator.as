package popup.view.mediator {
    import core.view.components.ViewLogic;
    import core.view.mediators.UIMediator;

import flash.display.DisplayObject;
import flash.events.Event;

import org.puremvc.as3.interfaces.INotification;

import popup.config.PopupEventsConfig;

public class PopupMediator extends UIMediator {

        public function PopupMediator(name:String, viewComponent:ViewLogic, eclipseBackground:Boolean = true) {
            super(name, viewComponent);
        }

        override public function onRegister():void {
            super .onRegister();


        }

        override public function onRemove():void {
            super .onRemove();
        }

        override public function listNotificationInterests():Array {
            return [];
        }

        override public function handleNotification(notification:INotification):void {
            switch (notification.getName()){

            }
        }

        private function registerListeners():void {

            (viewComponent as DisplayObject).addEventListener(PopupEventsConfig.CLOSE_BTN_CLICKED, closeBtnClicked);
        }

        private function closeBtnClicked(event:Event):void {

        }

        private function doBtnClicked(event:Event):void {

        }
    }
}


