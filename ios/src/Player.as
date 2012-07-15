package 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Player extends FlxSprite
	{
		[Embed("images/player/player1.png")]
		protected var playerImg:Class;
		private var bar:FlxBar;
		public var speed:uint = 4;
		public var bullets:FlxGroup;
		private var _time:Number;
		private var _mouseX:Number;
		private var _mouseY:Number;
		
		public function Player(x:Number = 160, y:Number = 360):void
		{
			super(x, y);
			
			health = 100;
			_time = 0;
			loadGraphic(playerImg, true, false, 76, 76, true);
			addAnimation("动态", [0, 1, 2, 1], 11);
			addAnimation("眩晕", [9, 10, 11], 11);
			addAnimation("冰冻", [7, 8], 11);
			addAnimation("中毒", [12, 13], 11);
			addAnimation("激光", [14, 15], 11);
			addAnimation("普通攻击", [3, 4], 11);
			
			bar = new FlxBar(5, 5, FlxBar.FILL_LEFT_TO_RIGHT, 150, 7, this, "health", 0, health);				
			
			this.x -= origin.x;
			play("动态");
			
			
		}
		
		override public function update():void
		{
			_time += FlxG.elapsed;
			if (FlxG.mouse.justPressed())
			{
				_mouseX = FlxG.mouse.screenX - x;
				_mouseY = FlxG.mouse.screenY - y;
				
				trace("aaaa"+FlxG._game.numChildren)
			}
			if (FlxG.mouse.pressed())
			{
				x = FlxG.mouse.screenX - _mouseX;
				y = FlxG.mouse.screenY - _mouseY;
				checkPosition();
				
				if (_time > .4)
				{
					_time = 0;
					shoot();
				}
			}
			
			if (FlxG.keys.pressed("D") || FlxG.keys.pressed("RIGHT"))
			{
				x += speed;
				if(x > 320 - width)
				{
					x =  320 - width;
				}
			}
			else if (FlxG.keys.pressed("A") || FlxG.keys.pressed("LEFT"))
			{
				x -= speed;
				if(x < 0)
				{
					x = 0;
				}
			}
			
			if (FlxG.keys.pressed("S") || FlxG.keys.pressed("DOWN"))
			{
				y += speed;
				if(y > 480 - height)
				{
					y = 480 - height;
				}
			}
			else if (FlxG.keys.pressed("W") || FlxG.keys.pressed("UP"))
			{
				y -= speed;
				if(y < 0)
				{
					y = 0;
				}
			}
		
			
			if (FlxG.keys.justPressed("J") || FlxG.keys.justPressed("SPACE"))
			{
				shoot();
				play("普通攻击");
			}
			else
			{
				play("动态")
			}
			
			bar.update();
			super.update();
		}
		
		public function shoot():void
		{
			var b :Bullet = bullets.recycle(Bullet) as Bullet;
			trace(bullets.length)
			b.revive();
			b.x = x + origin.x - b.origin.x;
			b.y = y;
		}
		
		public function checkPosition():void
		{
			if(x > 320 - width)
			{
				x =  320 - width;
			}
			else if(x < 0)
			{
				x = 0;
			}
			if(y > 480 - height)
			{
				y =  480 - height;
			}
			else if(y < 0)
			{
				y = 0;
			}
		}
		
		override public function draw():void
		{
				super.draw();
				bar.draw();
		}
	}
	
}