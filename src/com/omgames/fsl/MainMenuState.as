package com.omgames.fsl 
{
	import org.flixel.FlxButton;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author James Robinson
	 */
	public class MainMenuState extends FlxState
	{
		
		override public function create():void
		{
			FlxG.mouse.show();
			
			var txtTitle:FlxText = new FlxText(0, 50, Main.SWF_WIDTH, "GAME TITLE");
			txtTitle.size = 32;
			txtTitle.alignment = "center";
			txtTitle.shadow = 0xff888888;
			add(txtTitle);
			
			var playBtn:FlxButton = new FlxButton(Main.SWF_WIDTH / 2 - 40, Main.SWF_HEIGHT - 50, "Play", play)
			this.add(playBtn);
		}
		
		private function play():void {
			FlxG.switchState(new PlayState());
		}
		
	}

}