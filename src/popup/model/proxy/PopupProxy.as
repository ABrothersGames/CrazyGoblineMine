/**
 * Created by HOME on 21.12.2016.
 */
package popup.model.proxy {
import flash.display.DisplayObject;

import org.puremvc.as3.patterns.proxy.Proxy;

    public class PopupProxy extends Proxy {

        private var popupsQueue:Vector.<DisplayObject>;
        private var _isFreeForOpen:Boolean = true;

        public function PopupProxy(proxyName:String = null, data:Object = null) {
            super(proxyName, data);
        }

        public function getNextPopupForOpen():DisplayObject {

            if(hasNextPopupForOpen){
                return popupsQueue.shift();
            }

            return null
        }

        public function addPopupToQueue(popup:DisplayObject):void {

            popupsQueue.push(popup);
        }

        public function hasNextPopupForOpen():Boolean {

            return false;
        }

        public function set isFreeForOpen(value:Boolean):void {
            _isFreeForOpen = value;
        }

        public function get isFreeForOpen():Boolean {
            return _isFreeForOpen;
        }
    }
}
