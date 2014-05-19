package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	
	/**
	 * 信息查询
	 * @author Minos
	 */
	public class Info extends FacePPData
	{
		
		public function Info()
		{
		}
		
		/**
		 * 获取一张image的信息, 包括其中包含的face等信息
		 * @param	img_id			:	目标图片的img_id
		 * @return
		 */
		public function get_image( img_id:String ):FacePPData
		{
			_apiMethod = APIMethod.INFO_GET_IMAGE;
			data = {};
			data[ 'img_id' ] = img_id;
			return this;
		}
		
		/**
		 * 给定一组Face，返回相应的信息(包括源图片, 相关的person等等)。
		 * @param	face_id			:	一组用逗号分割的face_id
		 * @return
		 */
		public function get_face( face_id:String ):FacePPData
		{
			_apiMethod = APIMethod.INFO_GET_FACE;
			data = {};
			data[ 'face_id' ] = face_id;
			return this;
		}
		
		/**
		 * 返回该App中的所有Person
		 * @return
		 */
		public function get_person_list():FacePPData
		{
			_apiMethod = APIMethod.INFO_GET_PERSON_LIST;
			data = {};
			return this;
		}
		
		/**
		 * 返回该App中的所有Faceset。
		 * @return
		 */
		public function get_faceset_list():FacePPData
		{
			_apiMethod = APIMethod.INFO_GET_FACESET_LIST;
			data = {};
			return this;
		}
		
		/**
		 * 返回这个App中的所有Group
		 * @return
		 */
		public function get_group_list():FacePPData
		{
			_apiMethod = APIMethod.INFO_GET_GROUP_LIST;
			data = {};
			return this;
		}
		
		/**
		 * 获取session相关状态和结果
		 * 可能的status：INQUEUE(队列中), SUCC(成功) 和FAILED(失败)。当status是SUCC时，返回结果中还包含session对应的结果
		 * 所有session都将在计算完成72小时之后过期，并被自动清除。status返回值为SUCC仅表示成功取得运行结果，实际任务成功与否请根据result内容判断
		 * @param	session_id			:	由/detection或/recognition中的API调用产生的session_id
		 * @return
		 */
		public function get_session( session_id:String ):FacePPData
		{
			_apiMethod = APIMethod.INFO_GET_SESSION;
			data = {};
			data[ 'session_id' ] = session_id;
			return this;
		}
		
		/**
		 * 获取该App相关的信息
		 * @return
		 */
		public function get_app():FacePPData
		{
			_apiMethod = APIMethod.INFO_GET_APP;
			data = {};
			return this;
		}
	
	}

}