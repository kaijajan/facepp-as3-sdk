package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	import cc.minos.facepp.images.JPGEncoder;
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	/**
	 * 人脸识别
	 * @author Minos
	 */
	public class Recognition extends FacePPData
	{
		
		public function Recognition()
		{
		}
		
		/**
		 * 计算两个Face的相似性以及五官相似度
		 * @param	face_id1
		 * @param	face_id2
		 * @param	async
		 * @return
		 */
		public function compare( face_id1:String, face_id2:String, async:Boolean = false ):FacePPData
		{
			_apiMethod = APIMethod.RECOGNITION_COMPARE;
			data = {};
			data[ 'face_id1' ] = face_id1;
			data[ 'face_id2' ] = face_id2;
			data[ 'async' ] = async;
			return this;
		}
		
		/**
		 * 给定一个Face和一个Person，返回是否是同一个人的判断以及置信度
		 * 注意，当Person中的信息被修改之后（增加，删除了Face等），为了保证结果与最新数据一致，Person应当被重新train。 见/train/verify 。否则调用此API时将使用最后一次train时的数据。
		 * @param	face_id		:	待verify的face_id
		 * @param	person		:	person_id或者person_name 对应的Person
		 * @param	async		:	如果置为true，该API将会以异步方式被调用；也就是立即返回一个session id，稍后可通过/info/get_session查询结果。默认值为false。
		 * @return
		 */
		public function verify( face_id:String, person:String, async:Boolean = false ):FacePPData
		{
			_apiMethod = APIMethod.RECOGNITION_VERIFY;
			data = {};
			data[ 'face_id' ] = face_id;
			addIDorName( 'person', person );
			data[ 'async' ] = async;
			return this;
		}
		
		/**
		 * 给定一个Face和一个Faceset，在该Faceset内搜索最相似的Face。提示：若搜索集合需要包含超过10000张人脸，可以分成多个faceset分别调用search功能再将结果按confidence顺序合并即可。
		 * @param	key_face_id		:	待搜索的Face的face_id
		 * @param	faceset			:	faceset_id 或 faceset_name	指定搜索范围为此Faceset
		 * @param	count			:	表示一共获取不超过count个搜索结果。默认count=3
		 * @param	async			:	如果置为true，该API将会以异步方式被调用；也就是立即返回一个session id，稍后可通过/info/get_session查询结果。默认值为false。
		 * @return
		 */
		public function search( key_face_id:String, faceset:String, count:int = 3, async:Boolean = false ):FacePPData
		{
			_apiMethod = APIMethod.RECOGNITION_SEARCH;
			data = {};
			data[ 'key_face_id' ] = key_face_id;
			addIDorName( 'faceset', faceset );
			data[ 'count' ] = count;
			data[ 'async' ] = async;
			return this;
		}
		
		/**
		 * 对于一个待查询的Face列表（或者对于给定的Image中所有的Face），在一个Group中查询最相似的Person。
		 * 注意，当Group中的信息被修改之后（增加了Person, Face等），为了保证结果与最新数据一致，Group应当被重新train. 见/train/identify 。否则调用此API时将使用最后一次train时的数据。
		 * @param	group			:	group_id 或 group_name	识别候选人组成的Group
		 * @param	img				:	待识别图片的URL 或者 通过POST方法上传的二进制数据
		 * @param	mode			:	检测模式可以是normal(默认) 或者 oneface 。在oneface模式中，检测器仅找出图片中最大的一张脸。仅当给出了url或img时，本选项有效。
		 * @param	key_face_id		:	开发者也可以指定一个face_id的列表来表明对这些face进行识别。可以设置此参数key_face_id为一个逗号隔开的face_id列表。
		 * @param	async			:	如果置为true，该API将会以异步方式被调用；也就是立即返回一个session id，稍后可通过/info/get_session查询结果。默认值为false。
		 * @return
		 */
		public function identify( group:String, img:Object = null, mode:String = "normal", key_face_id:String = null, async:Boolean = false ):FacePPData
		{
			_apiMethod = APIMethod.RECOGNITION_IDENTIFY;
			data = {};
			addIDorName( 'group', group );
			if ( img != null )
			{
				if ( img is String )
					data[ 'url' ] = String( img );
				else if ( img is BitmapData )
				{
					var jpg:JPGEncoder = new JPGEncoder( 80 );
					var byte:ByteArray = jpg.encode( img as BitmapData );
					data[ 'img' ] = byte;
				}
				else if ( img is ByteArray )
					data[ 'img' ] = img;
				else
					throw new ArgumentError( 'img必须是图片地址, 二进制, BitmapData对象' );
			}
			data[ 'mode' ] = mode;
			if ( key_face_id != null )
				data[ 'key_face_id' ] = key_face_id;
			data[ 'async' ] = async;
			return this;
		}
	}

}