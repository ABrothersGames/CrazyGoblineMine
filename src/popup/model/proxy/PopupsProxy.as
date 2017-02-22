/**
 * Created by HOME on 21.12.2016.
 */
package popup.model.proxy {
import flash.display.DisplayObject;

import org.puremvc.as3.patterns.proxy.Proxy;

    public class PopupsProxy extends Proxy {


        private var popupsQueue:Vector.<PopupDto> = new <PopupDto>[];
        private var _isFreeForOpen:Boolean = true;
        private var _currentOpenPopup:PopupDto;

        public static const NAME:String = "PopupsProxy";

        public function PopupsProxy(data:Object = null) {
            super(NAME, data);
        }

        public function getNextPopupForOpen():PopupDto {
            if(hasNextPopupForOpen && _isFreeForOpen){
                _currentOpenPopup = popupsQueue.shift();
                return _currentOpenPopup;
            }

            return null;
        }

        public function addPopupToQueue(popup:PopupDto):void {
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
        public function get currentOpenPopup():PopupDto {
            return _currentOpenPopup;
        }
    }
}
