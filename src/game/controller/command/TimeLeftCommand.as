/**
 * Created by SalamandeR on 07.02.2017.
 */
package game.controller.command {
import game.config.GameNotifications;
import game.controller.command.common.SimpleGameCommand;

import org.puremvc.as3.interfaces.INotification;

    public class TimeLeftCommand extends SimpleGameCommand{

        override public function execute(notification:INotification):void {
            sendNotification(GameNotifications.STOP_MINING);
            //facade.registerMediator(new MiningResultPopupMediator(new MinigResultPopupVL));
        }
    }
}
