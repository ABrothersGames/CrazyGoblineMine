/**
 * Created by SalamandeR on 16.01.2017.
 */
package game.controller.command {
import game.view.mediator.SaveAndLoadMediator;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

    public class CancelClickedCommand extends SimpleCommand {

        override public function execute(notification:INotification):void {
            facade.removeMediator(SaveAndLoadMediator.NAME);
        }
    }
}