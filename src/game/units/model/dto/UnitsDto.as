package game.units.model.dto {
    public class UnitsDto {

        //unitId - 0-9 user unit, 1000 - 1009 enemy units id
        public var unitId:uint;
        public var unitPrize:uint;
        public var unitMultiplier:uint;
        public var unitsCount:uint;

        public var unitsPower:uint = unitsCount * unitMultiplier;
    }
}
