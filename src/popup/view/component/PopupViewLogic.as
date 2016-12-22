package popup.view.component {
    import core.view.components.ViewLogic;
    import flash.display.SimpleButton;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import popup.config.PopupEventsConfig;

    public class PopupViewLogic extends ViewLogic {
        public function PopupViewLogic(assetInstanceName:String) {
            super(assetInstanceName);
            registerButton();
        }

        private function registerButton():void {

            var button:SimpleButton;

            if(content.getChildByName("closeBtn") != null){
                button.addEventListener(MouseEvent.CLICK, closeBtnClicked);
            }
        }

        private function closeBtnClicked(event:MouseEvent):void {
            event.currentTarget.removeEventListener(MouseEvent.CLICK, closeBtnClicked);
            dispatchEvent(new Event(PopupEventsConfig.CLOSE_BTN_CLICKED));
        }
}
}
