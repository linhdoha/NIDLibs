package com.nidlab.utils 
{
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class RawColorPalette extends BaseColorPalette 
	{
		
		public function RawColorPalette() 
		{
			super();
			this.colorList = new <uint>[
				0xFF0000,
				0xFF8000,
				0xFFFF00,
				0x80FF00,
				0x00FF00,
				0x00FF80,
				0x00FFFF,
				0x0080FF,
				0x0000FF,
				0x8000FF,
				0xFF00FF
			];
			
			this.paletteName = "Material Color Palette";
		}
		
	}

}