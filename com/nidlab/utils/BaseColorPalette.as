package com.nidlab.utils 
{
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class BaseColorPalette 
	{
		private var _colorList:Vector.<uint>;
		private var _paletteName:String;
		public function BaseColorPalette() 
		{
			
		}
		
		public function get colorList():Vector.<uint> 
		{
			return _colorList;
		}
		
		public function set colorList(value:Vector.<uint>):void 
		{
			_colorList = value;
		}
		
		public function get paletteName():String 
		{
			return _paletteName;
		}
		
		public function set paletteName(value:String):void 
		{
			_paletteName = value;
		}
		
		
	}

}