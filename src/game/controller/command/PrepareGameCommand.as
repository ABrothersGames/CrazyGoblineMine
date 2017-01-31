package game.controller.command {
    import core.configs.GeneralNotifCommandConfig;

    import game.config.GameNotifications;
    import game.controller.command.autoUpdate.OpenAutoUpdateManagerMenu;
    import game.model.proxy.DiamondSellerProxy;
    import game.model.proxy.items.ItemsProxy;
    import game.model.proxy.UserBalanceProxy;
    import game.model.vo.DiamondSellerVO;
    import game.model.vo.items.ItemsVO;
    import game.model.vo.UserBalanceVO;
    import game.view.mediator.DiamondSellerMediator;
    import game.view.mediator.GameMainSceneMediator;

    import game.view.mediator.GameMenuMediator;
    import game.view.mediator.ItemsMediators;
    import game.view.vl.DiamondSellerVL;
    import game.view.vl.GameMainSceneVL;
    import game.view.vl.GameMenuVL;
    import game.view.vl.ItemsVL;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

import popup.config.PopupNotificationsConfig;
import popup.controller.command.ClosePopupCommand;
import popup.controller.command.OpenPopupCommand;
import popup.model.proxy.PopupsProxy;

public class PrepareGameCommand extends SimpleCommand {

        override public function execute(notification:INotification):void {

            registerProxy();
            registerCommands();
            registerMediators();
        }

        private function registerProxy():void {
            facade.registerProxy(new ItemsProxy(new ItemsVO()));
            facade.registerProxy(new UserBalanceProxy(new UserBalanceVO()));
            facade.registerProxy(new DiamondSellerProxy(new DiamondSellerVO()));
            facade.registerProxy(new PopupsProxy());
        }

        private function registerCommands():void {

            facade.registerCommand(GameNotifications.START_GAME, StartGameCommand);
            facade.registerCommand(GameNotifications.PREPARE_NEW_GAME_PARAMS, PrepareNewGameParamsCommand);
            facade.registerCommand(GameNotifications.ITEM_CLICKED, ItemClickedCommand);
            facade.registerCommand(GameNotifications.UPDATE_USER_BALANCE, UpdateUserBalanceCommand);
            facade.registerCommand(GameNotifications.DIAMOND_BOUGHT, DiamondBoughtCommand);
            facade.registerCommand(GameNotifications.OPEN_UPDATE_MANAGER_MENU, OpenAutoUpdateManagerMenu);

            facade.registerCommand(PopupNotificationsConfig.OPEN_POPUP, OpenPopupCommand);
            facade.registerCommand(PopupNotificationsConfig.CLOSE_POPUP, ClosePopupCommand);
        }

        private function registerMediators():void {

            facade.registerMediator(new GameMenuMediator(new GameMenuVL("mainMenu")));

        }
    }
}
