package com.nidlab.utils
{
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class Debug
	{
		
		private static var _text:String;
		private static var _tf:TextField;
		private static const _trace:Function = trace
		
		public static function trace(value:*):void
		{
			_text += "\n" + value;
			
			if (_tf)
			{
				_tf.text = _text;
				_tf.scrollV = _tf.maxScrollV;
			}
		}
		
		static public function get text():String
		{
			return _text;
		}
		
		public static function attachToTF(tf:TextField):void
		{
			_tf = tf;
		}
	}
}