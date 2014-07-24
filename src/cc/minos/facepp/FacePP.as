package cc.minos.facepp
{
	import cc.minos.facepp.data.FacePPData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;

	/**
	 * FacePP SDK
	 * @author Minos
	 */
	public class FacePP
	{
		//去斜杠
		private var trim:RegExp         = /^\/+|\/+$/g;

		//请求服务器地址cn[aliyun]或者us[amazon]
		private var apiURL:String       = "api url";

		private var apiKey:String       = "your api key";
		private var apiSecret:String    = "your api secret";

		//并发
		private var requestCapacity:int = 2;
		//异步请求延迟时间
		private var sessionInterval:int = 500;
		//超时时间
		private var requestTimeout:int  = 10000;
		//请求队列
		private var queue:Array         = [];
		//参数
		private var options:Object 		= { //
			apiURL: 'https://apicn.faceplusplus.com/v2', //
			sessionInterval: 500, //
			requestTimeout: 10000, //
			concurrency: 2 //
			}

		/**
		 *
		 * @param	apiKey
		 * @param	apiSecret
		 * @param	options
		 */
		public function FacePP( apiKey:String, apiSecret:String, options:Object = null )
		{
			this.apiKey = apiKey;
			this.apiSecret = apiSecret;
			if ( options != null )
			{
				for ( var o:Object in options )
				{
					if ( options[ o ] != null )
						this.options[ o ] = options[ o ];
				}
			}

			this.requestCapacity = this.options[ 'concurrency' ];
			this.apiURL = String( this.options[ 'apiURL' ] ).replace( trim, '' );
			this.requestTimeout = this.options[ 'requestTimeout' ];
			this.sessionInterval = this.options[ 'sessionInterval' ];
		}

		/**
		 * 发送请求
		 * @param	apiMethod		:	方法
		 * @param	data			:	数据
		 * @param	callback		:	返回
		 */
		public function request( apiMethod:String, data:Object = null, callback:Function = null ):void
		{
			if ( data == null )
				data = {};
			data[ 'api_key' ] = this.apiKey;
			data[ 'api_secret' ] = this.apiSecret;
			queue.push([ this.apiURL + apiMethod, data, callback ] );
			scheduleRequest();
		}

		/**
		 * 发送异步请求
		 * @param	apiMethod		:	方法
		 * @param	data			:	数据
		 * @param	callback		:	返回
		 */
		public function requestAsync( apiMethod:String, data:Object = null, callback:Function = null ):void
		{
			if ( data == null )
				data = {};
			data[ 'async' ] = 'true';
			this.request( apiMethod, data, function( err:Object, res:Object ):void
				{
					if ( err )
					{
						callback( err, res );
					}
					else
					{
						setTimeout( sessionCheck, sessionInterval, res.session_id, callback );
					}
				} );
		}

		/**
		 * 使用FacePPData发送请求
		 * @param	data
		 * @param	callback
		 */
		public function requestByData( data:FacePPData, callback:Function = null ):void
		{
			var method:String = data.apiMethod;
			var obj:Object = data.toObject();
			if ( obj[ 'async' ] == 'true' )
				this.requestAsync( method, obj, callback );
			else
				this.request( method, obj, callback );
		}

		/**
		 *
		 * @param	session_id		:	请求id
		 * @param	callback		:	返回
		 */
		private function sessionCheck( session_id:String, callback:Function ):void
		{
			this.request( APIMethod.INFO_GET_SESSION, { session_id: session_id }, function( err:Object, res:Object ):void
				{
					if ( err )
					{
						callback( err, res );
					}
					else if ( res.status === 'FAILED' )
					{
						callback( res.result.error_code, res.result );
					}
					else if ( res.status === 'INQUEUE' )
					{
						setTimeout( sessionCheck, sessionInterval, res.session_id, callback );
					}
					else
					{
						callback( null, res.result );
					}
				} );
		}

		/**
		 *
		 */
		private function scheduleRequest():void
		{
			if ( requestCapacity > 0 && queue.length > 0 )
			{
				--requestCapacity;
				var ref:Array = queue.shift();
				var req:Request = new Request( ref[ 0 ], requestTimeout, ref[ 2 ] );
				req.send( ref[ 1 ] );
				req.addEventListener( Event.COMPLETE, function( e:Event ):void
					{
						++requestCapacity;
						setTimeout( scheduleRequest, 0 );
					} );
			}
		}

	}

}