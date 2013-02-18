package com.omgames.fsl
{
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author James Robinson
	 */
	public class Main extends FlxGame 
	{
		public static const SWF_WIDTH:int = 640;
		public static const SWF_HEIGHT:int = 480;
		
		public function Main():void 
		{
			super(SWF_WIDTH, SWF_HEIGHT, MainMenuState, 1, 60, 60);
			
			SessionLogger.init(stage);
		}
		
	}
	
}