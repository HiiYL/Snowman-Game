package  {
	import flash.display.MovieClip;
    import flash.events.Event; //add this
	
	public class Snowball extends MovieClip{
		
		private var speed:int = 30; //add this
		private var initialX:int;

		public function Snowball(playerX:int, playerY:int, playerDirection:String, playerSpeed:int) { //notice the variables we pass in
			// constructor code
			if(playerDirection == "left") {
				speed = -30 + playerSpeed;
				x = playerX - 25;
			} else if(playerDirection == "right") {
				speed = 30  + playerSpeed;
				x = playerX + 25
			}
			initialX = x;
			y = playerY - 50;
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void { //add this
            //looping code goes here
			x += speed; //add this
			if(speed > 0) { //if player is facing right
			if(x > initialX + 640) { //and the bullet is more than 640px to the right of where it was spawned
					removeSelf(); //remove it
				}
			} else { //else if player is facing left
				if(x < initialX - 640) { //and bullet is more than 640px to the left of where it was spawned
					//removeSelf(); //remove it
				}
			}
        }
		public function removeSelf():void {
			trace("remove self");
			removeEventListener(Event.ENTER_FRAME, loop); //stop the loop
			this.parent.removeChild(this); //tell this object's "parent object" to remove this object
			//in our case, the parent is the background because in the main code we said: back.addChild(bullet);
		}

	}
	
}
