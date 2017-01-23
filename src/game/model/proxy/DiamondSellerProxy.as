package game.model.proxy {
    import game.config.GameNotifications;
    import game.model.vo.DiamondSellerVO;

    import org.puremvc.as3.patterns.proxy.Proxy;

    public class DiamondSellerProxy extends Proxy {

        public static const NAME:String = "DiamondSellerProxy";

        public function DiamondSellerProxy(data:DiamondSellerVO):void {

            super(NAME, data);
        }

        public function get diamondSellerVO():DiamondSellerVO {

            return data as DiamondSellerVO;
        }

        public function increaseDiamondPrize():void {

            diamondSellerVO.diamondCost = ((diamondSellerVO.diamondCost * 10) + 1)/10; // need for fixed flash bug with increase 0.1
            trace(diamondSellerVO.diamondCost);
        }

        public function updateDiamondSellerState(userBalance:Number):void {

            if(userBalance >= diamondSellerVO.diamondCost){
                sendNotification(GameNotifications.ENABLE_DIAMOND_SELLER);
            }else {
                sendNotification(GameNotifications.DISABLE_DIAMOND_SELLER);
            }
        }
        public function set diamondCost(cost:Number):void{
            diamondSellerVO.diamondCost = cost;
        }
        public function get diamondCost():Number{
            return diamondSellerVO.diamondCost as Number;
        }
    }
}
