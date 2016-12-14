package core {
    import core.configs.GeneralNotifCommandConfig;

    import flash.display.DisplayObject;
    import flash.display.Sprite;

    import org.puremvc.as3.patterns.facade.Facade;

    public class AppFacade extends Facade {

        private static var instance:AppFacade;

        public static function getInstance():AppFacade{

            if(!instance){
                instance = new AppFacade();
            }
            return instance as AppFacade;
        }

        public function startup( command:Class, mainSprite:Sprite):void {

            registerCommand(GeneralNotifCommandConfig.START_UP_COMMAND, command);
            sendNotification(GeneralNotifCommandConfig.START_UP_COMMAND, mainSprite);
        }
    }
}
