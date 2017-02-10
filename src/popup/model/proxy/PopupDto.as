package popup.model.proxy {
    import popup.view.component.PopupViewLogic;
    import popup.view.mediator.PopupMediator;

    public class PopupDto {

        public var id:String;
        public var popupMediator:Class = PopupMediator;
        public var popupViewLogic:Class = PopupViewLogic;
    }
}
