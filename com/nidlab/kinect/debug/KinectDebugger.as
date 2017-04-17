package com.nidlab.kinect.debug
{
	import com.nidlab.kinect.JointType;
	import com.nidlab.kinect.events.BodyDataEvent;
	import com.nidlab.kinect.Kinect;
	import com.nidlab.kinect.KinectCameraMode;
	import com.nidlab.kinect.KinectCameraViewer;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	import flash.media.Camera;
	import flash.media.Video;
	import com.nidlab.kinect.BodyDataReader;
	import com.nidlab.kinect.debug.Skeleton;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class KinectDebugger extends Sprite
	{
		private var colorVideo:Video;
		private var colorVideoHolder:Sprite;
		private var skeletonHolder:Sprite;
		private var _skeletonList:Vector.<Skeleton>;
		protected var _bodyDataReader:BodyDataReader;
		
		public function KinectDebugger(kinect:Kinect)
		{
			super();
			
			var kinectCameraViewer:KinectCameraViewer = new KinectCameraViewer();
			addChild(kinectCameraViewer);
			
			_skeletonList = new Vector.<Skeleton>();
			skeletonHolder = new Sprite();
			addChild(skeletonHolder);
			
			bodyDataReader = kinect.bodyDataReader;
		}
		
		public function get skeletonList():Vector.<Skeleton>
		{
			return _skeletonList;
		}
		
		private function set skeletonList(value:Vector.<Skeleton>):void
		{
			_skeletonList = value;
		}
		
		protected function get bodyDataReader():BodyDataReader
		{
			return _bodyDataReader;
		}
		
		protected function set bodyDataReader(value:BodyDataReader):void
		{
			_bodyDataReader = value;
			_bodyDataReader.addEventListener(BodyDataEvent.ON_BODY_ADDED, onBodyAdded);
			_bodyDataReader.addEventListener(BodyDataEvent.ON_BODY_UPDATED, onBodyUpdated);
			_bodyDataReader.addEventListener(BodyDataEvent.ON_BODY_REMOVED, onBodyRemoved);
		}
		
		protected function onBodyRemoved(e:BodyDataEvent):void
		{
			for each(var skeleton:Skeleton in _skeletonList)
			{
				if ((skeleton != null) && (e.trackingID == skeleton.trackingID)) {
					if (skeleton.parent == skeletonHolder) skeletonHolder.removeChild(skeleton);
					skeleton = null;
				}
			}
		}
		
		protected function onBodyUpdated(e:BodyDataEvent):void
		{
			for each(var skeleton:Skeleton in _skeletonList)
			{
				if ((skeleton != null) && (e.trackingID == skeleton.trackingID)) {
					plushMappedPosToSkeleton(e.trackingID, skeleton);
					break;
				}
			}
		}
		
		protected function onBodyAdded(e:BodyDataEvent):void
		{
			var skeletonTemp:Skeleton = new Skeleton();
			skeletonTemp.trackingID = e.trackingID;
			plushMappedPosToSkeleton(e.trackingID, skeletonTemp);
			
			_skeletonList.push(skeletonTemp);
			skeletonHolder.addChild(skeletonTemp);
			
			updateSkeletonJointVisibility(skeletonTemp);
		}
		
		private function plushMappedPosToSkeleton(trackingID:Number, skeleton:Skeleton):void
		{
			skeleton.handLeft.state = _bodyDataReader.getLeftHandState(trackingID);
			skeleton.handRight.state = _bodyDataReader.getRightHandState(trackingID);
			
			skeleton.handLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.HAND_LEFT);
			skeleton.handRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.HAND_RIGHT);
			skeleton.head.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.HEAD);
			skeleton.neck.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.NECK);
			skeleton.spineShoulder.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.SPINE_SHOULDER);
			skeleton.shoulderLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.SHOULDER_LEFT);
			skeleton.shoulderRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.SHOULDER_RIGHT);
			skeleton.elbowLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.ELBOW_LEFT);
			skeleton.elbowRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.ELBOW_RIGHT);
			skeleton.wristLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.WRIST_LEFT);
			skeleton.wristRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.WRIST_RIGHT);
			skeleton.thumbLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.THUMB_LEFT);
			skeleton.thumbRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.THUMB_RIGHT);
			skeleton.handTipLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.HAND_TIP_LEFT);
			skeleton.handTipRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.HAND_TIP_RIGHT);
			skeleton.spineMid.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.SPINE_MID);
			skeleton.spineBase.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.SPINE_BASE);
			skeleton.hipLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.HIP_LEFT);
			skeleton.hipRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.HIP_RIGHT);
			skeleton.kneeLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.KNEE_LEFT);
			skeleton.kneeRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.KNEE_RIGHT);
			skeleton.ankleLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.ANKLE_LEFT);
			skeleton.ankleRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.ANKLE_RIGHT);
			skeleton.footLeft.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.FOOT_LEFT);
			skeleton.footRight.pos = _bodyDataReader.getJointMappedPos(trackingID, JointType.FOOT_RIGHT);
		}
		
		public var spineBaseVisible		:Boolean = true;
		public var spineMidVisible		:Boolean = true;
		public var neckVisible			:Boolean = true;
		public var headVisible			:Boolean = true;
		public var shoulderLeftVisible	:Boolean = true;
		public var elbowLeftVisible		:Boolean = true;
		public var wristLeftVisible		:Boolean = true;
		public var handLeftVisible		:Boolean = true;
		public var shoulderRightVisible	:Boolean = true;
		public var elbowRightVisible	:Boolean = true;
		public var wristRightVisible	:Boolean = true;
		public var handRightVisible		:Boolean = true;
		public var hipLeftVisible		:Boolean = true;
		public var kneeLeftVisible		:Boolean = true;
		public var ankleLeftVisible		:Boolean = true;
		public var footLeftVisible		:Boolean = true;
		public var hipRightVisible		:Boolean = true;
		public var kneeRightVisible		:Boolean = true;
		public var ankleRightVisible	:Boolean = true;
		public var footRightVisible		:Boolean = true;
		public var spineShoulderVisible	:Boolean = true;
		public var handTipLeftVisible	:Boolean = true;
		public var thumbLeftVisible		:Boolean = true;
		public var handTipRightVisible	:Boolean = true;
		public var thumbRightVisible	:Boolean = true;
		
		public function hideAllJoints():void 
		{
			spineBaseVisible		= false;
			spineMidVisible			= false;
			neckVisible				= false;
			headVisible				= false;
			shoulderLeftVisible		= false;
			elbowLeftVisible		= false;
			wristLeftVisible		= false;
			handLeftVisible			= false;
			shoulderRightVisible	= false;
			elbowRightVisible		= false;
			wristRightVisible		= false;
			handRightVisible		= false;
			hipLeftVisible			= false;
			kneeLeftVisible			= false;
			ankleLeftVisible		= false;
			footLeftVisible			= false;
			hipRightVisible			= false;
			kneeRightVisible		= false;
			ankleRightVisible		= false;
			footRightVisible		= false;
			spineShoulderVisible	= false;
			handTipLeftVisible		= false;
			thumbLeftVisible		= false;
			handTipRightVisible		= false;
			thumbRightVisible		= false;
		}
		
		public function showHandsOnly():void 
		{
			hideAllJoints();
			handLeftVisible = true;
			handRightVisible = true;
		}
		
		public function showUpperBodyOnly():void 
		{
			hideAllJoints();
			spineBaseVisible		= true;
			spineMidVisible			= true;
			neckVisible				= true;
			headVisible				= true;
			shoulderLeftVisible		= true;
			elbowLeftVisible		= true;
			wristLeftVisible		= true;
			handLeftVisible			= true;
			shoulderRightVisible	= true;
			elbowRightVisible		= true;
			wristRightVisible		= true;
			handRightVisible		= true;
			hipLeftVisible			= true;
			hipRightVisible			= true;
			spineShoulderVisible	= true;
			handTipLeftVisible		= true;
			thumbLeftVisible		= true;
			handTipRightVisible		= true;
			thumbRightVisible		= true;
		}
		
		public function updateSkeletonJointsVisibility():void 
		{
			for each (var skeletonEnum:Skeleton in _skeletonList) {
				updateSkeletonJointVisibility(skeletonEnum);
			}
		}
		
		public function updateSkeletonJointVisibility(skeleton:Skeleton):void 
		{
			
			skeleton.spineBase.visible = spineBaseVisible;
			skeleton.spineMid.visible = spineMidVisible;
			
			skeleton.head.visible = headVisible;
			skeleton.neck.visible = neckVisible;
			
			skeleton.shoulderLeft.visible = shoulderLeftVisible;
			skeleton.elbowLeft.visible = elbowLeftVisible;
			skeleton.wristLeft.visible = wristLeftVisible;
			skeleton.handLeft.visible = handLeftVisible;
			
			skeleton.shoulderRight.visible = shoulderRightVisible;
			skeleton.elbowRight.visible = elbowRightVisible;
			skeleton.wristRight.visible = wristRightVisible;
			skeleton.handRight.visible = handRightVisible;
			
			skeleton.hipLeft.visible = hipLeftVisible;
			skeleton.kneeLeft.visible = kneeLeftVisible;
			skeleton.ankleLeft.visible = ankleLeftVisible;
			skeleton.footLeft.visible = footLeftVisible;
			
			skeleton.hipRight.visible = hipRightVisible;
			skeleton.kneeRight.visible = kneeRightVisible;
			skeleton.ankleRight.visible = ankleRightVisible;
			skeleton.footRight.visible = footRightVisible;
			
			skeleton.spineShoulder.visible = spineShoulderVisible;
			
			skeleton.handTipLeft.visible = handTipLeftVisible;
			skeleton.thumbLeft.visible = thumbLeftVisible;
			
			skeleton.handTipRight.visible = handTipRightVisible;
			skeleton.thumbRight.visible = thumbRightVisible;
		}
		
		public function getJointOnScreenPos(trackingID:Number, jointType:String):Point {
			for each (var skeletonEnum:Skeleton in _skeletonList) {
				if (skeletonEnum.trackingID == trackingID) {
					var joint:Joint = skeletonEnum.getJointDisplayObject(jointType);
					if (joint != null) {
						var jointPos:Point = skeletonEnum.localToGlobal(new Point(joint.x, joint.y));
						return jointPos;
					}
				}
			}
			return null;
		}
	}

}