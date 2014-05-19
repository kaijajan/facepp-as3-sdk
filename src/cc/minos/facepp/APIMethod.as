package cc.minos.facepp
{
	
	/**
	 * API功能
	 * @author Minos
	 */
	public class APIMethod
	{
		/*** detect 人脸检测与分析 ***/
		
		/**
		 * 检测一张照片中的人脸信息（脸部位置、年龄、种族、性别等等）
		 */
		public static const DETECTION_DETECT:String = "/detection/detect";
		/**
		 * 检测给定人脸相应的面部轮廓，五官等关键点的位置
		 */
		public static const DETECTION_LANDMARK:String = "/detection/landmark";
		
		/*** train 训练模型 ***/
		
		/**
		 * 调用/recognition/verify之前需要运行的训练
		 */
		public static const TRAIN_VERIFY:String = "/train/verify";
		/**
		 * 调用/recognition/search之前需要运行的训练
		 */
		public static const TRAIN_SEARCH:String = "/train/search";
		/**
		 * 调用/recognition/identify之前需要运行的训练
		 */
		public static const TRAIN_IDENTIFY:String = "/train/identify";
		
		/*** recognition 人脸识别 ***/
		
		/**
		 * 对比两张人脸的相似程度
		 */
		public static const RECOGNITION_COMPARE:String = "/recognition/compare";
		/**
		 * 	给定人脸和人，判断这张人脸是否是给定的人
		 */
		public static const RECOGNITION_VERIFY:String = "/recognition/verify";
		/**
		 * 给定人脸和人脸集合，在集合中找最相似的人脸
		 */
		public static const RECOGNITION_SEARCH:String = "/recognition/search";
		/**
		 * 给定人脸和人群，找到人群中最像这张脸的人
		 */
		public static const RECOGNITION_IDENTIFY:String = "/recognition/identify";
		
		/*** grouping 人脸聚类与分组 ***/
		
		/**
		 * 给定人脸集合，将集合中的人脸分成几类，每一类为同一个人
		 */
		public static const GROUPING_GROUPING:String = "/grouping/grouping";
		
		/*** person Person管理 ***/
		
		/**
		 * 创建一个人
		 */
		public static const PERSON_CREATE:String = "/person/create";
		/**
		 * 删除一个人
		 */
		public static const PERSON_DELETE:String = "/person/delete";
		/**
		 * 向一个人添加一张人脸
		 */
		public static const PERSON_ADD_FACE:String = "/person/add_face";
		/**
		 * 从一个人中删除一张人脸
		 */
		public static const PERSON_REMOVE_FACE:String = "/person/remove_face";
		/**
		 * 为一个人设定备注等信息
		 */
		public static const PERSON_SET_INFO:String = "/person/set_info";
		/**
		 * 获得一个人的备注等信息
		 */
		public static const PERSON_GET_INFO:String = "/person/get_info";
		
		/*** faceset FaceSet管理 ***/
		
		/**
		 * 创建一个人脸集合
		 */
		public static const FACESET_CREATE:String = "/faceset/create";
		/**
		 * 删除一个人脸集合
		 */
		public static const FACESET_DELETE:String = "/faceset/delete";
		/**
		 * 向一个人脸集合添加人脸
		 */
		public static const FACESET_ADD_FACE:String = "/faceset/add_face";
		/**
		 * 从一个人脸集合中删除人脸
		 */
		public static const FACESET_REMOVE_FACE:String = "/faceset/remove_face";
		/**
		 * 为一个人集合设定备注等信息
		 */
		public static const FACESET_SET_INFO:String = "/faceset/set_info";
		/**
		 * 获得一个人集合的备注等信息
		 */
		public static const FACESET_GET_INFO:String = "/faceset/get_info";
		
		/*** group Group管理 ***/
		
		/**
		 * 创建一个人群
		 */
		public static const GROUP_CREATE:String = "/group/create";
		/**
		 * 删除一个人群
		 */
		public static const GROUP_DELETE:String = "/group/delete";
		/**
		 * 向人群中添加一个人
		 */
		public static const GROUP_ADD_PERSON:String = "/group/add_person";
		/**
		 * 从人群中删除一个人
		 */
		public static const GROUP_REMOVE_PERSON:String = "/group/remove_person";
		/**
		 * 获得人群的备注等信息
		 */
		public static const GROUP_GET_INFO:String = "/group/get_info";
		/**
		 * 
		 */
		public static const GROUP_SET_INFO:String = "/group/set_info";
		
		/*** info 信息查询 ***/
		
		/**
		 * 获取一张图片的信息，包括其中的人脸信息
		 */
		public static const INFO_GET_IMAGE:String = "/info/get_image";
		/**
		 * 获取一组人脸的信息
		 */
		public static const INFO_GET_FACE:String = "/info/get_face";
		/**
		 * 获取该应用中所有的人
		 */
		public static const INFO_GET_PERSON_LIST:String = "/info/get_person_list";
		/**
		 * 获取该应用中所有的人脸集合
		 */
		public static const INFO_GET_FACESET_LIST:String = "/info/get_faceset_list";
		/**
		 * 获取该应用中所有的人群
		 */
		public static const INFO_GET_GROUP_LIST:String = "/info/get_group_list";
		/**
		 * 获取session的状态与结果
		 */
		public static const INFO_GET_SESSION:String = "/info/get_session";
		/**
		 * 获取应用的相关信息
		 */
		public static const INFO_GET_APP:String = "/info/get_app";
	
	}

}