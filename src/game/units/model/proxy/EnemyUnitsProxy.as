package game.units.model.proxy {

    public class EnemyUnitsProxy extends UnitsProxy {

        public static const NAME:String = "EnemyUnitsProxy";

        private var waveTime:Number = 0;

        // temp value
        private var currentWave:Object;
        private var nextWave:Object;
        public function EnemyUnitsProxy(data:Object) {

            super(NAME, data);
        }

        public function generateEnemyWave():void {

        }
    }
}
