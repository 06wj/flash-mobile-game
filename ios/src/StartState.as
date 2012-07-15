package 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author 06wj
	 */
	public class StartState extends FlxState 
	{
		[Embed("images/menu.png")]
		private var imgEnemy:Class;
		
		public function StartState()
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
					FlxG.switchState(new GameState());
				}
		}
	}
	
}