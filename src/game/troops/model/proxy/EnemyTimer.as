package game.troops.model.proxy {
import org.puremvc.as3.patterns.proxy.Proxy;

    public class EnemyTimer extends Proxy {

        public static const NAME:String = "EnemyTimer";
        public function EnemyTimer(data:Object = null) {
            super(NAME, data);
        }

        private function generateTimeForNextWave(enemyWaveLevel:*):uint {

            return 100;
        }
    }
}
