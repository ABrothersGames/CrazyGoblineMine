package game.units.model.proxy {
    import game.units.model.dto.UnitsDto;

    import org.puremvc.as3.patterns.proxy.Proxy;

    import spark.components.List;

    public class UnitsProxy extends Proxy {

        private var unitsDto:Vector.<UnitsDto> = new <UnitsDto>[];

        public function UnitsProxy(proxyName:String) {

            unitsDto = tryParseUnitsData(data);

            super(proxyName, unitsDto);
        }

        public function tryParseUnitsData(data:Object):Vector.<UnitsDto> {

            try{
                var unitsDto:Object = new UnitsDto();
                unitsDto.unitId = data.unitId;
                unitsDto.unitMultiplier = data.unitMultiplier;
                unitsDto.unitPrize = data.unitPrize;
                unitsDto.unitsCount = data.unitsCount;
            }catch(ex:Error){
                throw (new Error(ex.message));
            }

            return null;
        }

        public function get unitsList():Vector.<UnitsDto> {

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
