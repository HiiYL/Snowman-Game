package {
    import flash.display.MovieClip;
    import flash.events.Event; //add this
	
    public class IceCube extends MovieClip{
		private var speed:int = 20; //add this
		private var initialX:int;
        public function IceCube(playerX:int, playerY:int, playerDirection:String) { //notice the variables we pass in
			// constructor code
			if(playerDirection == "left") {
				speed = 10;
				x = playerX;
			} else if(playerDirection == "right") {
				speed = 10;
				x = playerX +300;
			}
			y = playerY;
			initialX = x; //use this to remember the initial spawn point
			addEventListener(Event.ENTER_FRAME, loop);
			addEventListener(Event.REMOVED_FROM_STAGE, removeSelf);
		}
		
        public function loop(e:Event):void { //add this
            //looping code goes here
			y += speed; //add this
			if(speed > 0) { //if player is facing right
				if(x > initialX + 640) { //and the bullet is more than 640px to the right of where it was spawned
					removeSelf(); //remove it
				}
			} else { //else if player is facing left
				if(x < initialX - 640) { //and bullet is more than 640px to the left of where it was spawned
					removeSelf(); //remove it
				}
			}
		}
		
		public function removeSelf(e:Event = null):void {
			trace("remove self");
			removeEventListener(Event.ENTER_FRAME, loop); //stop the loop
			removeEventListener(Event.REMOVED_FROM_STAGE, removeSelf);
			this.parent.removeChild(this); //tell this object's "parent object" to remove this object
			//in our case, the parent is the background because in the main code we said: back.addChild(bullet);
		}
    }
}