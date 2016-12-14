package core.model.proxy
{
	import core.model.dto.FlashVarsDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class FlashVarsProxy extends Proxy
	{
		public static const NAME:String = "FlashVarsProxy";
		
		private var _flashVarsDto:FlashVarsDto;
		public function FlashVarsProxy(parameters:Object)
		{
			_flashVarsDto = new FlashVarsDto(parameters);
			
			super(NAME, parameters);
		}
		
		public function get xmlPath():String{
			return (_flashVarsDto.flashvarObject.hasOwnProperty("XMLPath")) ? _flashVarsDto.flashvarObject["XMLPath"] : "LoadConfig.xml";
		}
	}
}