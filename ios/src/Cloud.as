package 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author 06wj
	 */
	public class Cloud extends FlxSprite
	{
		[Embed("images/maps/yun1.png")]
		private var yun1Img:Class;
		[Embed("images/maps/yun2.png")]
		private var yun2Img:Class;
		[Embed("images/maps/yun3.png")]
		private var yun3Img:Class;
		
		private var imgs:Array;
		private var n:int;
		
		public function Cloud(x:Number = 0, y:Number = -480):void
		{
			super(x, y);
			moves = false;
			
			n = 0;
			imgs = new Array(yun1Img, yun2Img, yun3Img);
			loadGraphic(imgs[n]);
			
			moves = false;
		}
		
		override public function update():void
		{
			y += 5;
			if (this.y >= 3880 + Math.random()*200)
			{
				this.y = -480;
				n = n == 2?0:++n;
				loadGraphic(imgs[n]);

			}
		}
	}
	
}