/**
 * Created by aandriushchenko on 05-Jul-16.
 */
package game.view.vl {
    import core.view.components.ViewLogic;
    import core.warehouses.WarehouseResources;

    import flash.display.Bitmap;

    import flash.display.DisplayObject;

    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;

    public class LoadingGameVL extends ViewLogic {
        public function LoadingGameVL() {
            var cont:DisplayObjectContainer = WarehouseResources.instance.getAssetLoader("preLoaderBackground") as DisplayObjectContainer;

            content = new Sprite();
            content.addChild(cont);
        }
    }
}
