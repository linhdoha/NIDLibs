package com.nidlab.kinect 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class GestureLivePreview extends Sprite 
	{
		private var gestureName:TextField;
		
		public function GestureLivePreview() 
		{
			super();
			gestureName = new TextField();
			gestureName.setTextFormat = new TextFormat("Arial", 40, 0xFFFFFF, true);
			graphics.drawRect();
		}
		
	}

}