/**
 * Created by SalamandeR on 26.12.2016.
 */
package game.controller.command {
import game.config.GameNotifications;
import game.controller.command.common.SimpleGameCommand;
    import org.puremvc.as3.interfaces.INotification;

    public class SlotAcceptedCommand extends SimpleGameCommand{
        override public function execute(notification:INotification):void {
            var slotID:int = notification.getBody().id;
            var slotName:String = notification.getBody().name;
            var slotAcceptedType:String = notification.getType() as String;
            var data:Object = {};
            switch (slotAcceptedType){
                case 'saving':{
                    data['goldAmount']=userBalanceProxy.userBalance;
                    data['diamondAmount']=userBalanceProxy.userDiamondBalance;
                    data['diamondCost']=diamondSellerProxy.diamondSellerVO.diamondCost;
                    dataFileProxy.saveGameDataToFile(data,slotID,slotName);
                    break;
                }
                case 'loading':{
                    dataFileProxy.loadGameDataFromFile(slotID,slotName);

                    break;
                }
            }
        }
    }
}
