package {
    import flash.display.MovieClip;
    import flash.events.Event;
	public class Enemy extends MovieClip {
 
        private var xSpeedConst:int = 2;
        private var flip:int = 1;
 
        public function Enemy(xLocation:int, yLocation:int) {
            // constructor code
            x = xLocation;
            y = yLocation;
            addEventListener(Event.ENTER_FRAME, loop);
			addEventListener(Event.REMOVED_FROM_STAGE, removeSelf);
        }
 
        public function loop(e:Event):void {
            if ((flip%2) == 1){
                x += xSpeedConst;
            } else if((flip%2) == 0){
                x += (-xSpeedConst);

            }
        }
 
        public function removeSelf(e:Event = null):void {
            trace("remove enemy");
            removeEventListener(Event.ENTER_FRAME, loop);
			removeEventListener(Event.REMOVED_FROM_STAGE, removeSelf);
            this.parent.removeChild(this);
        }
        public function changeDirection():void{
			scaleX = -scaleX;
            //trace("x ="+x);
            flip++;
        }
    }
}