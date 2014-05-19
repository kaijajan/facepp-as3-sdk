package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	
	/**
	 * 人脸聚类与分组
	 * @author Minos
	 */
	public class Grouping extends FacePPData
	{
		
		public function Grouping()
		{
		}
		
		/**
		 * 给出一个Faceset，尝试将其分类，使得来自同一个人的Face被放在同一类中。
		 * Grouping所花费的时间较长, 因此该调用是异步的，仅返回session_id。
		 * @param	faceset		:	faceset_id 或 faceset_name	相应Faceset的id或name。
		 * @return
		 */
		public function grouping( faceset:String ):FacePPData
		{
			_apiMethod = APIMethod.GROUPING_GROUPING;
			data = {};
			addIDorName( 'faceset', faceset );
			return this;
		}
	
	}

}