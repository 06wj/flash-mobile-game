package bul
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author 06wj
	 */
	public class BZhadan extends FlxSprite 
	{
		[Embed("../images/bullet/zhadan.png")]
		protected var bulletImg:Class;
		
		public function BZhadan(x:Number = 0, y:Number = 0):void
		{
			super(x, y, bulletImg);
 			velocity.y = 300;
			
			this.x -= origin.x;
			this.y -= origin.y;
		}
		 
		override public function update():void
		{
			if(y < -50 || y > 530) 
			{
				kill(); 
			}
			super.update();
		}
	}
	
}