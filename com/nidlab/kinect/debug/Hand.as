package com.nidlab.kinect.debug
{
	import com.nidlab.kinect.HandStates;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class Hand extends Joint
	{
		private var _state:int;
		private var _pos:Point;
		private var _color:uint;
		
		public function Hand(color:uint)
		{
			super(color);
		}
		
		public function get state():int
		{
			return _state;
		}
		
		public function set state(value:int):void
		{
			_state = value;
			var colorTemp:uint;
			var size:int = 40;
			var alpha:int = 1;
			switch (this.state) {
				case HandStates.OPEN:
					colorTemp = 0x00FF00;
					alpha = 1;
					size = 80;
					break;
				case HandStates.CLOSED:
					colorTemp = 0xFF0000;
					alpha = 1;
					size = 40;
					break;
				case HandStates.LASSO:
					colorTemp = 0xFFFF00;
					alpha = 1;
					size = 80;
					break;
				case HandStates.UNKNOWN:
					colorTemp = 0x999999;
					alpha = 1;
					size = 40;
					break;
				case HandStates.NOT_TRACKED:
					colorTemp = 0x999999;
					alpha = 0;
					size = 40;
					break;
			}
			
			this.graphics.clear();
			this.graphics.lineStyle(4, colorTemp, alpha);
			this.graphics.drawCircle(0, 0, size);
		}
	}

}