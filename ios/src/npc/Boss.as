package npc
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxBar;
	import npc.EnemyType;
	import org.flixel.FlxG;
	import bul.*;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Boss extends FlxSprite 
	{
		private var bar:FlxBar;
		protected var _time:Number = 0;
		protected var num:int = 0;
		public var bullets:FlxGroup;
		public var t:FlxSprite;
		private var _ang:Number = .2;
		private var _angv:Number = .3;
		private var wanquang = 90;
		private var moveArr = [move1, move2, move3, move4];
		
		
		public function Boss(t:FlxSprite)
		{
			super();
			this.t = t;
			this.health = 100;
			loadGraphic(EnemyType.imgs[9], true, false, 200, 200);

			addAnimation("idle", makeFrames(), 12);
			
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
			x = 220;
			y = Math.random() * 310;
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
			
		}
		
		override public function draw():void
		{
				super.draw();
				bar.draw();
		}
		
		function move() 
		{
			if (health > 90) {
					move1();
			}
			else if (health > 80) {
				   move2();
			}
			else if (health > 70) {
				   move3();
			}
			else if (health > 60) {
				   move4();
			}
			else if (health > 50) {
				   move1();
				   move2();
			}
			else if (health > 40) {
				   move2();
				   move3();
			}
			else if (health > 30) {
				   move3();
				   move4();
			}
			else if (health > 20) {
				   move1();
				   move2();
				   move3();
			}
			else  {
				   move1();
				   move2();
				   move3();
				   move4();
			}
		}
		
		function move1():void
		{
			if (_time == 55)
			{
				shoot1(.2);
				shoot1(.4);
				shoot1(.6);
				shoot1(.8);
				shoot1( -.2);
				shoot1(-.4);
				shoot1( -.6);
				shoot1( -.8);
				
				_time = 0;
			}
		}
		
		function shoot1(ang:Number):void
		{
			var b :BPulan = new BPulan(x, y + 80);
			bullets.add(b);
			b.velocity.x = 300 * Math.sin(ang);
			b.velocity.y = 300 * Math.cos(ang);
			b.x = x + origin.x - b.origin.x;
		}
		
		public function move2():void
		{
			if (_time%10 == 1 && _time < 42)
			{
				shoot2(x + 35, wanquang);
			}
			else if (_time > 270)
			{
				_time = 0;
				wanquang = Math.random() > .5?90: -90;
			}
		}
		
		public function move4():void
		{
			if (_time%10 == 1 && _time < 42)
			{
				shoot2(x + 35, 90);
				shoot2(x - 35, -90);
			}
			else if (_time > 270)
			{
				_time = 0;
			}
		}
		
		private function shoot2(x:Number, ang:Number):void
		{
			var b :BWanqudan = new BWanqudan(x, y + 70, ang);
			b.t = t;
			bullets.add(b);
			b.x = x + origin.x - b.origin.x;
		}
		
		public function move3():void
		{
			if (_time == 20)
			{
				shoot3(x - 14, -_ang);
				shoot3(x + 14, _ang);
				_time = 0;
				
				_ang += _angv;
				if (_ang > .7 || _ang < 0) _angv*=-1;
			}
		}
		
		private function shoot3(x:Number, ang:Number = 0):void
		{
			var b :BPuhong = new BPuhong(x, y + 70);
			bullets.add(b);
			b.velocity.x = 200 * Math.sin(ang);
			b.velocity.y = 200 * Math.cos(ang);
			b.x = x + origin.x - b.origin.x;
		}
	}
	
}