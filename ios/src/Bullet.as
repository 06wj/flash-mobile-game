package 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author 06wj
	 */
	public class Bullet extends FlxSprite 
	{
		[Embed("images/bullet/zhujue.png")]
		protected var bulletImg:Class;
		
		public function Bullet(x:Number = 0, y:Number = 0):void
		{
			super(x, y, bulletImg);
 			velocity.y = -300;
			angle = 180;
			angularVelocity = 400;
			
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