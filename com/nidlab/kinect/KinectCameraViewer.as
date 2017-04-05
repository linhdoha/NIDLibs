package com.nidlab.kinect
{
	import com.nidlab.kinect.KinectV2Description;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.Camera;
	import flash.media.Video;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class KinectCameraViewer extends Sprite
	{
		
		private var _mode:String;
		private var video:Video;
		private var videoHolder:Sprite;
		private var _mirrorMode:Boolean = true;
		
		public function KinectCameraViewer(kinectCameraMode:String = KinectCameraMode.COLOR_MODE)
		{
			super();
			this.mode = kinectCameraMode;
		}
		
		public function get mode():String
		{
			return _mode;
		}
		
		public function set mode(value:String):void
		{
			_mode = value;
			switch (_mode)
			{
			case KinectCameraMode.COLOR_MODE:
				
				graphics.beginFill(0x000000, 0.2);
				graphics.drawRoundRect(0, 0, KinectV2Description.COLOR_CAMERA_WIDTH, KinectV2Description.COLOR_CAMERA_HEIGHT, 20, 20);
				graphics.endFill();
				
				var kinectCamera:Camera = KinectCameraManager.getInstance().getColorCamera();
				kinectCamera.setMode(KinectV2Description.COLOR_CAMERA_WIDTH, KinectV2Description.COLOR_CAMERA_HEIGHT, KinectV2Description.COLOR_CAMERA_FPS);
				video = new Video(kinectCamera.width, kinectCamera.height);
				video.attachCamera(kinectCamera);
				this.mirrorMode = true;
				videoHolder = new Sprite();
				videoHolder.addChild(video);
				addChild(videoHolder);
				break;
			case KinectCameraMode.IR_MODE:
				
				break;
			case KinectCameraMode.DEPTH_MODE:
				
				break;
			
			case KinectCameraMode.BODY_INDEX_MODE:
				
				break;
			}
		}
		
		public function get mirrorMode():Boolean
		{
			return _mirrorMode;
		}
		
		public function set mirrorMode(value:Boolean):void
		{
			_mirrorMode = value;
			
			switch (_mirrorMode)
			{
			case true: 
				video.scaleX = -1;
				video.x = video.width;
				break;
			case false: 
				video.scaleX = 1;
				video.x = 0;
				break;
			}
		}
	
	}

}