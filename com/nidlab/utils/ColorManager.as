package com.nidlab.utils 
{
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class ColorManager 
	{
		static private var _instance:ColorManager;
		private var _colorPalette:BaseColorPalette;
		private var _colorList:Vector.<uint>;
		
		public static function getInstance(colorPaletteClass:Class):ColorManager {
			if (!_instance) {
				_instance = new ColorManager(colorPaletteClass);
			}
			return _instance;
		}
		
		public function ColorManager(colorPaletteClass:Class) 
		{
			var palette:BaseColorPalette = new colorPaletteClass();
			colorPalette = palette;
		}
		
		public function get colorPalette():BaseColorPalette 
		{
			return _colorPalette;
		}
		
		public function set colorPalette(value:BaseColorPalette):void 
		{
			_colorPalette = value;
			_colorList = _colorPalette.colorList;
		}
		
		public function randomColor():uint
		{
			return _colorList[Math.round(Math.random() * (_colorList.length-1))];
		}
	}

}