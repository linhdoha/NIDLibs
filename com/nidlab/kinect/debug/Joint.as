package com.nidlab.kinect.debug 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class Joint extends Sprite 
	{
		private var _color:uint;
		private var _pos:Point;
		
		public function Joint(color:uint) 
		{
			super();
			this.color = color;
			
			this.graphics.lineStyle(4, this.color, 1);
			this.graphics.drawCircle(0, 0, 10);
		}
		
		public function get color():uint 
		{
			return _color;
		}
		
		public function set color(value:uint):void 
		{
			_color = value;
		}
		
		public function get pos():Point 
		{
			return _pos;
		}
		
		public function set pos(value:Point):void 
		{
			_pos = value;
			x = _pos.x;
			y = _pos.y;
			
			if (_pos.x !=-1 && _pos.y !=-1) {
				this.visible = true;
			} else {
				this.visible = false;
			}
		}
		
	}

}