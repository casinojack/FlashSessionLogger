package com.omgames.fsl 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author James Robinson
	 */
	public class Foobar extends FlxSprite
	{
		
		public function Foobar():void {
			this.makeGraphic(10, 10);
			
			if(SessionLogger.random() > 0.5) {
				this.velocity.x = -20;
			}
			else {
				this.velocity.x = 20;
			}
		}
		
		override public function update():void {
			super.update();
			
			//this.velocity.y += 0.1;
		}
		
	}

}