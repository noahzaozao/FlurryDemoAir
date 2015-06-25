package
{
    import com.freshplanet.nativeExtensions.Flurry;
    
    import flash.desktop.NativeApplication;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.utils.getTimer;
    
    public class FlurryDemo extends Sprite
    {
        private var currentFrame:int;
        
        public function FlurryDemo()
        {
            super();
            
            // 支持 autoOrient
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            addEventListener(Event.ADDED_TO_STAGE, onAddToStageHandler);
            NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, onActiveHandler);
            NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, onDeactiveHandler);
        }
        
        protected function onActiveHandler(e:Event):void
        {
            Flurry.getInstance().startSession();
        }        
        
        protected function onDeactiveHandler(e:Event):void
        {
            Flurry.getInstance().stopSession();
        }
        
        protected function onAddToStageHandler(e:Event):void
        {
            Flurry.getInstance().setIOSAPIKey("KRMJY5F2GPXXTBN65FR9");
            Flurry.getInstance().setAndroidAPIKey("S6NRW2DT77XG428PTD4V");
            Flurry.getInstance().startSession();
            stage.addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
        }
        
        protected function onEnterFrameHandler(e:Event):void
        {
            if(currentFrame++ % 200 == 0)
            {
                Flurry.getInstance().logEvent("log event");
                trace("log event");
            }
        }
    }
}