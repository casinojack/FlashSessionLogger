package com.omgames.fsl 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author James Robinson
	 */
	public class Player extends FlxSprite
	{
		
		public function Player() 
		{
			makeGraphic(8, 16, 0xffffaaaa);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.keys.pressed("UP")) {
				y--;
			}
			if (FlxG.keys.pressed("DOWN")) {
				y++;
			}
			if (FlxG.keys.pressed("LEFT")) {
				x--;
			}
			if (FlxG.keys.pressed("RIGHT")) {
				x++;
			}
		}
		
	}

}