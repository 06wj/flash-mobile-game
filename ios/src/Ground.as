package 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Ground extends FlxSprite 
	{
		[Embed("images/maps/埃及.jpg")]
		protected var mapImg:Class;
		
		public function Ground(x:Number = 0, y:Number = -1985):void
		{
			super(x, y, mapImg);
			moves = false;
		}
		
		override public function update():void
		{
			y += .5;
			if (this.y >= 0)
			{
				this.y = 0;
			}
		}
		
		
	}
	
}