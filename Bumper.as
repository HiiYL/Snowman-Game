package {
    import flash.display.MovieClip;
    import flash.events.Event;
    public class Bumper extends MovieClip{
 
        public function Bumper(xLocation:int, yLocation:int) {
            // constructor code
            x = xLocation;
            y = yLocation;
 
            addEventListener(Event.ENTER_FRAME, bumperloop);
        }
 
        public function bumperloop(e:Event):void{
            //code here
        }
    }
}