package {
    import flash.display.MovieClip;
    import flash.events.Event; //add this
	
    public class IceCube extends MovieClip{
		private var speed:int = 10; //add this
		
        public function IceCube(playerX:int, playerY:int, playerDirection:String) { //notice the variables we pass in
		// constructor code
		if(playerDirection == "left") {
			speed = -10;
			x = playerY - 50;
		} else if(playerDirection == "right") {
			speed = 10;
			x = playerY + 50;
		}
		y = playerX - 50;
		addEventListener(Event.ENTER_FRAME, loop);
		}
		
        public function loop(e:Event):void { //add this
            //looping code goes here
			x += speed; //add this
        }
    }
}