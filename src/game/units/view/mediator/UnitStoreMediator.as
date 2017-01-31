package game.units.view.mediator {
    import core.view.mediators.UIMediator;

    import game.units.view.vl.UnitsStoreViewLogic;

    public class UnitStoreMediator extends UIMediator {

        public static const NAME:String = "UnitStoreMediator";

        public function UnitStoreMediator(viewComponent:UnitsStoreViewLogic) {

            super(NAME, viewComponent);
        }
    }
}
