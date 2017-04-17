package com.nidlab.kinect.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	 
	 public class BodyDataEvent extends Event 
	{
		public static const ON_BODY_ADDED:String = "onBodyAdded";
		public static const ON_BODY_UPDATED:String = "onBodyUpdated";
		public static const ON_BODY_REMOVED:String = "onBodyRemoved";
		
		
		private var _trackingID:Number;
		
		public function BodyDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false,trackingID:Number=-1) 
		{ 
			super(type, bubbles, cancelable);
			_trackingID = trackingID;
		} 
		
		public override function clone():Event 
		{ 
			return new BodyDataEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BodyEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get trackingID():Number 
		{
			return _trackingID;
		}
		
	}
	
}