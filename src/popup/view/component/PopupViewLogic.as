package popup.view.component {
    import core.view.components.ViewLogic;

    import flash.display.DisplayObject;
    import flash.display.SimpleButton;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    import popup.config.PopupEventsConfig;

    //Simple popup must have only title, body and button for close this popup
    public class PopupViewLogic extends ViewLogic {

        //text
        protected var titleTxt:TextField;
        protected var bodyTxt:TextField;

        //display object(movie clip, image and other object)
        protected var title:DisplayObject;
        protected var body:DisplayObject;

        public function PopupViewLogic(assetInstanceName:String) {
            super(assetInstanceName);
            registerButtons();
            initArt();
        }

        protected function initArt():void {

            initTitleText;
            initBodyText();

            initTitle();
            initBody();
        }

        protected function initTitleText():void {

            if(content.getChildByName("titleTxt") != null){
                titleTxt = content.getChildByName("titleTxt") as TextField;
            }
        }

        protected function initBodyText():void {

            if(content.getChildByName("bodyTxt") != null){
                bodyTxt = content.getChildByName("bodyTxt") as TextField;
            }
        }

        protected function initTitle():void {

            if(content.getChildByName("title") != null){
                title = content.getChildByName("title") as DisplayObject;
            }
        }

        protected function initBody():void {

            if(content.getChildByName("body") != null){
                body = content.getChildByName("body") as DisplayObject;
            }
        }

        protected function registerButtons():void {

            var button:SimpleButton;

            if(content.getChildByName("closeBtn") != null){
                button.addEventListener(MouseEvent.CLICK, closeBtnClicked);
            }
        }

        protected function closeBtnClicked(event:MouseEvent):void {
            event.currentTarget.removeEventListener(MouseEvent.CLICK, closeBtnClicked);
            dispatchEvent(new Event(PopupEventsConfig.CLOSE_BTN_CLICKED));
        }
}
}
