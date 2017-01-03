package game.units.model.proxy {
    import game.units.model.dto.UnitsDto;

    import org.puremvc.as3.patterns.proxy.Proxy;

    import spark.components.List;

    public class UnitsProxy extends Proxy {

        private var unitsDto:List.<UnitsDto> =new List.<UnitsDto>();

        public function UnitsProxy(proxyName:String, data:Object) {

            unitsDto = tryParseUnitsData(data);

            super(proxyName, unitsDto);
        }

        public function tryParseUnitsData(data:Object):void {

            try{
                var unitsDto = new UnitsDto();
                unitsDto.unitId = data.unitId;
                unitsDto.unitMultiplier = data.unitMultiplier;
                unitsDto.unitPrize = data.unitPrize;
                unitsDto.unitsCount = data.unitsCount;
            }catch(ex:Error){
                throw (new Error(ex.message));
            }
        }

        public function get unitsList():List.<UnitsDto> {

            return unitsDto;
        }

        public function getUnitsInfoById(id:uint):UnitsDto {

            for each(var units:UnitsDto in unitsList){

                if(units.unitId == id){
                    return units;
                }
            }

            return null;
        }

        public function getSumUnitsPower():uint {

            var armyPower:uint;

            for each(var units:UnitsDto in unitsList){

                armyPower += units.unitsPower;
            }

            return armyPower;
        }
    }
}
