/**
 * Created by SalamandeR on 26.12.2016.
 */
package game.controller.command {


import game.config.GameNotifications;
import game.controller.command.common.SimpleGameCommand;
import game.view.mediator.SaveAndLoadMediator;
import game.view.vl.SaveAndLoadVL;

import org.puremvc.as3.interfaces.INotification;

    public class CheckSlotsCommand extends SimpleGameCommand{

        override public function execute(notification:INotification):void {
            facade.registerMediator(new SaveAndLoadMediator(new SaveAndLoadVL()));
            var slotsDestination:String = notification.getType() as String;
            var fileNames:Array = dataFileProxy.filesNames;
            sendNotification(GameNotifications.CHECK_SLOTS,fileNames,slotsDestination);
        }
}
}
