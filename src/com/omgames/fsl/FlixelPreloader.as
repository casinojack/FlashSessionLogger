package com.omgames.fsl 
{
	import org.flixel.system.FlxPreloader;
	import org.flixel.FlxG;
	
	public class FlixelPreloader extends FlxPreloader
	{
		public function FlixelPreloader() 
		{
			FlxG.debug = true;
			className = "com.omgames.fsl.Main";
			super();
		}
		
	}

}