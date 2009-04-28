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
	
	/**
	 * The MainPreloader class is used to manage an animated preloader in Flash. 
	 * You can put any graphics you like in the ProgressGraphic so long as it has 100 frames.
	 *
	 * <p>Your FLA should be configured as follows:
	 * <ul><li>Set the Document Class of your Flash FLA to: org.computus.utils.preloader.MainPreloader.as </li>
	 * <li>Actionscript classes should be set to export in frame 2.</li>
	 * <li>'Automatically declare stage instances.' in the AS3 Settings menu should be set to off.</li>
	 * <li>Create a MovieClip and give it a linkage id of 'ProgressGraphic'. It should have 100 frames of animation and should contain a stop() command on frame 1.</li></ul></p>
  	 */
	
	public class MainPreloader extends MovieClip
	{

	// ------------------------------------------
	// PROPERTIES

		/**
		* An instance of the ProgressGraphic. This graphic is displayed in the centre of the screen whilst the main SWF loads.
		*/
		public var preloader:MovieClip		// ProgressGraphic indicator animation
		
	// ------------------------------------------
	// CONSTRUCTOR

		/**
		 * Creates a new instance of the MainPreloader() class.
		 */
		public function MainPreloader():void
		{
			super();
			init();
		}
		
	// ------------------------------------------
	// MEMORY MANAGEMENT
		
		/**
		 * Initialises the stage and the preloader.
		 */
		protected function init():void
		{
			// stop main timeline
			stop();
			
			// fix and track Stage size
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// check load progress
			if ( this.loaderInfo.bytesLoaded == this.loaderInfo.bytesTotal )
			{
				// Main SWF loading is complete.
				onMainLoaded()
			}
			else
			{
				// Main SWF is still loading.
				
				// add preloader graphic if one is not already on screen
				if ( ! preloader ) 
				{
					preloader = new ProgressGraphic()
					addChild( preloader )
				}
	
				// Centre progress animation on screen
				centreProgressBar();
				
				stage.addEventListener(Event.ACTIVATE, onStageResize);
				stage.addEventListener(Event.RESIZE, onStageResize);
				this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, onMainLoadProgress);
			}
		}
		
		/**
		 * Removes all listeners and prepares the class for disposal.
		 */
		protected function destroy():void
		{
			// clean up listeners
			this.loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onMainLoadProgress);
			stage.removeEventListener(Event.ACTIVATE, onStageResize);
			stage.removeEventListener(Event.RESIZE, onStageResize);
		}

	// ------------------------------------------
	// EVENTS

		/**
		* @private
		*/
		protected function onStageResize(e:Event):void
		{
			centreProgressBar();
		}
		
		/**
		* @private
		*/
		protected function onMainLoadProgress(e:ProgressEvent):void
		{
			// Get progress as a percentage. You can use this value if you need to display text
			var percent:Number = Math.round((e.bytesLoaded / e.bytesTotal )*100 );

			// check for load complete
			if (e.bytesLoaded == e.bytesTotal )	
			{
				removeChild(preloader);
				onMainLoaded() 
			}
			
			// update preloader
			preloader.gotoAndStop( percent )
		}

		/**
		* @private
		*/
		protected function onMainLoaded():void
		{
			destroy();
			play()
		}
		
	// ------------------------------------------
	// POSITION

		/**
		* centers the ProgressGraphic in the middle of the screen.
		*/
		protected function centreProgressBar():void
		{
			preloader.x = stage.stageWidth / 2;
			preloader.y = stage.stageHeight / 2;
		}
	}
}