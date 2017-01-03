/**
 * Created by HOME on 21.12.2016.
 */
package popup.model.proxy {
import flash.display.DisplayObject;

import org.puremvc.as3.patterns.proxy.Proxy;

    public class PopupProxy extends Proxy {

        public static const NAME:String = "PopupProxy";

        private var popupsQueue:Vector.<String>;
        private var _isFreeForOpen:Boolean = true;
        private var _currentOpenPopup:String;

        public function PopupProxy() {
            super(NAME, null);
        }

        public function getNextPopupForOpen():String {

            if(hasNextPopupForOpen){
                _currentOpenPopup = popupsQueue.shift();
                return _currentOpenPopup;
            }

            return null;
        }

        public function addPopupToQueue(popup:String):void {

            popupsQueue.push(popup);
        }

        public function hasNextPopupForOpen():Boolean {

            return popupsQueue.length > 0;
        }

        public function set isFreeForOpen(value:Boolean):void {
            _isFreeForOpen = value;
        }

        public function get isFreeForOpen():Boolean {
            return _isFreeForOpen;
        }

        public function get currentOpenPopup():String {

            return _currentOpenPopup;
        }
    }
}
