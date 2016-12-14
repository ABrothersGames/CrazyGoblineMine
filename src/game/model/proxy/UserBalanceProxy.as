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

        public function get userBalance():Number {

            return userBalanceVO.balance as Number;
        }

        public function get userBalanceVO():UserBalanceVO {

            return data as UserBalanceVO;
        }
    }
}
