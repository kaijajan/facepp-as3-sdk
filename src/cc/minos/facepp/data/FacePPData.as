package cc.minos.facepp.data
{
	
	/**
	 * ...
	 * @author Minos
	 */
	public class FacePPData extends Object
	{
		private const id_reg:RegExp = /^[0-9a-z]+$/
		
		protected var _apiKey:String;
		protected var _apiSecret:String;
		protected var _apiMethod:String;
		
		protected var data:Object = {}
		
		public function FacePPData()
		{
		}
		
		public function isID( str:String ):void
		{
			return id_reg.test( str );
		}
		
		public function toObject():Object
		{
			//
		}
		
		public function get apiMethod():String
		{
			return _apiMethod;
		}
		
		public function get apiSecret():String
		{
			return _apiSecret;
		}
		
		public function set apiSecret( value:String ):void
		{
			_apiSecret = value;
		}
		
		public function get apiKey():String
		{
			return _apiKey;
		}
		
		public function set apiKey( value:String ):void
		{
			_apiKey = value;
		}
	
	}

}