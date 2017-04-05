package com.nidlab.kinect.debug
{
	import com.nidlab.kinect.BodyEvent;
	import com.nidlab.kinect.Kinect;
	import com.nidlab.kinect.KinectCameraMode;
	import com.nidlab.kinect.KinectCameraViewer;
	import com.nidlab.kinect.JointNames;
	import com.nidlab.kinect.KinectV2Description;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.media.Camera;
	import flash.media.Video;
	import com.nidlab.kinect.BodyDataReader;
	import com.nidlab.kinect.SkeletonDisplayer;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class KinectDebugger extends Sprite
	{
		private var colorVideo:Video;
		private var colorVideoHolder:Sprite;
		private var skeletonHolder:Sprite;
		private var _skeletonDisplayerList:Vector.<SkeletonDisplayer>;
		protected var _bodyDataReader:BodyDataReader;
		
		public function KinectDebugger(kinect:Kinect)
		{
			super();
			
			var kinectCameraViewer:KinectCameraViewer = new KinectCameraViewer();
			addChild(kinectCameraViewer);
			
			_skeletonDisplayerList = new Vector.<SkeletonDisplayer>();
			skeletonHolder = new Sprite();
			addChild(skeletonHolder);
			
			bodyDataReader = kinect.bodyDataReader;
		
		}
		
		public function get skeletonDisplayerList():Vector.<SkeletonDisplayer>
		{
			return _skeletonDisplayerList;
		}
		
		public function set skeletonDisplayerList(value:Vector.<SkeletonDisplayer>):void
		{
			_skeletonDisplayerList = value;
		}
		
		public function get bodyDataReader():BodyDataReader
		{
			return _bodyDataReader;
		}
		
		public function set bodyDataReader(value:BodyDataReader):void
		{
			_bodyDataReader = value;
			_bodyDataReader.addEventListener(BodyDataReader.ON_BODY_ADDED, onBodyAdded);
			_bodyDataReader.addEventListener(BodyDataReader.ON_BODY_UPDATED, onBodyUpdated);
			_bodyDataReader.addEventListener(BodyDataReader.ON_BODY_REMOVED, onBodyRemoved);
		}
		
		private function onBodyRemoved(e:BodyEvent):void
		{
			var trackingID:Number = e.trackingID;
			var currentSkeletonDisplayer:SkeletonDisplayer = null;
			for (var i:int = 0; i < _skeletonDisplayerList.length; i++)
			{
				if ((_skeletonDisplayerList[i] != null) && (trackingID == _skeletonDisplayerList[i].trackingID))
				{
					currentSkeletonDisplayer = _skeletonDisplayerList[i];
					skeletonHolder.removeChild(currentSkeletonDisplayer);
					_skeletonDisplayerList[i] = null;
				}
			}
		}
		
		private function onBodyUpdated(e:BodyEvent):void
		{
			var trackingID:Number = e.trackingID;
			for (var j:int = 0; j < _skeletonDisplayerList.length; j++)
			{
				if ((_skeletonDisplayerList[j] != null) && (trackingID == _skeletonDisplayerList[j].trackingID))
				{
					pushFromTrackingIDToSkeletonDisplayer(trackingID, _skeletonDisplayerList[j]);
					
					break;
				}
			}
		}
		
		private function onBodyAdded(e:BodyEvent):void
		{
			var skeletonDisplayerTemp:SkeletonDisplayer = new SkeletonDisplayer();
			skeletonDisplayerTemp.trackingID = e.trackingID;
			pushFromTrackingIDToSkeletonDisplayer(e.trackingID, skeletonDisplayerTemp);
			
			_skeletonDisplayerList.push(skeletonDisplayerTemp);
			skeletonHolder.addChild(skeletonDisplayerTemp);
		}
		
		private function pushFromTrackingIDToSkeletonDisplayer(trackingID:Number, skeletonDisplayer:SkeletonDisplayer):void {
			skeletonDisplayer.leftHand.state = _bodyDataReader.getLeftHandState(trackingID);
			skeletonDisplayer.rightHand.state = _bodyDataReader.getRightHandState(trackingID);
			
			skeletonDisplayer.leftHand.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.HAND_LEFT);
			skeletonDisplayer.rightHand.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.HAND_RIGHT);
			skeletonDisplayer.head.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.HEAD);
			skeletonDisplayer.neck.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.NECK);
			skeletonDisplayer.spineShoulder.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.SPINE_SHOULDER);
			skeletonDisplayer.shoulderLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.SHOULDER_LEFT);
			skeletonDisplayer.shoulderRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.SHOULDER_RIGHT);
			skeletonDisplayer.elbowLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.ELBOW_LEFT);
			skeletonDisplayer.elbowRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.ELBOW_RIGHT);
			skeletonDisplayer.wristLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.WRIST_LEFT);
			skeletonDisplayer.wristRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.WRIST_RIGHT);
			skeletonDisplayer.thumbLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.THUMB_LEFT);
			skeletonDisplayer.thumbRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.THUMB_RIGHT);
			skeletonDisplayer.handTipLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.HAND_TIP_LEFT);
			skeletonDisplayer.handTipRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.HAND_TIP_RIGHT);
			skeletonDisplayer.spineMid.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.SPINE_MID);
			skeletonDisplayer.spineBase.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.SPINE_BASE);
			skeletonDisplayer.hipLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.HIP_LEFT);
			skeletonDisplayer.hipRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.HIP_RIGHT);
			skeletonDisplayer.kneeLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.KNEE_LEFT);
			skeletonDisplayer.kneeRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.KNEE_RIGHT);
			skeletonDisplayer.ankleLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.ANKLE_LEFT);
			skeletonDisplayer.ankleRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.ANKLE_RIGHT);
			skeletonDisplayer.footLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.FOOT_LEFT);
			skeletonDisplayer.footRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointNames.FOOT_RIGHT);
		}
	}

}