package com.omgames.fsl 
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author James Robinson
	 */
	public class PlayState extends FlxState
	{
		private var player:Player;
		
		override public function create():void {
			super.create();
			FlxG.mouse.show();
			player = new Player();
			player.x = Main.SWF_WIDTH >> 1;
			player.y = Main.SWF_HEIGHT >> 1;
			add(player);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.mouse.justPressed()) {
				var foobar:Foobar = new Foobar();
				foobar.x = FlxG.mouse.x;
				foobar.y = FlxG.mouse.y;
				
				add(foobar)
			}
		}
		
	}

}