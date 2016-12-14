package game.model.vo.items {
    public class ItemVO {

        public var itemID:String;

        public var coinsPrize:Number;
        public var unlockCoins:Number;
        public var refreshTime:Number;

        public var unlock:Boolean;
        public var enable:Boolean;

        public var autoClick:Boolean;
        public var autoClickLevel:Number;
        public var autoClickUnlockPrize:Number;

        public var refreshFinished:Boolean = true;
        public var multiplier:Vector.<int> = new <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        public var multiplierLevel:int = 1;
    }
}
