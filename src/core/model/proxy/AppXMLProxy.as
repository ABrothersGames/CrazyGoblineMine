package core.model.proxy {
    import core.model.dto.AppXMLDto;

    import org.puremvc.as3.patterns.proxy.Proxy;

    public class AppXMLProxy extends Proxy {

        public static const NAME:String = "AppXMLProxy";

        public function AppXMLProxy(xml:XML) {

            super(NAME, new AppXMLDto(xml));
        }

        public function get mainUrlXmlDto():AppXMLDto{
            return getData() as AppXMLDto;
        }
    }
}
