package game.units.model.proxy {
    import game.units.model.dto.EnemyWaveDto;
    import game.units.model.dto.UnitsDto;

    public class EnemyUnitsProxy extends UnitsProxy {

        public static const NAME:String = "EnemyUnitsProxy";

        private var waveTime:Number = 0;

        // temp value
        private var currentWave:Object;
        private var nextWave:Object;

        private var _enemyWaveDto:EnemyWaveDto;
        public function EnemyUnitsProxy() {

            super(NAME);

            _enemyWaveDto = new EnemyWaveDto();
        }

        //enemy array index of elements its ID enemy (100+index in art);
        public function generateEnemyWave():void {
            //TODO: need create real generator of enemy wave according math!!!
            enemyWaveDto.enemiesWave = [2];
        }

        public function get enemyWave():Array {

            return enemyWaveDto.enemiesWave;
        }

        private function get enemyWaveDto():EnemyWaveDto {

            return _enemyWaveDto;
        }
    }
}
