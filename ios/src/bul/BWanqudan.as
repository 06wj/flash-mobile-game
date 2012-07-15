package bul
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author 06wj
	 */
	public class BWanqudan extends FlxSprite 
	{
		[Embed("../images/bullet/daodan2.png")]
		protected var bulletImg:Class;
		public var t:FlxSprite;
		
		public function BWanqudan(x:Number = 0, y:Number = 0, angle:Number = 90):void
		{
			super(x, y, bulletImg);
 			velocity.y = 300;
			this.angle = angle;
			
			this.x -= origin.x;
			this.y -= origin.y;
		}
		
		private function getAngle():Number
		{
			return Math.atan2(y - t.y, x - t.x)/Math.PI*180;
		}
		
		private function setSpeed():void
		{
			var ang:Number = getAngle();
			angle = ang > (angle-90)?angle + 2.4:angle - 2.4;
			ang = (angle-90) * Math.PI / 180 ;
			
			velocity.x = -300 * Math.cos(ang);
			velocity.y = -300 * Math.sin(ang);
		}
		
		override public function update():void
		{
			if(y < -50 || y > 530 || x < -50 || x > 370) 
			{
				kill(); 
			}
			setSpeed();
			super.update();
		}
	}
	
}