package core.controller.command.load {
    import br.com.stimuli.loading.BulkLoader;

    import core.configs.GeneralNotifCommandConfig;

    import core.model.proxy.AppXMLProxy;
    import core.warehouses.WarehouseResources;

    import flash.display.DisplayObject;
    import flash.display.Loader;

    import flash.events.Event;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class LoadAssetsCommand extends SimpleCommand {

        override public function execute(notification:INotification):void{

            var assetsList:XMLList = (facade.retrieveProxy(AppXMLProxy.NAME) as AppXMLProxy).mainUrlXmlDto.xmlList;
            var bulkLoader:BulkLoader = new BulkLoader("General_Loading");

            for(var i:uint = 0; i<assetsList.length(); i++){
                bulkLoader.add(assetsList[i].@URL.toString(), {id:assetsList[i].@ID.toString(), type:assetsList[i].@TYPE.toString()});
            }

            bulkLoader.addEventListener(BulkLoader.COMPLETE, onLoaderComplete);
            bulkLoader.start();

        }

        protected function onLoaderComplete(event:Event):void
        {

            var bl:BulkLoader=event.target as BulkLoader;
            bl.removeEventListener(BulkLoader.COMPLETE, onLoaderComplete);

            //загрузка в WareHouse
            var loaderForWarehouse:Loader;
            var id:String;
            var WareHouseInstance:WarehouseResources = WarehouseResources.instance;
            for (var i:int = 0; i < bl.items.length; i++){
                loaderForWarehouse = (bl.items[i]).loader;
                id =(bl.items[i]).id;
                WareHouseInstance.setAssetLoader(id, loaderForWarehouse);
            }

            sendNotification(GeneralNotifCommandConfig.PREPARE_GAME);
        }
    }
}
