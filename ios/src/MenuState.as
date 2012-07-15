package 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author 06wj
	 */
	public class MenuState extends FlxState 
	{
		[Embed("images/menu.png")]
		private var imgEnemy:Class;
		
		public function MenuState()
		{
			
		}
		
		override public function create():void
		{
			add(new FlxSprite(0, 0, imgEnemy));
		}
		
		override public function update():void
		{
				if (FlxG.mouse.justPressed())
				{
					if(Math.random()>.5)
						FlxG.switchState(new GameState2());
					else
						FlxG.switchState(new GameState());
				}
		}
	}
	
}