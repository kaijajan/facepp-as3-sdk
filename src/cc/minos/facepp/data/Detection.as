package cc.minos.facepp.data
{
	import cc.minos.facepp.APIMethod;
	import cc.minos.facepp.images.JPGEncoder;
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	/**
	 * 人脸检测与分析
	 * @author Minos
	 */
	public class Detection extends FacePPData
	{
		
		public function Detection()
		{
		}
		
		/**
		 * 检测给定图片(Image)中的所有人脸(Face)的位置和相应的面部属性
		 * 目前面部属性包括性别(gender), 年龄(age), 种族(race), 微笑程度(smiling), 眼镜(glass)和姿势(pose)
		 * 若结果的face_id没有被加入任何faceset/person之中，则在72小时之后过期被自动清除。
		 * @param	img 		:	待检测图片的URL 或者 通过POST方法上传的二进制数据 或者 BitmapData对象，原始图片大小需要小于3M
		 * @param	mode		:	检测模式可以是normal(默认) 或者 oneface 。在oneface模式中，检测器仅找出图片中最大的一张脸。
		 * @param	attribute	:	可以是none或者由逗号分割的属性列表。默认为gender, age, race, smiling。目前支持的属性包括：gender, age, race, smiling, glass, pose
		 * @param	tag 		:	可以为图片中检测出的每一张Face指定一个不包含^@,&=*'"等非法字符且不超过255字节的字符串作为tag，tag信息可以通过 /info/get_face 查询
		 * @param	async		:	如果置为true，该API将会以异步方式被调用；也就是立即返回一个session id，稍后可通过/info/get_session查询结果。默认值为false。
		 * @return
		 */
		public function detect( img:Object, mode:String = "normal", attribute:String = "none", tag:String = "", async:Boolean = false ):FacePPData
		{
			_apiMethod = APIMethod.DETECTION_DETECT;
			data = {};
			if ( img is String )
			{
				data[ 'url' ] = String( img );
			}
			else if ( img is BitmapData )
			{
				var jpg:JPGEncoder = new JPGEncoder( 80 );
				var byte:ByteArray = jpg.encode( img as BitmapData );
				data[ 'img' ] = byte;
			}
			else if ( img is ByteArray )
			{
				data[ 'img' ] = img;
			}
			else
			{
				throw new ArgumentError( 'img必须是图片地址, 二进制, BitmapData对象' );
			}
			data[ 'mode' ] = mode;
			data[ 'attribute' ] = attribute;
			data[ 'tag' ] = tag;
			data[ 'async' ] = async;
			return this;
		}
		
		/**
		 * 检测给定人脸(Face)相应的面部轮廓，五官等关键点的位置，包括25点和83点两种模式。
		 * @param	face_id		:	待检测人脸的face_id
		 * @param	type		:	表示返回的关键点个数，目前支持83p或25p，默认为83p
		 * @return
		 */
		public function landmark( face_id:String, type:String = "83p" ):FacePPData
		{
			_apiMethod = APIMethod.DETECTION_LANDMARK;
			data = {};
			data[ 'face_id' ] = face_id;
			data[ 'type' ] = type;
			return this;
		}
	
	}

}