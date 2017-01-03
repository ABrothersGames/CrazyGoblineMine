package game.units.model.proxy {
    import game.units.model.dto.UnitsDto;

    public class DefenderUnitsProxy extends UnitsProxy {

        public static const NAME:String = "DefenderUnitsProxy";

        public function DefenderUnitsProxy(data:Object) {
            super(NAME, data);
        }

        private function removeUnit(id:uint, count:uint):void {
            try {
                for each(var unit:UnitsDto in unitsList ) {

                    if(unit.unitId == id) {
                        unit.unitsCount -= count;
                    }
                }
            }
            catch (ex:Error){
                throw(new Error(ex.message));
                throw(new Error("user list haven't unit with ID:" + id));
            }
        }

        public function unitBay(id:uint):void {

            try {
                for each(var unit:UnitsDto in unitsList ) {

                    if(unit.unitId == id) {
                        unit.unitsCount++;
                    }
                }
            }
            catch (ex:Error){
                throw(new Error(ex.message));
                throw(new Error("user list haven't unit with ID:" + id));
            }
        }
    }
}
