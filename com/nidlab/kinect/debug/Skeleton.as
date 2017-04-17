package com.nidlab.kinect.debug
{
	import com.nidlab.kinect.JointType;
	import com.nidlab.kinect.debug.Hand;
	import com.nidlab.kinect.debug.Joint;
	import com.nidlab.utils.ColorManager;
	import com.nidlab.utils.RawColorPalette;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class Skeleton extends Sprite
	{
		
		private var _trackingID:Number;
		private var color:uint;
		private var _handLeft:Hand;
		private var _handRight:Hand;
		private var _head:Joint;
		private var _neck:Joint;
		private var _spineShoulder:Joint;
		private var _shoulderLeft:Joint;
		private var _shoulderRight:Joint;
		private var _elbowLeft:Joint;
		private var _elbowRight:Joint;
		private var _wristLeft:Joint;
		private var _wristRight:Joint;
		private var _thumbLeft:Joint;
		private var _thumbRight:Joint;
		private var _handTipLeft:Joint;
		private var _handTipRight:Joint;
		private var _spineMid:Joint;
		private var _spineBase:Joint;
		private var _hipLeft:Joint;
		private var _hipRight:Joint;
		private var _kneeLeft:Joint;
		private var _kreeRight:Joint;
		private var _ankleLeft:Joint;
		private var _ankleRight:Joint;
		private var _footLeft:Joint;
		private var _footRight:Joint;
		
		public function Skeleton()
		{
			super();
			color = ColorManager.getInstance(RawColorPalette).randomColor();
			
			_handLeft = new Hand(color);
			addChild(_handLeft);
			_handRight = new Hand(color);
			addChild(_handRight);
			_head = new Joint(color);
			addChild(_head);
			_neck = new Joint(color);
			addChild(_neck);
			_spineShoulder = new Joint(color);
			addChild(_spineShoulder);
			_shoulderLeft = new Joint(color);
			addChild(_shoulderLeft);
			_shoulderRight = new Joint(color);
			addChild(_shoulderRight);
			_elbowLeft = new Joint(color);
			addChild(_elbowLeft);
			_elbowRight = new Joint(color);
			addChild(_elbowRight);
			_wristLeft = new Joint(color);
			addChild(_wristLeft);
			_wristRight = new Joint(color);
			addChild(_wristRight);
			_thumbLeft = new Joint(color);
			addChild(_thumbLeft);
			_thumbRight = new Joint(color);
			addChild(_thumbRight);
			_handTipLeft = new Joint(color);
			addChild(_handTipLeft);
			_handTipRight = new Joint(color);
			addChild(_handTipRight);
			_spineMid = new Joint(color);
			addChild(_spineMid);
			_spineBase = new Joint(color);
			addChild(_spineBase);
			_hipLeft = new Joint(color);
			addChild(_hipLeft);
			_hipRight = new Joint(color);
			addChild(_hipRight);
			_kneeLeft = new Joint(color);
			addChild(_kneeLeft);
			_kreeRight = new Joint(color);
			addChild(_kreeRight);
			_ankleLeft = new Joint(color);
			addChild(_ankleLeft);
			_ankleRight = new Joint(color);
			addChild(_ankleRight);
			_footLeft = new Joint(color);
			addChild(_footLeft);
			_footRight = new Joint(color);
			addChild(_footRight);
			
		}
		
		public function get trackingID():Number
		{
			return _trackingID;
		}
		
		public function set trackingID(value:Number):void
		{
			_trackingID = value;
		}
		
		public function get handLeft():Hand
		{
			return _handLeft;
		}
		
		public function get handRight():Hand
		{
			return _handRight;
		}
		
		public function get head():Joint
		{
			return _head;
		}
		
		public function set head(value:Joint):void
		{
			_head = value;
		}
		
		public function get neck():Joint
		{
			return _neck;
		}
		
		public function set neck(value:Joint):void
		{
			_neck = value;
		}
		
		public function get spineShoulder():Joint
		{
			return _spineShoulder;
		}
		
		public function set spineShoulder(value:Joint):void
		{
			_spineShoulder = value;
		}
		
		public function get shoulderLeft():Joint
		{
			return _shoulderLeft;
		}
		
		public function set shoulderLeft(value:Joint):void
		{
			_shoulderLeft = value;
		}
		
		public function get shoulderRight():Joint
		{
			return _shoulderRight;
		}
		
		public function set shoulderRight(value:Joint):void
		{
			_shoulderRight = value;
		}
		
		public function get elbowLeft():Joint
		{
			return _elbowLeft;
		}
		
		public function set elbowLeft(value:Joint):void
		{
			_elbowLeft = value;
		}
		
		public function get elbowRight():Joint
		{
			return _elbowRight;
		}
		
		public function set elbowRight(value:Joint):void
		{
			_elbowRight = value;
		}
		
		public function get wristLeft():Joint
		{
			return _wristLeft;
		}
		
		public function set wristLeft(value:Joint):void
		{
			_wristLeft = value;
		}
		
		public function get wristRight():Joint
		{
			return _wristRight;
		}
		
		public function set wristRight(value:Joint):void
		{
			_wristRight = value;
		}
		
		public function get thumbLeft():Joint
		{
			return _thumbLeft;
		}
		
		public function set thumbLeft(value:Joint):void
		{
			_thumbLeft = value;
		}
		
		public function get thumbRight():Joint
		{
			return _thumbRight;
		}
		
		public function set thumbRight(value:Joint):void
		{
			_thumbRight = value;
		}
		
		public function get handTipLeft():Joint
		{
			return _handTipLeft;
		}
		
		public function set handTipLeft(value:Joint):void
		{
			_handTipLeft = value;
		}
		
		public function get handTipRight():Joint
		{
			return _handTipRight;
		}
		
		public function set handTipRight(value:Joint):void
		{
			_handTipRight = value;
		}
		
		public function get spineMid():Joint
		{
			return _spineMid;
		}
		
		public function set spineMid(value:Joint):void
		{
			_spineMid = value;
		}
		
		public function get spineBase():Joint
		{
			return _spineBase;
		}
		
		public function set spineBase(value:Joint):void
		{
			_spineBase = value;
		}
		
		public function get hipLeft():Joint
		{
			return _hipLeft;
		}
		
		public function set hipLeft(value:Joint):void
		{
			_hipLeft = value;
		}
		
		public function get hipRight():Joint
		{
			return _hipRight;
		}
		
		public function set hipRight(value:Joint):void
		{
			_hipRight = value;
		}
		
		public function get kneeLeft():Joint
		{
			return _kneeLeft;
		}
		
		public function set kneeLeft(value:Joint):void
		{
			_kneeLeft = value;
		}
		
		public function get kneeRight():Joint
		{
			return _kreeRight;
		}
		
		public function set kneeRight(value:Joint):void
		{
			_kreeRight = value;
		}
		
		public function get ankleLeft():Joint
		{
			return _ankleLeft;
		}
		
		public function set ankleLeft(value:Joint):void
		{
			_ankleLeft = value;
		}
		
		public function get ankleRight():Joint
		{
			return _ankleRight;
		}
		
		public function set ankleRight(value:Joint):void
		{
			_ankleRight = value;
		}
		
		public function get footLeft():Joint
		{
			return _footLeft;
		}
		
		public function set footLeft(value:Joint):void
		{
			_footLeft = value;
		}
		
		public function get footRight():Joint
		{
			return _footRight;
		}
		
		public function set footRight(value:Joint):void
		{
			_footRight = value;
		}
		
		public function getJointDisplayObject(jointName:String):Joint {
			var joint:Joint;
			switch (jointName)  {
				case JointType.HAND_LEFT:
					joint = handLeft;
					break;
				case JointType.HAND_RIGHT:
					joint = handRight;
					break;
				case JointType.HEAD:
					joint = head;
					break;
				case JointType.NECK:
					joint =  neck;
					break;
				case JointType.SPINE_SHOULDER:
					joint = spineShoulder;
					break;
				case JointType.SHOULDER_LEFT:
					joint = shoulderLeft;
					break;
				case JointType.SHOULDER_RIGHT:
					joint = shoulderRight;
					break;
				case JointType.ELBOW_LEFT:
					joint = elbowLeft;
					break;
				case JointType.ELBOW_RIGHT:
					joint = elbowRight;
					break;
				case JointType.WRIST_LEFT:
					joint = wristLeft;
					break;
				case JointType.WRIST_RIGHT:
					joint = wristRight;
					break;
				case JointType.THUMB_LEFT:
					joint = thumbLeft;
					break;
				case JointType.THUMB_RIGHT:
					joint = thumbRight;
					break;
				case JointType.HAND_TIP_LEFT:
					joint = handTipLeft;
					break;
				case JointType.HAND_TIP_RIGHT:
					joint = handTipRight;
					break;
				case JointType.SPINE_MID:
					joint = spineMid;
					break;
				case JointType.SPINE_BASE:
					joint = spineBase;
					break;
				case JointType.HIP_LEFT:
					joint = hipLeft;
					break;
				case JointType.HIP_RIGHT:
					joint = hipRight;
					break;
				case JointType.KNEE_LEFT:
					joint = kneeLeft;
					break;
				case JointType.KNEE_RIGHT:
					joint = kneeRight;
					break;
				case JointType.ANKLE_LEFT:
					joint = ankleLeft;
					break;
				case JointType.ANKLE_RIGHT:
					joint = ankleRight;
					break;
				case JointType.FOOT_LEFT:
					joint = footLeft;
					break;
				case JointType.FOOT_RIGHT:
					joint = footRight;
					break;
			}
			return joint;
		}
		
		/*public function hideAllJoints():void
		{
			handLeft.visible = false;
			handRight.visible = false;
			head.visible = false;
			neck.visible = false;
			spineShoulder.visible = false;
			shoulderLeft.visible = false;
			shoulderRight.visible = false;
			elbowLeft.visible = false;
			elbowRight.visible = false;
			wristLeft.visible = false;
			wristRight.visible = false;
			thumbLeft.visible = false;
			thumbRight.visible = false;
			handTipLeft.visible = false;
			handTipRight.visible = false;
			spineMid.visible = false;
			spineBase.visible = false;
			hipLeft.visible = false;
			hipRight.visible = false;
			kneeLeft.visible = false;
			kneeRight.visible = false;
			ankleLeft.visible = false;
			ankleRight.visible = false;
			footLeft.visible = false;
			footRight.visible = false;
		}
		
		public function showHandsOnly():void
		{
			hideAllJoints();
			handLeft.visible = true;
			handRight.visible = true;
		}
		
		public function showUpperBodyOnly():void
		{
			hideAllJoints();
			handLeft.visible = true;
			handRight.visible = true;
			head.visible = true;
			neck.visible = true;
			spineShoulder.visible = true;
			shoulderLeft.visible = true;
			shoulderRight.visible = true;
			elbowLeft.visible = true;
			elbowRight.visible = true;
			wristLeft.visible = true;
			wristRight.visible = true;
			thumbLeft.visible = true;
			thumbRight.visible = true;
			handTipLeft.visible = true;
			handTipRight.visible = true;
			spineMid.visible = true;
			spineBase.visible = true;
			hipLeft.visible = true;
			hipRight.visible = true;
		}*/
	}

}