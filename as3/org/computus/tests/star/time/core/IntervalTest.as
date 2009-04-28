/*	
	====================================================================================
	2009 | John Dalziel  | The Computus Engine  |  http://www.computus.org

	All source code licenced under The MIT Licence
	====================================================================================  
	Units Tests for S.T.A.R. Space Time Actionscript Repository
*/
package org.computus.tests.star.time.core
{
	import flexunit.framework.TestCase;
	
	import org.computus.star.time.core.Interval;
	import org.computus.star.time.core.Instant;
    
    public class IntervalTest extends TestCase
    {
    	
		public function testConstructor():void 
		{
 			// empty params
 			var now:Date 	= new Date()
 			var d:Interval	= new Interval()
 			assertTrue( "new Interval() sets start time to the current time in ms", d.start.time >= now.time )
 			assertTrue( "new Interval() sets end time to the current time in ms", d.end.time >= now.time )
 			assertTrue( "new Interval() sets duration to 0 ms", d.duration == 0 )
 
 
  			// single Number param
			d = new Interval( 1000 )
 			assertTrue( "new Interval(1000) sets start time to the current time in ms", d.start.time == 1000 )
 			assertTrue( "new Interval(1000) sets end time to the current time in ms", d.end.time == 1000 )
 			assertTrue( "new Interval(1000) sets duration to 0 ms", d.duration == 0 )
 			
   			// double Number param
			d = new Interval( 1000, 3000 )
 			assertTrue( "new Interval(1000, 3000) sets start time to 1000", d.start.time == 1000 )
 			assertTrue( "new Interval(1000, 3000) sets end time to 3000", d.end.time == 3000 )
 			assertTrue( "new Interval(1000, 3000) sets duration to 2000 ms", d.duration == 2000 )

   			// double Number param ( switch start and end )
			d = new Interval( 3000, 1000 )
 			assertTrue( "new Interval(3000, 1000) sets start time to 1000", d.start.time == 1000 )
 			assertTrue( "new Interval(3000, 1000) sets end time to 3000", d.end.time == 3000 )
 			assertTrue( "new Interval(3000, 1000) sets duration to 2000 ms", d.duration == 2000 )


  			// single String param
			d = new Interval( "1000" )
 			assertTrue( "new Interval('1000') sets start time to the current time in ms", d.start.time == 1000 )
 			assertTrue( "new Interval('1000') sets end time to the current time in ms", d.end.time == 1000 )
 			assertTrue( "new Interval('1000') sets duration to 0 ms", d.duration == 0 )
 			
   			// double String param
			d = new Interval( "1000", "3000" )
 			assertTrue( "new Interval('1000', '3000') sets start time to 1000", d.start.time == 1000 )
 			assertTrue( "new Interval('1000', '3000') sets end time to 3000", d.end.time == 3000 )
 			assertTrue( "new Interval('1000', '3000') sets duration to 2000 ms", d.duration == 2000 )

  			// double String param ( switch start and end )
			d = new Interval( "3000", "1000" )
 			assertTrue( "new Interval('3000', '1000') sets start time to 1000", d.start.time == 1000 )
 			assertTrue( "new Interval('3000', '1000') sets end time to 3000", d.end.time == 3000 )
 			assertTrue( "new Interval('3000', '1000') sets duration to 2000 ms", d.duration == 2000 )


  			// single Date param
   			var d1:Date = new Date(5000)
   			var d2:Date = new Date(7000)
			d = new Interval( d1 )
 			assertTrue( "new Interval(Date) sets start time to the current time in ms", d.start.time == 5000 )
 			assertTrue( "new Interval(Date) sets end time to the current time in ms", d.end.time == 5000 )
 			assertTrue( "new Interval(Date) sets duration to 0 ms", d.duration == 0 )
 			
   			// double Date param
			d = new Interval( d1, d2 )
 			assertTrue( "new Interval(Date1, Date2) sets start time to 1000", d.start.time == 5000 )
 			assertTrue( "new Interval(Date1, Date2) sets end time to 3000", d.end.time == 7000 )
 			assertTrue( "new Interval(Date1, Date2) sets duration to 2000 ms", d.duration == 2000 )

   			// double Date param ( switch start and end )
			d = new Interval( d2, d1 )
 			assertTrue( "new Interval(Date2, Date1) sets start time to 1000", d.start.time == 5000 )
 			assertTrue( "new Interval(Date2, Date1) sets end time to 3000", d.end.time == 7000 )
 			assertTrue( "new Interval(Date2, Date1) sets duration to 2000 ms", d.duration == 2000 )


  			// single Instant param
   			var d3:Instant = new Instant(5000)
   			var d4:Instant = new Instant(7000)
			d = new Interval( d3 )
 			assertTrue( "new Interval(Instant) sets start time to the current time in ms", d.start.time == 5000 )
 			assertTrue( "new Interval(Instant) sets end time to the current time in ms", d.end.time == 5000 )
 			assertTrue( "new Interval(Instant) sets duration to 0 ms", d.duration == 0 )
 			
   			// double Instant param
			d = new Interval( d3, d4 )
 			assertTrue( "new Interval(Instant1, Instant2) sets start time to 1000", d.start.time == 5000 )
 			assertTrue( "new Interval(Instant1, Instant2) sets end time to 3000", d.end.time == 7000 )
 			assertTrue( "new Interval(Instant1, Instant2) sets duration to 2000 ms", d.duration == 2000 )

  			// double Instant param ( switch start and end )
			d = new Interval( d4, d3 )
 			assertTrue( "new Interval(Instant2, Instant1) sets start time to 1000", d.start.time == 5000 )
 			assertTrue( "new Interval(Instant2, Instant1) sets end time to 3000", d.end.time == 7000 )
 			assertTrue( "new Interval(Instant2, Instant1) sets duration to 2000 ms", d.duration == 2000 )

   			// unrecognised param
		//	d = new Instant( new Point(0,0) )
		}	
		
		public function testValueOf():void 
		{
			var d:Interval = new Interval( 1000, 3000 )
			assertTrue( "Interval.valueOf() returns a Number", d.valueOf() is Number )
 			assertTrue( "Interval.valueOf() returns 2000", d.valueOf() == 2000 )
 		}
		
		public function testToString():void 
		{
			var d:Interval = new Interval( 1000, 3000 )
			assertTrue( "Interval.toString() returns a String", d.toString() is String )
 			assertTrue( "Interval.toString() returns '2000'", d.toString() == "2000" )
 		}
 		
		public function testDuration():void 
		{
			var d:Interval = new Interval( 1000, 3000 )
   			
 			// test get duration
  			assertTrue( ".duration returns a Number", d.duration is Number )
 			assertTrue( ".duration returns 2000", d.duration == 2000 )
 
 			// test set duration
  			d.duration = 5000
 			assertTrue( ".duration == 5000 returns 5000", d.duration == 5000 )	
 			assertTrue( ".duration == 5000 start == 1000", d.start.time == 1000 )	
 			assertTrue( ".duration == 5000 end == 6000", d.end.time == 6000 )
 			
 			// test negative numbers
			d = new Interval( -1000, 3000 )
 			assertTrue( "negative .duration returns 4000", d.duration == 4000 )
 			d = new Interval( -3000, -2000 )
 			assertTrue( "negative .duration returns 1000", d.duration == 1000 )
			d = new Interval( -5000, 5000 )
 			assertTrue( "negative .duration returns 10000", d.duration == 10000 )
			d = new Interval( 5000, -5000 )
 			assertTrue( "negative .duration returns 10000", d.duration == 10000 )
 		}

		public function testStartAndEnd():void
		{
			var d:Interval = new Interval( 1000, 3000 )
			d.start.time = 2000
 			assertTrue( "start.time = 2000", d.start.time == 2000 )	
 			assertTrue( "start.time = 2000, duration == 1000", d.duration == 1000 )

			d.end.time = 4000
 			assertTrue( "end.time = 4000", d.end.time == 4000 )	
 			assertTrue( "end.time = 4000, duration == 2000", d.duration == 2000 )
 			
			// invert start and end
			d.start.time = 10000
 			assertTrue( "start.time = 10000, start.time == 2000", d.start.time == 4000 )	
 			assertTrue( "start.time = 10000, end.time == 10000", d.end.time == 10000 )	
 			assertTrue( "start.time = 10000, duration == 8000", d.duration == 6000 )
			
			// invert end and start
			d.end.time = 0
 			assertTrue( "end.time = 0, d.start.time == 1000", d.start.time == 0 )	
 			assertTrue( "end.time = 0, d.end.time == 4000", d.end.time == 4000 )	
 			assertTrue( "end.time = 0, duration == 4000", d.duration == 4000 )
 			
 			// Negative tests
			d.start.time = -5000
 			assertTrue( "start.time = -5000, duration == 9000", d.duration == 9000 )
			d.end.time = -2000
 			assertTrue( "start.time = -2000, duration == 3000", d.duration == 3000 )
			d.start.time = -1000
 			assertTrue( "start.time = -1000, duration == 1000", d.duration == 1000 )
			d.start.time = 1000
 			assertTrue( "start.time = -1000, duration == 2000", d.duration == 2000 )
		}
		
		public function testMoveStart():void
		{
			var d:Interval = new Interval( 2000, 5000 )
			d.moveStart( 1000 )
 			assertTrue( "d.moveStart( 1000 ), start.time == 1000", d.start.time == 1000 )	
 			assertTrue( "d.moveStart( 1000 ), end.time == 4000", d.end.time == 4000 )	
 			assertTrue( "d.moveStart( 1000 ), duration == 3000", d.duration == 3000 )
 			
 			// Negative tests
			d.moveStart( -1000 )
 			assertTrue( "d.moveStart( -1000 ), start.time == -1000", d.start.time == -1000 )	
 			assertTrue( "d.moveStart( -1000 ), end.time == 2000", d.end.time == 2000 )	
 			assertTrue( "d.moveStart( -1000 ), duration == 3000", d.duration == 3000 ) 			
			d.moveStart( -5000 )
 			assertTrue( "d.moveStart( -5000 ), start.time == -5000", d.start.time == -5000 )	
 			assertTrue( "d.moveStart( -5000 ), end.time == -2000", d.end.time == -2000 )	
 			assertTrue( "d.moveStart( -5000 ), duration == 3000", d.duration == 3000 ) 			
		}

		public function testMoveEnd():void
		{
			var d:Interval = new Interval( 1000, 5000 )
			d.moveEnd( 7000 )
 			assertTrue( "d.moveEnd( 7000 ), start.time == 3000", d.start.time == 3000 )	
 			assertTrue( "d.moveEnd( 7000 ), end.time == 7000", d.end.time == 7000 )	
 			assertTrue( "d.moveEnd( 7000 ), duration == 4000", d.duration == 4000 )			
 			
 			// Negative tests
			d.moveEnd( -7000 )
 			assertTrue( "d.moveEnd( -7000 ), start.time == -3000", d.start.time == -11000 )	
 			assertTrue( "d.moveEnd( -7000 ), end.time == -7000", d.end.time == -7000 )	
 			assertTrue( "d.moveEnd( -7000 ), duration == 4000", d.duration == 4000 )			
 			
		}
 		
 		public function testDestroy():void
 		{
			var d:Interval = new Interval( 2000, 4000 )
			assertTrue( "destroy() d.start.time = 2000", d.start.time == 2000 )	
			d.destroy()
			assertTrue( "destroy() d.start = null", d.start == null )	
			assertTrue( "destroy() d.end = null", d.end == null )	
 		}
    }
}
