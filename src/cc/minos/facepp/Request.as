package cc.minos.facepp
{
	import cc.minos.facepp.UploadPostHelper;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Minos
	 */
	public class Request extends EventDispatcher
	{
		private var loader:URLLoader;
		private var request:URLRequest;
		
		private var callback:Function = null;
		private var requestTimerout:int = 10000;
		private var requestTimer:Timer;
		
		private var _loading:Boolean = false;
		private var apiMethod:String;
		private var requestCallback:Function;
		
		public function Request( apiMethod:String, requestTimerout:int = 10000, requestCallback:Function = null )
		{
			this.apiMethod = apiMethod;
			this.requestTimerout = requestTimerout;
			this.requestCallback = requestCallback;
		}
		
		public function send( data:Object ):void
		{
			if ( _loading )
				return;
			_loading = true;
			
			loader = new URLLoader();
			loader.addEventListener( Event.COMPLETE, onComplete );
			loader.addEventListener( IOErrorEvent.IO_ERROR, onIoError );
			
			if ( data.img != undefined && data.img != null )
			{
				request = parse_img( data );
			}
			else
			{
				request = parse_get( data );
			}
			
			request.url = apiMethod;
			loader.load( request );
			
			requestTimer = new Timer( requestTimerout );
			requestTimer.addEventListener( TimerEvent.TIMER, onRequestTimer );
			requestTimer.start();
		}
		
		private function onComplete( e:Event ):void
		{
			trace( "request complete" );
			sendCallback( null, e.currentTarget.data );
		}
		
		private function onIoError( e:IOErrorEvent ):void
		{
			trace( "request io error: " + e.text );
			sendCallback({} );
		}
		
		private function sendCallback( err:Object, res:Object = null ):void
		{
			if ( requestTimer )
			{
				requestTimer.stop();
				requestTimer.removeEventListener( TimerEvent.TIMER, onRequestTimer );
				requestTimer = null;
			}
			//
			if ( requestCallback != null )
			{
				requestCallback( err, res );
			}
			
			loader.removeEventListener( Event.COMPLETE, onComplete );
			loader.removeEventListener( IOErrorEvent.IO_ERROR, onIoError );
			loader.close();
			loader = null;
			//
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		private function onRequestTimer( e:TimerEvent ):void
		{
			trace( "request timeout" );
			sendCallback({} );
		}
		
		private function parse_get( params:Object ):URLRequest
		{
			var urlvars:URLVariables = new URLVariables();
			for ( var p:String in params )
			{
				if ( params[ p ] != undefined && params[ p ] != "" )
				{
					urlvars[ p ] = params[ p ];
				}
			}
			var req:URLRequest = new URLRequest();
			req.method = URLRequestMethod.GET;
			req.data = urlvars
			return req;
		}
		
		private function parse_img( params:Object ):URLRequest
		{
			var data:ByteArray = params.img;
			delete params[ 'data' ];
			var req:URLRequest = new URLRequest();
			req.contentType = 'multipart/form-data; boundary=' + UploadPostHelper.getBoundary();
			req.data = UploadPostHelper.getPostData( 'img', data, params, 'img' );
			req.method = URLRequestMethod.POST;
			req.requestHeaders.push( new URLRequestHeader( 'Cache-Control', 'no-cache' ) );
			return req;
		}
	
	}

}