package 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxBar;
	import npc.EnemyType;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Enemy extends FlxSprite 
	{
		private var bar:FlxBar;
		protected var _time:Number = 0;
		protected var num:int = 0;
		public var bullets:FlxGroup;

		public function Enemy(health:int = 4)
		{
			super();
			this.health = health;
			loadGraphic(EnemyType.imgs[num], true, false, 70, 70);

			addAnimation("idle", makeFrames(), 11);
			addAnimation("hurt", [frames - 1], 20, false);
			
			bar = new FlxBar(0, 0, 1, width - 12, 3, this, "health", 0, health);
			bar.trackParent(6, -6);
			
			init();
		}
		
		private function makeFrames():Array
		{
			var n:int = frames - 1;
			var arr:Array = new Array(n);
			while (n--)
			{
				arr[n + 1] = n;
			}
			return arr;
		}
		
		public function init(_x:Number = 0, _y:Number = 0, _health:int = 10):void
		{
			revive();
			x = Math.random() * 250;
			y = Math.random() * 310;
			//health = _health;
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
			move();
			_time ++;
			
			if (y > 530) 
			{
				kill();
			}
			
			if(y < -50 || y > 530) 
			{
				destroy();
				kill(); 
			}
		}
		
		public function move():void
		{
			
		}
		
		override public function draw():void
		{
				super.draw();
				bar.draw();
		}
	}
	
}