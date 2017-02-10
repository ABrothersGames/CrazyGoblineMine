/**
 * Created by HOME on 21.12.2016.
 */
package popup.model.proxy {
import flash.display.DisplayObject;

import org.puremvc.as3.patterns.proxy.Proxy;

    public class PopupsProxy extends Proxy {

<<<<<<< Updated upstream:src/popup/model/proxy/PopupProxy.as
        public static const NAME:String = "PopupProxy";

        private var popupsQueue:Vector.<String>;
        private var _isFreeForOpen:Boolean = true;
        private var _currentOpenPopup:String;

        public function PopupProxy() {
            super(NAME, null);
        }

        public function getNextPopupForOpen():String {
=======
        private var popupsQueue:Vector.<PopupDto> = new <PopupDto>[];
        private var _isFreeForOpen:Boolean = true;
        private var _currentOpenPopup:PopupDto;

        public static const NAME:String = "PopupsProxy";

        public function PopupsProxy(data:Object = null) {
            super(NAME, data);
        }

        public function getNextPopupForOpen():PopupDto {
>>>>>>> Stashed changes:src/popup/model/proxy/PopupsProxy.as

            if(hasNextPopupForOpen && _isFreeForOpen){
                _currentOpenPopup = popupsQueue.shift();
                return _currentOpenPopup;
            }

            return null;
        }

<<<<<<< Updated upstream:src/popup/model/proxy/PopupProxy.as
        public function addPopupToQueue(popup:String):void {
=======
        public function addPopupToQueue(popup:PopupDto):void {
>>>>>>> Stashed changes:src/popup/model/proxy/PopupsProxy.as

            popupsQueue.push(popup);
        }

        public function get hasNextPopupForOpen():Boolean {

            return popupsQueue.length > 0;
        }

        public function set isFreeForOpen(value:Boolean):void {
            _isFreeForOpen = value;
        }

        public function get isFreeForOpen():Boolean {
            return _isFreeForOpen;
        }

<<<<<<< Updated upstream:src/popup/model/proxy/PopupProxy.as
        public function get currentOpenPopup():String {
=======
        public function get currentOpenPopup():PopupDto {
>>>>>>> Stashed changes:src/popup/model/proxy/PopupsProxy.as

            return _currentOpenPopup;
        }
    }
}
