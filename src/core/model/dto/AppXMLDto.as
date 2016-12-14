package core.model.dto
{
	public class AppXMLDto
	{
		
		private var _xml:XML; 
		public function AppXMLDto(xml:XML)
		{
			_xml = xml;
		}
		
		public function get xmlList():XMLList{
			return _xml.PATH.children() as XMLList;
		}
	}
}