package 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Ground2 extends FlxSprite 
	{
		[Embed("images/maps/弗洛伦萨.jpg")]
		protected var mapImg:Class;
		
		public function Ground2(x:Number = 0, y:Number = -1985):void
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