package game.units.model.dto {
    public class UnitsDto {

        public var unitId:uint;
        public var unitPrize:uint;
        public var unitMultiplier:uint;
        public var unitsCount:uint;

        public var unitsPower = unitsCount * unitMultiplier;
    }
}
