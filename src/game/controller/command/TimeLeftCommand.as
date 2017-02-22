/**
 * Created by SalamandeR on 07.02.2017.
 */
package game.controller.command {
import game.config.GameNotifications;
import game.controller.command.common.SimpleGameCommand;

import org.puremvc.as3.interfaces.INotification;

import popup.config.PopupNotificationsConfig;

import popup.model.proxy.PopupDto;

import popup.view.component.MiningCompletePopupVL;

import popup.view.component.PopupViewLogic;
import popup.view.mediator.MiningCompletePopupMediator;

import popup.view.mediator.PopupMediator;

public class TimeLeftCommand extends SimpleGameCommand{

        override public function execute(notification:INotification):void {
            sendNotification(GameNotifications.STOP_MINING);

            var popupDto:PopupDto= new PopupDto();
            popupDto.id = "miningFinishPopup";
            popupDto.popupMediator = MiningCompletePopupMediator;
            popupDto.popupViewLogic = MiningCompletePopupVL;
            //popupsProxy.addPopupToQueue(popupDto);

            facade.registerMediator(new MiningCompletePopupMediator(new MiningCompletePopupVL('miningFinishPopup')));

            sendNotification(PopupNotificationsConfig.ADD_USER_INFO_TO_POPUP, userBalanceProxy.userBalanceVO)
        }
    }
}
