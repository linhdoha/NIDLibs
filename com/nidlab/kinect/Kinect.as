package com.nidlab.kinect 
{
	import flash.desktop.NativeApplication;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class Kinect extends EventDispatcher
	{
		public static const COLOR_CAMERA_ID:String = "KVYcam Video Driver";
		public static const COLOR_CAMERA_WIDTH:int = 1920;
		public static const COLOR_CAMERA_HEIGHT:int = 1080;
		public static const COLOR_CAMERA_FPS:int = 30;
		
		public static const BODY_INDEX_CAMERA_ID:String = "Kinect Camera V2 Body Index";
		public static const BODY_INDEX_CAMERA_WIDTH:int = 512;
		public static const BODY_INDEX_CAMERA_HEIGHT:int = 424;
		public static const BODY_INDEX_CAMERA_FPS:int = 30;
		
		public static const GS_CAMERA_ID:String = "KinectV2 GreenScreen";
		public static const GS_CAMERA_WIDTH:int = 1920;
		public static const GS_CAMERA_HEIGHT:int = 1080;
		public static const GS_CAMERA_FPS:int = 30;
		
		private var kinectConsole:KinectConsole;
		private var kinectSocket:KinectSocket;
		private var _bodyDataReader:BodyDataReader;
		private var _debug:Boolean = false;
		private var _stage:Stage;
		private var _appWaittingToStop:Boolean = false;
		
		public function Kinect(stage:Stage,port:int=7001,debug:Boolean=false) 
		{
			_debug = debug;
			_stage = stage;
			_stage.nativeWindow.addEventListener(Event.CLOSING, onAppClosing);
			
			kinectConsole = new KinectConsole(port, debug);
			kinectConsole.addEventListener(KinectConsole.PROCESS_EXIT, onConsoleExit);
			
			kinectSocket = new KinectSocket(port);
			kinectSocket.addEventListener(Event.CLOSE, onSocketClose);
			
			_bodyDataReader = new BodyDataReader(kinectSocket);
			
		}
		
		public function attachGestureDatabaseFile(url:String):void {
			kinectSocket.gestureDatabaseFiles.push(url);
		}
		
		public function forceStop():void {
			if (kinectConsole.running)
			{
				kinectConsole.exit();
			}
			
			if (kinectSocket.connected)
			{
				kinectSocket.close();
			}
			
			checkToExit();
		}
		
		public function get bodyDataReader():BodyDataReader 
		{
			return _bodyDataReader;
		}
		
		private function onConsoleExit(e:Event):void
		{
			checkToExit();
		}
		
		private function onSocketClose(e:Event):void
		{
			checkToExit();
		}
		
		private function checkToExit():Boolean {
			if (!kinectConsole.running && !kinectSocket.connected)
			{
				if (_debug) trace("Kinect has stopped.");
				if (_appWaittingToStop) {
					NativeApplication.nativeApplication.exit();
				}
				return true;
			} else {
				return false;
			}
		}
		
		private function onAppClosing(e:Event):void
		{
			e.preventDefault();
			_appWaittingToStop = true;
			forceStop();
		}
	}

}