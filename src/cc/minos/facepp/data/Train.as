package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	
	/**
	 * 训练模型
	 * @author Minos
	 */
	public class Train extends FacePPData
	{
		
		public function Train()
		{
		}
		
		/**
		 * 针对verify功能对一个person进行训练。请注意:
		 * 在一个person内进行verify之前，必须先对该person进行Train
		 * 当一个person内的数据被修改后(例如增删Person相关的Face等)，为使这些修改生效，person应当被重新Train
		 * Train所花费的时间较长, 因此该调用是异步的，仅返回session_id。
		 * 训练的结果可以通过/info/get_session查询。当训练完成时，返回值中将包含{"success": true}
		 * @param	person		:	person_id 或 person_name 验证对象person
		 */
		public function verify( person:String ):FacePPData
		{
			_apiMethod = APIMethod.TRAIN_VERIFY;
			data = {};
			if ( isID( person ) )
				data[ 'person_id' ] = person;
			else
				data[ 'person_name' ] = person;
			return this;
		}
		
		/**
		 * 针对search功能对一个faceset进行训练。请注意:
		 * 在一个faceset内进行search之前，必须先对该faceset进行Train
		 * 当一个faceset内的数据被修改后(例如增删Face等)，为使这些修改生效，faceset应当被重新Train
		 * Train所花费的时间较长, 因此该调用是异步的，仅返回session_id。
		 * 训练的结果可以通过/info/get_session查询。当训练完成时，返回值中将包含{"success": true}
		 * @param	faceset		:	faceset_id 或 faceset_name 用于搜索的face组成的faceset
		 */
		public function search( faceset:String ):FacePPData
		{
			_apiMethod = APIMethod.TRAIN_SEARCH;
			data = {};
			if ( isID( faceset ) )
				data[ 'faceset_id' ] = faceset;
			else
				data[ 'faceset_name' ] = faceset;
			return this;
		}
		
		/**
		 * 针对identify功能对一个Group进行训练。请注意:
		 * 在一个Group内进行identify之前，必须先对该Group进行Train
		 * 当一个Group内的数据被修改后(例如增删Person, 增删Person相关的Face等)，为使这些修改生效，Group应当被重新Train
		 * Train所花费的时间较长, 因此该调用是异步的，仅返回session_id。
		 * Train时需要保证group内的所有person均非空。
		 * 训练的结果可以通过/info/get_session查询。当训练完成时，返回值中将包含{"success": true}
		 * @param	group		:	group_id 或 group_name	识别候选人组成的Group
		 */
		public function identify( group:String ):FacePPData
		{
			_apiMethod = APIMethod.TRAIN_IDENTIFY;
			data = {};
			if ( isID( group ) )
				data[ 'group_id' ] = group;
			else
				data[ 'group_name' ] = group;
			return this;
		}
	
	}

}