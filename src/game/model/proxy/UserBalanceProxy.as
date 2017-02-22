package game.model.proxy {
    import game.model.vo.UserBalanceVO;

    import org.puremvc.as3.patterns.proxy.Proxy;

    public class UserBalanceProxy extends Proxy {

        public static const NAME:String = "UserBalanceProxy";
        public function UserBalanceProxy(data:UserBalanceVO) {

            super(NAME, data);
        }

        public function set userBalance(value:Number):void {

            userBalanceVO.balance = value;
        }
        public function set userDiamondBalance(value:Number):void {

            userBalanceVO.diamondBalance = value;
        }
        public function set userSessionBalance(value:Number):void {
            userBalanceVO.sessionBalance = value;
        }
        public function set userSessionDiamondBalance(value:Number):void {
            userBalanceVO.sessionDiamondBalance = value;
        }

        public function get userBalance():Number {

            return userBalanceVO.balance as Number;
        }

        public function get userDiamondBalance():Number {

            return userBalanceVO.diamondBalance as Number;
        }
        public function get userSessionBalance():Number {
            return userBalanceVO.sessionBalance as Number;
        }
        public function get userSessionDiamondBalance():Number {
            return userBalanceVO.sessionBalance as Number;
        }

        public function get userBalanceVO():UserBalanceVO {

            return data as UserBalanceVO;
        }
        public function refreshSessionBalance():void {
            userBalanceVO.sessionBalance = 0;
            userBalanceVO.sessionDiamondBalance = 0;
        }
    }
}
