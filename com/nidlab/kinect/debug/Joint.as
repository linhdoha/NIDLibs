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
		private var alpha:int = 1;
		
		public function Joint(color:uint)
		{
			super();
			this.color = color;
			
			this.graphics.beginFill(this.color, 1);
			this.graphics.lineStyle(4, this.color, 1);
			this.graphics.drawCircle(0, 0, 10);
			this.graphics.endFill();
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
			
			if (_pos.x != -1 && _pos.y != -1)
			{
				this.alpha = 1;
			}
			else
			{
				this.alpha = 0;
			}
		
		}
		
		override public function get visible():Boolean
		{
			return super.visible;
		}
		
		override public function set visible(value:Boolean):void
		{
			super.visible = value;
		}
	}

}