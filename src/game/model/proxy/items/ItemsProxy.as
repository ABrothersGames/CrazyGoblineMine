package game.model.proxy.items {

    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;

    import game.config.GameNotifications;

    import game.model.vo.items.ItemVO;
    import game.model.vo.items.ItemsVO;
    import game.model.vo.items.ItemsVO;

    import org.puremvc.as3.patterns.proxy.Proxy;

    public class ItemsProxy extends Proxy {

        public static const NAME:String = "ItemsProxy";

        public function ItemsProxy(data:ItemsVO) {
            super(NAME, data);
        }

        public function get itemsVO():ItemsVO {

            return data as ItemsVO;
        }

        public function getItemVO(id:String):ItemVO {

            for each(var item:ItemVO in itemsVO.itemsVOCollection){
                if(item.itemID == id){
                    return item;
                }
            }

            return null;
        }

        public function parseItemsConfiguration(data:Array):void {

            itemsVO.itemsVOCollection = new <ItemVO>[];

            for each(var item:Object in data){

                try{
                    var itemVO:ItemVO = createItemVO(item);
                    itemsVO.itemsVOCollection.push(itemVO);
                }catch (error:Error){
                    throw (new Error(" fail parameters for <<ItemsVO>>, make sure that <<itemConfiguration.json>> had all need parameters"));
                }
            }

            //***test***

//            var file:File = File.applicationStorageDirectory.resolvePath("readText.json"); // File.applicationStorageDirectory � ??????? ?????????, ??????? ???????? ?????????? ??? ??????? ?????????????? ?????????? AIR
//            trace(file +" :file name")
//            var stream: FileStream = new FileStream();
//            stream.open(file, FileMode.WRITE);
//            stream.writeUTFBytes(JSON.stringify(itemsVO.itemsVOCollection));
//            stream.close();
//
//            trace(JSON.stringify(itemsVO.itemsVOCollection));
        }

        public function tryUpdateItemsParametersByBalance(userBalance:Number):void {

            setStateItems(userBalance);
        }

        private function setStateItems(userBalance:Number):void {

            for each(var item:ItemVO in itemsVO.itemsVOCollection){
                if((userBalance >= item.unlockCoins) && !item.unlock){
                    sendNotification(GameNotifications.ITEM_TO_UNLOCK_STATE, item);
                } else if((userBalance < item.unlockCoins) && !item.unlock){
                    sendNotification(GameNotifications.ITEM_TO_LOCK_STATE, item);
                } else if(item.unlock && item.refreshFinished){
                    sendNotification(GameNotifications.ITEM_TO_ENABLE_STATE, item);
                } else if(item.unlock && !item.refreshFinished){
                    sendNotification(GameNotifications.ITEM_TO_DISABLE_STATE, item);
                }
            }
        }

        private function createItemVO(item:Object):ItemVO {

            var itemVO:ItemVO = new ItemVO();

            itemVO.itemID = item.id;
            itemVO.coinsPrize = item.coins;
            itemVO.unlock = item.unlock;
            itemVO.enable = item.enable;
            itemVO.unlockCoins = item.unlockCoins;
            itemVO.refreshTime = item.refreshTime;
            itemVO.autoClickUnlockPrize = item.autoClickUnlockPrize;

            return itemVO;
        }
    }
}
