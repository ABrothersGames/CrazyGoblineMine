package game.controller.command {
    import flash.display.MovieClip;

    import game.config.GameItemClickedTypes;
    import game.config.GameNotifications;
    import game.controller.command.common.SimpleGameCommand;
    import game.model.vo.items.ItemVO;
    import game.model.vo.items.ItemsVO;

    import org.puremvc.as3.interfaces.INotification;

    public class ItemClickedCommand extends SimpleGameCommand {

        override public function execute(notification:INotification):void {

            var itemID:String = notification.getBody().itemID as String;
            var clickedItemType:String = notification.getBody().itemClickType as String;
            var itemPrize:Number = itemsProxy.getItemVO(itemID).coinsPrize;
            var itemVO:ItemVO = itemsProxy.getItemVO(itemID) as ItemVO;

            switch (clickedItemType){
                case GameItemClickedTypes.UNLOCK_CLICKED_TYPE:
                    itemVO.unlock = true;
                    itemPrize = -itemPrize;
                    break;
                case GameItemClickedTypes.ENABLE_CLICKED_TYPE:
                    itemVO.refreshFinished = false;
                    sendNotification(GameNotifications.REFRESH_ITEM_START, itemID);
                    break;
            }

            sendNotification(GameNotifications.UPDATE_USER_BALANCE, itemPrize);
        }
    }
}
