package {
    import flash.display.MovieClip;
    import flash.events.Event;
    public class Bumper extends MovieClip{
 
        public function Bumper(xLocation:int, yLocation:int) {
            // constructor code
            x = xLocation;
            y = yLocation;
 
            addEventListener(Event.ENTER_FRAME, loop);
			addEventListener(Event.REMOVED_FROM_STAGE, removeSelf);
        }
 
        public function loop(e:Event):void{
            //code here
        }
		public function removeSelf(e:Event):void {
			trace("remove self");
			removeEventListener(Event.ENTER_FRAME, loop); //stop the loop
			removeEventListener(Event.REMOVED_FROM_STAGE, removeSelf);
			this.parent.removeChild(this); //tell this object's "parent object" to remove this object
			//in our case, the parent is the background because in the main code we said: back.addChild(bullet);
		}
    }
}