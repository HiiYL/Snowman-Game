package {
    import flash.display.MovieClip;
    import flash.events.Event;public class Enemy extends MovieClip {
 
        private var xSpeedConst:int = 2;
        private var flip:int = 1;
 
        public function Enemy(xLocation:int, yLocation:int) {
            // constructor code
            x = xLocation;
            y = yLocation;
            addEventListener(Event.ENTER_FRAME, loop);
        }
 
        public function loop(e:Event):void {
            if ((flip%2) == 1){
                x += xSpeedConst;
            } else if((flip%2) == 0){
                x += (-xSpeedConst);

            }
        }
 
        public function removeSelf():void {
            trace("remove enemy");
            removeEventListener(Event.ENTER_FRAME, loop);
            this.parent.removeChild(this);
        }
 
        public function changeDirection():void{
			scaleX = -scaleX;
            trace("x ="+x);
            flip++;
        }
    }
}