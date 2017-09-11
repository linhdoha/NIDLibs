package com.nidlab.utils
{
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.filters.BitmapFilterQuality;
	
	/**
	 * ...
	 * @author Linhdoha
	 */
	public class Debug
	{
		
		[Embed(source="D:/Seafile/My Library/Paper Toy Maker/PTM_Main_AIR/assets/04B_03__.TTF", fontName="8bit", advancedAntiAliasing="false",mimeType = "application/x-font", embedAsCFF="false")]
		private var profont:Class;
		
		private static var _tf:TextField;
		private static const _trace:Function = trace
		
		public static function trace(value:*):void
		{
			Debug.textField.text += "\n" + value;
			Debug.textField.wordWrap = true;
			Debug.textField.embedFonts = true;
			Debug.textField.setTextFormat(new TextFormat("8bit", 12,0x00FF22));
			Debug.textField.scrollV = _tf.maxScrollV;
		}
		
		public static function get textField():TextField {
			if (!_tf) {
				_tf = new TextField();
				_tf.addEventListener(Event.ADDED_TO_STAGE, onAdded);
				_tf.filters = [new GlowFilter(0x00FF22, 1, 2, 2, 1, BitmapFilterQuality.HIGH)];
				Debug.trace("DEBUG:");
			}
			return _tf;
		}
		
		static private function onAdded(e:Event):void 
		{
			_tf.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			_tf.width = _tf.stage.stageWidth;
			_tf.height = _tf.stage.stageHeight;
			
			_tf.stage.addEventListener(Event.RESIZE, onStageResized);
		}
		
		static private function onStageResized(e:Event):void 
		{
			_tf.width = _tf.stage.stageWidth;
			_tf.height = _tf.stage.stageHeight;
		}
	}
}