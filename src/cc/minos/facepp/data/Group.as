package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	
	/**
	 * Group管理
	 * @author Minos
	 */
	public class Group extends FacePPData
	{
		
		public function Group()
		{
		}
		
		/**
		 * 创建一个Group
		 * 一个Group最多允许包含10000个Person。开发版最多允许创建5个group。
		 * @param	group_name		:	Group的Name信息，必须在App中全局唯一。Name不能包含^@,&=*'"等非法字符，且长度不得超过255。Name也可以不指定，此时系统将产生一个随机的name。
		 * @param	tag 			:	Group的tag，不需要全局唯一，不能包含^@,&=*'"等非法字符，长度不能超过255。
		 * @param	person			:	person_id 或 person_name	一组用逗号分隔的person_id或person_name, 表示将这些Person加入到该Group中。注意，一个Person可以被加入到多个Group中。
		 * @return
		 */
		public function create( group_name:String, tag:String = null, person:String = null ):FacePPData
		{
			_apiMethod = APIMethod.GROUP_CREATE;
			data = {};
			data[ 'group_name' ] = group_name;
			if ( tag != null )
				data[ 'tag' ] = tag;
			addIDorName( 'person', person );
			return this;
		}
		
		/**
		 * 删除一组Group
		 * @param	group			:	group_name 或 group_id	一组用逗号分割的group_id或group_name，表示删除这些Group
		 * @return
		 */
		public function remove( group:String ):FacePPData
		{
			_apiMethod = APIMethod.GROUP_DELETE;
			data = {};
			addIDorName( 'group', group );
			return this;
		}
		
		/**
		 * 将一组Person加入到一个Group中。一个Group最多允许包含10000个Person。
		 * @param	group			:	group_id 或 group_name	相应Group的id或name
		 * @param	person			:	person_id 或 person_name	一组用逗号分隔的person_id或person_name，表示将这些Person加入到相应Group中。
		 * @return
		 */
		public function add_person( group:String, person:String ):FacePPData
		{
			_apiMethod = APIMethod.GROUP_ADD_PERSON;
			data = {};
			addIDorName( 'group', group );
			addIDorName( 'person', person );
			return this;
		}
		
		/**
		 * 从Group中删除一组Person
		 * @param	group			:	group_id 或 group_name	相应Group的id或name
		 * @param	person			:	person_id 或 person_name	一组用逗号分割的person_id列表或者person_name列表，表示将这些person从该Group中删除。开发者也可以指定person_id=all, 表示删掉该Group中所有Person。
		 * @return
		 */
		public function remove_person( group:String, person:String ):FacePPData
		{
			_apiMethod = APIMethod.GROUP_REMOVE_PERSON;
			data = {};
			addIDorName( 'group', group );
			if ( person == 'all' )
				data[ 'person_id' ] = person;
			else
				addIDorName( 'person', person );
			return this;
		}
		
		/**
		 * 设置Group的name和tag
		 * @param	group			:	group_id 或 group_name	相应Group的id或name
		 * @param	name			:	新的group_name
		 * @param	tag 			:	新的tag
		 * @return
		 */
		public function set_info( group:String, name:String = null, tag:String = null ):FacePPData
		{
			_apiMethod = APIMethod.GROUP_SET_INFO;
			data = {};
			addIDorName( 'group', group );
			if ( name != null )
				data[ 'name' ] = name;
			if ( tag != null )
				data[ 'tag' ] = tag;
			return this;
		}
		
		/**
		 * 获取Group的信息，包括Group中的Person列表，Group的tag等信息
		 * @param	group			:	group_id 或 group_name	待查询Group的id或name。开发者也可以指定group_id=none，此时将返回所有未加入任何Group的Person。
		 * @return
		 */
		public function get_info( group:String ):FacePPData
		{
			_apiMethod = APIMethod.GROUP_GET_INFO;
			data = {};
			addIDorName( 'group', group );
			return this;
		}
	
	}

}