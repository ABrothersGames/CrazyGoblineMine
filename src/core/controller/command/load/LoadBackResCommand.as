/**
 * Created by aandriushchenko on 05-Jul-16.
 */
package core.controller.command.load {
    import core.configs.DeviceConfiguration;
    import core.configs.GeneralNotifCommandConfig;
    import core.configs.GeneralUrlResource;
    import core.warehouses.WarehouseResources;

    import flash.display.Bitmap;

    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;

    import game.view.mediator.LoadingGameMediator;

    import game.view.vl.LoadingGameVL;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class LoadBackResCommand extends SimpleCommand {
        override public function execute(notification:INotification):void {

            var loader:Loader = new Loader();
            var urlRequest:URLRequest = new URLRequest("preLoaderBackground.jpg");
            var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);

            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadResCompleted);
            loader.load(urlRequest, loaderContext);
        }

        private function loadResCompleted(event:Event):void {

            (event.currentTarget as LoaderInfo).removeEventListener(Event.COMPLETE, loadResCompleted);

            var loadingBackground:Bitmap = (event.currentTarget as LoaderInfo).content as Bitmap;

            loadingBackground.height = DeviceConfiguration.height;
            loadingBackground.width = DeviceConfiguration.width;

            WarehouseResources.instance.setAssetLoader("preLoaderBackground", event.currentTarget.loader);

            facade.registerMediator(new LoadingGameMediator(new LoadingGameVL()));

            //register pre-loading line anim (any: circle with rotation, line with percent what do you want)

            sendNotification(GeneralNotifCommandConfig.LOAD_MAIN_XML);
        }
    }
}
