/*	
	====================================================================================
	2009 | John Dalziel  | The Computus Engine  |  http://www.computus.org

	All source code licenced under The MIT Licence
	====================================================================================  
	
	Animated Main Preloader
	- Centred on screen
*/

package org.computus.utils.preloader
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.*;

	public class MainPreloader extends MovieClip
	{

	// ------------------------------------------
	// PROPERTIES

		public var preloader:ProgressGraphic	// progress indicator animation
		
	// ------------------------------------------
	// CONSTRUCTOR

		public function MainPreloader():void
		{
			super();
			init();
		}
		
	// ------------------------------------------
	// MEMORY MANAGEMENT
		
		protected function init():void
		{
			// stop main timeline
			stop();

			// add preloader graphic if one is not already on screen
			if ( ! preloader ) { addChild( preloader = new ProgressGraphic() )}
			
			// track load progress
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, onMainLoadProgress);

			// fix and track Stage size
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.ACTIVATE, onStageResize);
			stage.addEventListener(Event.RESIZE, onStageResize);

			// Centre progress animation on screen
			centreProgressBar();
		}
		
		protected function destroy():void
		{
			// clean up listeners
			this.loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onMainLoadProgress);
			stage.removeEventListener(Event.ACTIVATE, onStageResize);
			stage.removeEventListener(Event.RESIZE, onStageResize);
			removeChild(preloader);
		}

	// ------------------------------------------
	// EVENTS

		protected function onStageResize(e:Event):void
		{
			centreProgressBar();
		}
		
		protected function onMainLoadProgress(e:ProgressEvent):void
		{
			// Get progress as a percentage. You can use this value if you need to display text
			var percent:Number = Math.round((e.bytesLoaded / e.bytesTotal )*100 );

			// check for load complete
			if (e.bytesLoaded == e.bytesTotal )	{ onMainLoaded() }
			
			// update preloader
			preloader.gotoAndStop( percent )
		}

		protected function onMainLoaded():void
		{
			destroy();
			play()
		}
		
	// ------------------------------------------
	// POSITION

		protected function centreProgressBar()
		{
			preloader.x = stage.stageWidth / 2;
			preloader.y = stage.stageHeight / 2;
		}
	}
}