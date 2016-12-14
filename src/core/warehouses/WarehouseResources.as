package core.warehouses {
    import flash.display.Bitmap;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Loader;
    import flash.net.URLLoader;
    import flash.utils.Dictionary;

    public class WarehouseResources {

        private static var _instance:WarehouseResources;

        private var _assetsWarehouses:Dictionary;
        private var _imagesWarehouses:Dictionary;
        private var _xmlWarehouses:Dictionary;

        public function WarehouseResources():void {

            _assetsWarehouses = new Dictionary();
            _imagesWarehouses = new Dictionary();
            _xmlWarehouses = new Dictionary();
        }

        public static function get instance():WarehouseResources {

            if(!_instance) {
                return _instance = new WarehouseResources();
            }

            return _instance;
        }

        //////////////////ASSETS//////////////////
        public function getAsset(instanceName:String, namespace:String = null):DisplayObject {

            var currentLoader:Loader;
            if(namespace == null) {
                for each(currentLoader in _assetsWarehouses) {
                    if(currentLoader.content != null && currentLoader.content.hasOwnProperty(instanceName)) {
                        return currentLoader.content[instanceName] as DisplayObject;
                    }
                }
                return null;
            }

            currentLoader = getAssetLoader(namespace);
            if(currentLoader != null && currentLoader.content != null && currentLoader.content.hasOwnProperty(instanceName)) {
                return currentLoader.content[instanceName] as DisplayObject;
            }

            return null;
        }

        public function setAssetLoader(Name:String, content:Loader):void {

            _assetsWarehouses[Name] = content;
        }

        public function getAssetLoader(Name:String):Loader {

            return _assetsWarehouses[Name];
        }

        public function hasAsset(name:String):Boolean {

            if(_assetsWarehouses[name] == null) {
                return false;
            } else {
                return true;
            }
        }

        public function deleteAsset(name:String):void {

            if(hasAsset(name)) {
                delete _assetsWarehouses[name];
            }
        }

//        //////////////////Image//////////////////
//        public function setImageLoader(Name:String, content:Loader):void {
//
//            _imagesWarehouses[Name] = content;
//        }
//
//        public function getBinaryLoader(Name:String):Loader {
//
//            return _imagesWarehouses[Name];
//        }
//
//        public function getImage(instanceName:String, namespace:String = null):Loader {
//
//            if(hasImage(instanceName)){
//                return _imagesWarehouses[instanceName] as Loader;
//            }
//            return null;
//        }
//
//        public function hasImage(Name:String):Boolean {
//
//            if(_imagesWarehouses[Name] == null) {
//                return false;
//            } else {
//                return true;
//            }
//        }
//
//        public function deleteImage(name:String):void {
//
//            if(hasImage(name)) {
//                delete _imagesWarehouses[name];
//            }
//        }

        //////////////////XML//////////////////
        public function setXml(Name:String, content:XML):void {

            _xmlWarehouses[Name] = content;
        }

        public function getXml(Name:String):XML {

            return _xmlWarehouses[Name];
        }

        public function hasXml(Name:String):Boolean {

            if(_xmlWarehouses[Name] == null) {
                return false;
            } else {
                return true;
            }
        }

        public function deleteXml(name:String):void {

            if(hasXml(name)) {
                delete _xmlWarehouses[name];
            }
        }

        //TODO should be removed
        public function getClass(name:String, namespace:String = null):Class {

            var currentLoader:Loader;
            if(namespace == null) {
                for each(currentLoader in _assetsWarehouses) {
                    if(currentLoader.contentLoaderInfo.applicationDomain.hasDefinition(name)) {
                        return currentLoader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
                    }
                }
            } else {
                currentLoader = getAssetLoader(namespace);
                if(currentLoader && currentLoader.contentLoaderInfo.applicationDomain.hasDefinition(name)) {
                    return currentLoader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
                }
            }
            return null;
        }
    }
}
