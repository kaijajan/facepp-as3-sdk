package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	
	/**
	 * Person管理
	 * @author Minos
	 */
	public class Person extends FacePPData
	{
		
		public function Person()
		{
		}
		
		/**
		 * 创建一个Person
		 * 一个Person最多允许包含10000个Face, 开发版最多允许创建100个person。
		 * @param	person_name			:	Person的Name信息，必须在App中全局唯一。Name不能包含^@,&=*'"等非法字符，且长度不得超过255。Name也可以不指定，此时系统将产生一个随机的name。
		 * @param	face_id				:	一组用逗号分隔的face_id, 表示将这些Face加入到该Person中
		 * @param	tag					:	Person相关的tag，不需要全局唯一，不能包含^@,&=*'"等非法字符，长度不能超过255。
		 * @param	group				:	group_id 或 group_name	一组用逗号分割的group id列表或者group name列表。如果该参数被指定，该Person被create之后就会被加入到这些组中。
		 * @return
		 */
		public function create( person_name:String = null, face_id:String = null, tag:String = null, group:String = null ):FacePPData
		{
			_apiMethod = APIMethod.PERSON_CREATE;
			data = {};
			if ( person_name != null )
				data[ 'person_name' ] = person_name;
			if ( face_id != null )
				data[ 'face_id' ] = face_id;
			if ( tag != null )
				data[ 'tag' ] = tag;
			addIDorName( 'group', group );
			return this;
		}
		
		/**
		 * 删除一组Person
		 * @param	person			:	person_name 或 person_id	用逗号隔开的待删除的Person id列表或者name列表
		 * @return
		 */
		public function remove( person:String ):FacePPData
		{
			_apiMethod = APIMethod.PERSON_DELETE;
			data = {};
			addIDorName( 'person', person );
			return this;
		}
		
		/**
		 * 将一组Face加入到一个Person中。注意，一个Face只能被加入到一个Person中。
		 * 一个Person最多允许包含10000个Face。
		 * @param	person			:	person_name 或 person_id	相应Person的name或者id
		 * @param	face_id			:	一组用逗号分隔的face_id,表示将这些Face加入到相应Person中。
		 * @return
		 */
		public function add_face( person:String, face_id:String ):FacePPData
		{
			_apiMethod = APIMethod.PERSON_ADD_FACE;
			data = {};
			addIDorName( 'person', person );
			data[ 'face_id' ] = face_id;
			return this;
		}
		
		/**
		 * 删除Person中的一个或多个Face
		 * @param	person			:	person_name 或 person_id	相应Person的name或者id
		 * @param	face_id			:	一组用逗号分隔的face_id列表，表示将这些face从该Person中删除。开发者也可以指定face_id=all, 表示删除该Person所有相关Face。
		 * @return
		 */
		public function remove_face( person:String, face_id:String ):FacePPData
		{
			_apiMethod = APIMethod.PERSON_REMOVE_FACE;
			data = {};
			addIDorName( 'person', person );
			data[ 'face_id' ] = face_id;
			return this;
		}
		
		/**
		 * 获取一个Person的信息, 包括name, id, tag, 相关的face, 以及groups等信息
		 * @param	pserson			:	person_id 或 person_name	相应Person的id或name
		 * @return
		 */
		public function get_info( pserson:String ):FacePPData
		{
			_apiMethod = APIMethod.PERSON_GET_INFO;
			data = {};
			addIDorName( 'person', person );
			return this;
		}
		
		/**
		 * 设置Person的name和tag
		 * @param	person			:	person_id 或 person_name 相应Person的id或name
		 * @param	name			:	新的name
		 * @param	tag				:	新的tag
		 * @return
		 */
		public function set_info( person:String, name:String = null, tag:String = null ):FacePPData
		{
			_apiMethod = APIMethod.PERSON_SET_INFO;
			data = {};
			addIDorName( 'person', person );
			if ( name != null )
				data[ 'name' ] = name;
			if ( tag != null )
				data[ 'tag' ] = tag;
			return this;
		}
	
	}

}