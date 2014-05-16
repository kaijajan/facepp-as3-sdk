package cc.minos.facepp.data
{
	
	/**
	 * ...
	 * @author Minos
	 */
	public class FacePPData extends Object
	{
		private const id_reg:RegExp = /^[0-9a-z]{25,}$/;
		
		protected var _apiMethod:String;
		
		protected var data:Object = {}
		
		public function FacePPData()
		{
		}
		
		protected function isID( str:String ):Boolean
		{
			return id_reg.test( str );
		}
		
		protected function addIDorName( prop:String, value:String ):void
		{
			if ( value == null )
				return;
			if ( isID( value.split( "," )[ 0 ] ) )
				data[ prop + "_id" ] = value;
			else
				data[ prop + "_name" ] = value;
		}
		
		public function toObject():Object
		{
			return data;
		}
		
		public function get apiMethod():String
		{
			return _apiMethod;
		}
	
	}

}