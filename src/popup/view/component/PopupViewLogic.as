package popup.view.component {
    import core.view.components.ViewLogic;

<<<<<<< Updated upstream
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
=======
import flash.display.MovieClip;
import flash.display.SimpleButton;
>>>>>>> Stashed changes
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    import popup.config.PopupEventsConfig;

    public class PopupViewLogic extends ViewLogic {

        //text
        protected var titleTxt:TextField;
        protected var bodyTxt:TextField;

        //display object(movie clip, image and other object)
        protected var title:DisplayObject;
        protected var body:DisplayObject;

        //btns
        protected var buttons:Array = [];
        public function PopupViewLogic(assetInstanceName:String) {
            super(assetInstanceName);
            content.visible = true;
            initArt();
            registerButtons();
        }

        protected function initArt():void {

            initBtns();

            initTitleText;
            initBodyText();

            initTitle();
            initBody();
        }

        protected function initBtns():void {
            //TODO: need add logic for do btns;
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

            var button:MovieClip;

            if(content.getChildByName("closeBtn") != null){
                button = content.getChildByName("closeBtn") as MovieClip;
                button.addEventListener(MouseEvent.CLICK, closeBtnClicked);
            }
        }

        protected function closeBtnClicked(event:MouseEvent):void {
            event.currentTarget.removeEventListener(MouseEvent.CLICK, closeBtnClicked);
            dispatchEvent(new Event(PopupEventsConfig.CLOSE_BTN_CLICKED));
        }
}
}
