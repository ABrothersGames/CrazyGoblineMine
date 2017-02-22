package popup.view.component {
    import core.view.components.ViewLogic;

    import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

import flash.display.MovieClip;
    import flash.display.SimpleButton;

    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    import popup.config.PopupEventsConfig;

    public class PopupViewLogic extends ViewLogic {
        public var popupContent:DisplayObjectContainer;
        //text
        protected var titleTxt:TextField;
        protected var bodyTxt:TextField;

        //display object(movie clip, image and other object)
        protected var title:DisplayObject;
        protected var body:DisplayObject;
        protected var bodyUserInfo:DisplayObjectContainer;
        //btns
        protected var buttons:Array = [];
        protected var infoFields:Array = [];
        public function PopupViewLogic(assetInstanceName:String) {
            super('popupsContainer');
            popupContent = content[assetInstanceName];
            popupContent.visible = true;
            initArt();
            registerButtons();
        }

        protected function initArt():void {

            initBtns();

            initTitleText;
            initBodyText();

            initTitle();
            initBody();
            //initUserInfoFields();
        }

        protected function initBtns():void {
            //TODO: need add logic for do btns;
        }

        protected function initTitleText():void {

            if(popupContent.getChildByName("titleTxt") != null){
                titleTxt = popupContent.getChildByName("titleTxt") as TextField;
            }
        }

        protected function initBodyText():void {

            if(popupContent.getChildByName("bodyTxt") != null){
                bodyTxt = popupContent.getChildByName("bodyTxt") as TextField;
            }
        }

        protected function initTitle():void {

            if(popupContent.getChildByName("title") != null){
                title = popupContent.getChildByName("title") as DisplayObject;
            }
        }

        protected function initBody():void {

            if(popupContent.getChildByName("body") != null){
                body = popupContent.getChildByName("body") as DisplayObject;
            }
        }
        /*protected function initUserInfoFields():void{

            if(popupContent.getChildByName("bodyUserInfo") != null){
               bodyUserInfo = popupContent.getChildByName("bodyUserInfo") as DisplayObjectContainer;
            }
            if(bodyUserInfo.numChildren>0){
                for(var i:int=0; i<bodyUserInfo.numChildren; i++){
                    infoFields.push(bodyUserInfo.getChildAt(i));
                }
            }
        }*/

        protected function registerButtons():void {

            var button:MovieClip;

            if(popupContent.getChildByName("closeBtn") != null){
                button = popupContent.getChildByName("closeBtn") as MovieClip;
                button.addEventListener(MouseEvent.CLICK, closeBtnClicked);
            }
        }

        protected function closeBtnClicked(event:MouseEvent):void {
            event.currentTarget.removeEventListener(MouseEvent.CLICK, closeBtnClicked);
            dispatchEvent(new Event(PopupEventsConfig.CLOSE_BTN_CLICKED));
        }
    }
}
