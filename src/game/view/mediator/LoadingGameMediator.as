package game.view.mediator {
    import core.view.mediators.UIMediator;

    import game.view.vl.LoadingGameVL;

    public class LoadingGameMediator extends UIMediator {

        public static const NAME:String = "LoadingGameMediator";

        public function LoadingGameMediator(viewComponent:LoadingGameVL = null) {
            super(NAME, viewComponent);
        }
    }
}
