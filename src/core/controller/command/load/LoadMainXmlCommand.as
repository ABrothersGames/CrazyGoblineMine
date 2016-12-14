package core.controller.command.load {
    import core.configs.GeneralNotifCommandConfig;
    import core.model.proxy.AppXMLProxy;
    import core.model.proxy.FlashVarsProxy;

    import flash.events.Event;

    import flash.net.URLLoader;
    import flash.net.URLRequest;

    import org.puremvc.as3.interfaces.INotification;

    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class LoadMainXmlCommand extends SimpleCommand {

        override public function execute(notification:INotification):void {

            var xmlUtl:String = (facade.retrieveProxy(FlashVarsProxy.NAME) as FlashVarsProxy).xmlPath;

            var myXMLURL:URLRequest = new URLRequest(xmlUtl);
            var myLoader:URLLoader = new URLLoader(myXMLURL);
            myLoader.addEventListener("complete", xmlLoaded);
        }

        private function xmlLoaded(event:Event):void {

            var xml:XML = XML(event.target.data);
            facade.registerProxy(new AppXMLProxy(xml));

            sendNotification(GeneralNotifCommandConfig.LOAD_ASSETS);
        }
    }
}
