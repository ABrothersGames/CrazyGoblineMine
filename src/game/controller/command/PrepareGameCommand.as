package game.controller.command {
    import core.configs.GeneralNotifCommandConfig;

    import game.config.GameNotifications;
    import game.controller.command.autoUpdate.OpenAutoUpdateManagerMenu;
import game.model.proxy.DataFileProxy;
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
import game.view.mediator.SaveAndLoadMediator;
import game.view.vl.DiamondSellerVL;
    import game.view.vl.GameMainSceneVL;
    import game.view.vl.GameMenuVL;
    import game.view.vl.ItemsVL;
import game.view.vl.SaveAndLoadVL;

import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

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
            facade.registerProxy(new DataFileProxy());
        }

        private function registerCommands():void {

            facade.registerCommand(GameNotifications.START_GAME, StartGameCommand);
            facade.registerCommand(GameNotifications.PREPARE_NEW_GAME_PARAMS, PrepareNewGameParamsCommand);
            facade.registerCommand(GameNotifications.ITEM_CLICKED, ItemClickedCommand);
            facade.registerCommand(GameNotifications.UPDATE_USER_BALANCE, UpdateUserBalanceCommand);
            facade.registerCommand(GameNotifications.DIAMOND_BOUGHT, DiamondBoughtCommand);
            facade.registerCommand(GameNotifications.OPEN_UPDATE_MANAGER_MENU, OpenAutoUpdateManagerMenu);
            facade.registerCommand(GameNotifications.CHECK_SLOTS_COMMAND, CheckSlotsCommand);
            facade.registerCommand(GameNotifications.SLOT_ACCEPTED_COMMAND, SlotAcceptedCommand);
            facade.registerCommand(GameNotifications.CANCEL_CLICKED_COMMAND, CancelClickedCommand);
            facade.registerCommand(GameNotifications.TIME_LEFT_COMMAND, TimeLeftCommand);
        }

        private function registerMediators():void {

            facade.registerMediator(new GameMenuMediator(new GameMenuVL("mainMenu")));
        }
    }
}
