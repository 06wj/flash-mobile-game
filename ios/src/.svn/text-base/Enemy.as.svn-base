package 
{
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxBar;
	import enemy.EnemyType;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Enemy extends FlxSprite 
	{
		private var bar:FlxBar;
		static private var num = 0;
		
		public function Enemy()
		{
			super();
			loadGraphic(EnemyType.imgs[num], true, false, 70, 70);

			addAnimation("idle", makeFrames(), 11);
			addAnimation("hurt", [frames - 1], 20, false);
			
			bar = new FlxBar(0, 0, 1, width - 12, 3, this, "health", 0, 10);				
			bar.trackParent(6, -6);
			
			init();
			num ++;
			if (num > 17) num = 0;
		}
		
		private function makeFrames():Array
		{
			var n:int = frames - 1;
			var arr:Array = new Array(n);
			while (n--)
			{
				arr[n + 1] = n;
				trace(n)
			}
			return arr;
		}
		
		public function init(_x:Number = 0, _y:Number = 0, _health:int = 10):void
		{
			revive();
			x = Math.random() * 250;
			y = Math.random() * 310;
			health = _health;
			play("idle");
		}
		
		override public function destroy():void
		{
			bar.destroy();
			bar = null;
			super.destroy();
		}
		
		override public function update():void
		{
			super.update();
			bar.update();
		}
		
		override public function draw():void
		{
				super.draw();
				bar.draw();
		}
	}
	
}