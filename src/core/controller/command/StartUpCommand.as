/**
 * Created by aandriushchenko on 21-Jun-16.
 */
package core.controller.command {
    import core.configs.GeneralNotifCommandConfig;
    import core.controller.command.load.LoadAssetsCommand;
    import core.controller.command.load.LoadBackResCommand;
    import core.controller.command.load.LoadMainXmlCommand;
    import core.model.proxy.FlashVarsProxy;
    import core.view.mediators.RootMediator;

    import flash.display.Sprite;

    import game.controller.command.PrepareGameCommand;

    import game.view.mediator.LoadingGameMediator;
    import game.view.vl.LoadingGameVL;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class StartUpCommand extends SimpleCommand {

        override public function execute(notification:INotification):void{

            var mainView:Sprite = notification.getBody() as Sprite;
            var flashvars:Object = mainView.loaderInfo.parameters;

            registerCommands();
            registerMediator(mainView);
            registerProxy(flashvars);

            sendNotification(GeneralNotifCommandConfig.LOAD_BACK_RES);
        }

        private function registerProxy(flashvars:Object):void
        {
            facade.registerProxy(new FlashVarsProxy(flashvars));
            trace((facade.retrieveProxy(FlashVarsProxy.NAME) as FlashVarsProxy).xmlPath);
        }

        private function registerMediator(mainView:Sprite):void
        {
            facade.registerMediator(new RootMediator(mainView));
        }

        private function registerCommands():void
        {
            facade.registerCommand(GeneralNotifCommandConfig.LOAD_BACK_RES, LoadBackResCommand);
            facade.registerCommand(GeneralNotifCommandConfig.LOAD_MAIN_XML, LoadMainXmlCommand);
            facade.registerCommand(GeneralNotifCommandConfig.LOAD_ASSETS, LoadAssetsCommand);
            facade.registerCommand(GeneralNotifCommandConfig.PREPARE_GAME, PrepareGameCommand);
        }
    }
}
