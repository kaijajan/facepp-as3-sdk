package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	
	/**
	 * FaceSet管理
	 * @author Minos
	 */
	public class FaceSet extends FacePPData
	{
		
		public function FaceSet()
		{
		}
		
		/**
		 * 创建一个Faceset
		 * 一个Faceset最多允许包含10000个Face, 开发版最多允许创建5个Faceset。
		 * @param	faceset_name		:	Faceset的Name信息，必须在App中全局唯一。Name不能包含^@,&=*'"等非法字符，且长度不得超过255。Name也可以不指定，此时系统将产生一个随机的name。
		 * @param	face_id				:	一组用逗号分隔的face_id, 表示将这些Face加入到该Faceset中
		 * @param	tag					:	Faceset相关的tag，不需要全局唯一，不能包含^@,&=*'"等非法字符，长度不能超过255。
		 * @return
		 */
		public function create( faceset_name:String = null, face_id:String = null, tag:String = null ):FacePPData
		{
			_apiMethod = APIMethod.FACESET_CREATE;
			data = {};
			if ( faceset_name != null )
				data[ 'faceset_name' ] = faceset_name;
			if ( face_id != null )
				data[ 'face_id' ] = face_id;
			if ( tag != null )
				data[ 'tag' ] = tag;
			return this;
		}
		
		/**
		 * 删除一组Faceset
		 * @param	faceset				:	faceset_name 或 faceset_id	用逗号隔开的待删除的faceset id列表或者name列表
		 * @return
		 */
		public function remove( faceset:String ):FacePPData
		{
			_apiMethod = APIMethod.FACESET_DELETE;
			data = {};
			addIDorName( 'faceset', faceset );
			return this;
		}
		
		/**
		 * 将一组Face加入到一个Faceset中。一个Faceset最多允许包含10000个Face。
		 * @param	faceset				:	faceset_name 或 faceset_id	相应Faceset的name或者id
		 * @param	face_id				:	一组用逗号分隔的face_id,表示将这些Face加入到相应Faceset中。
		 * @return
		 */
		public function add_face( faceset:String, face_id:String ):FacePPData
		{
			_apiMethod = APIMethod.FACESET_ADD_FACE;
			data = {};
			addIDorName( 'faceset', faceset );
			data[ 'face_id' ] = face_id;
			return this;
		}
		
		/**
		 * 删除Faceset中的一个或多个Face
		 * @param	faceset				:	faceset_name 或 faceset_id	相应faceset的name或者id
		 * @param	face_id				:	一组用逗号分隔的face_id列表，表示将这些face从该faceset中删除。开发者也可以指定face_id=all, 表示删除该faceset所有相关Face。
		 * @return
		 */
		public function remove_face( faceset:String, face_id:String ):FacePPData
		{
			_apiMethod = APIMethod.FACESET_REMOVE_FACE;
			data = {};
			addIDorName( 'faceset', faceset );
			data[ 'face_id' ] = face_id;
			return this;
		}
		
		/**
		 * 设置faceset的name和tag
		 * @param	faceset				:	faceset_id 或 faceset_name	相应faceset的id或name
		 * @param	name				:	新的name
		 * @param	tag					:	新的tag
		 * @return
		 */
		public function set_info( faceset:String, name:String = null, tag:String = null ):FacePPData
		{
			_apiMethod = APIMethod.FACESET_SET_INFO;
			data = {};
			addIDorName( 'faceset', faceset );
			if ( name != null )
				data[ 'name' ] = name;
			if ( tag != null )
				data[ 'tag' ] = tag;
			return this;
		}
		
		/**
		 * 获取一个faceset的信息, 包括name, id, tag, 以及相关的face等信息
		 * @param	faceset				:	faceset_id 或 faceset_name	相应faceset的id或name
		 * @return
		 */
		public function get_info( faceset:String ):FacePPData
		{
			_apiMethod = APIMethod.FACESET_GET_INFO;
			data = {};
			addIDorName( 'faceset', faceset );
			return this;
		}
	
	}

}