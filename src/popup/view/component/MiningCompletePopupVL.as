/**
 * Created by SalamandeR on 20.02.2017.
 */
package popup.view.component {
import flash.display.DisplayObjectContainer;
import flash.text.TextField;

public class MiningCompletePopupVL extends PopupViewLogic{
        private var goldMined:TextField;
        private var diamondMined:TextField;
        private var goldTotal:TextField;
        private var diamondTotal:TextField;
        public function MiningCompletePopupVL(assetInstanceName:String) {
            super(assetInstanceName);
            initInfoFields();
        }
        private function initInfoFields():void{
            if(popupContent.getChildByName("bodyUserInfo") != null){
                bodyUserInfo = popupContent.getChildByName("bodyUserInfo") as DisplayObjectContainer;
            }
        }
        public function addMiningGold(value:int):void{
            if(bodyUserInfo.getChildByName("goldMined") != null){
                goldMined = bodyUserInfo.getChildByName("goldMined") as TextField;
                goldMined.text = value.toString();
            }
        }
        public function addMiningDiamond(value:int):void{
            if(bodyUserInfo.getChildByName("diamondMined") != null){
                diamondMined = bodyUserInfo.getChildByName("diamondMined") as TextField;
                diamondMined.text = value.toString();
            }
        }
        public function addTotalGold(value:int):void{
            if(bodyUserInfo.getChildByName("goldTotal") != null){
                goldTotal = bodyUserInfo.getChildByName("goldTotal") as TextField;
                goldTotal.text = value.toString();
            }
        }
        public function addTotalDiamond(value:int):void{
            if(bodyUserInfo.getChildByName("diamondTotal") != null){
                diamondTotal = bodyUserInfo.getChildByName("diamondTotal") as TextField;
                diamondTotal.text = value.toString();
            }
        }
    }
}
