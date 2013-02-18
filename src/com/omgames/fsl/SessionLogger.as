package com.omgames.fsl 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author James Robinson
	 */
	public class SessionLogger 
	{
		private static var _instance:SessionLogger;
		
		private var keymap:Array;
		private var keycode:int;
		private var lastActionTime:int;
		private var deltaTime:int;
		
		private static const ACTION_GENERATE_SEED:String= "S";
		private static const ACTION_MOUSE_MOVE:String 	= "p";
		private static const ACTION_MOUSE_DOWN:String 	= "M";
		private static const ACTION_MOUSE_UP:String 	= "m";
		private static const ACTION_KEY_DOWN:String 	= "K";
		private static const ACTION_KEY_UP:String 		= "k";
		private static const DATA_SEPARATOR:String 		= ":";
		
		private var seed:int;

		private const MAX_RATIO:Number = 1 / int.MAX_VALUE;
		private const MIN_MAX_RATIO:Number = -MAX_RATIO;
		
 
		public function SessionLogger(stage:Stage) {
			if (_instance == null) 
			{ 
				_instance = this;
			} 
				else 
			{
				trace("SessionLogger: Instance Error: The SessionLogger class is a singleton and should only be constructed once. Use SessionLogger.api instead.");
				return;
			}
			
			generateSeed();
			seed = 485;
			keymap = new Array();
			lastActionTime = getTimer();
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function generateSeed():void {
			seed = Math.floor(Math.random() * 999);
			logAction(ACTION_GENERATE_SEED, seed.toString());
		}
		
		/**
		 * Static reference to the current SessionLogger instance
		 */
		public static function init(stage:Stage):void 
		{ 
			if (_instance == null)
			{
				new SessionLogger(stage);
			}
		}
		
		private function mouseMove(e:MouseEvent):void {
			logAction(ACTION_MOUSE_MOVE, ((int) (e.stageX)) + "," + ((int) (e.stageY))); 
		}
		
		private function mouseDown(e:MouseEvent):void {
			logAction(ACTION_MOUSE_DOWN, "16");
		}
		
		private function mouseUp(e:MouseEvent):void {
			logAction(ACTION_MOUSE_UP, "16");
		}
		
		private function keyDown(e:KeyboardEvent):void {
			keycode = e.keyCode;
			
			//if(!keymap[keycode]) {
				logAction(ACTION_KEY_DOWN, keycode.toString());
				//keymap[keycode] = true;
			//}
		}
		
		private function keyUp(e:KeyboardEvent):void {
			logAction(ACTION_KEY_UP, e.keyCode.toString());
			//keymap[keycode] = false;
		}
		
		private function logAction(type:String, metadata:String):void {
			deltaTime = Math.max(10, getTimer() - lastActionTime);
			var action:String = deltaTime.toString() + DATA_SEPARATOR + type + DATA_SEPARATOR + metadata;
			//trace(action);
		
			lastActionTime = getTimer();
		}
		
		public static function random():Number {
			return -_instance.getNextRnd();
		}
		
		/*
		 * Seeded rng
		 * http://www.calypso88.com/?p=524
		 */
		public function getNextRnd():Number
		{
		   seed ^= (seed << 21);
		   seed ^= (seed >>> 35);
		   seed ^= (seed << 4);
		   if (seed < 0) return seed * MAX_RATIO;
		   return seed * MIN_MAX_RATIO;
		}
		
	}

}