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
	
	import org.computus.star.time.core.Instant;
    
    public class InstantTest extends TestCase
    {
    	
		public function testParse():void 
		{
			var n:Number = Instant.parse("1000")
			assertTrue( "parse(1000) returns a Number", n is Number )
 			assertTrue( "Instant.parse( '1000' ) returns 1000", n == 1000 )
 		}

		public function testConstructor():void 
		{
 			// empty params
 			var now:Date 	= new Date()
 			var d:Instant	= new Instant()
 			assertTrue( "new Instant() sets time to the current time in ms", d.time >= now.time )
  			
  			// Number param
			d = new Instant( 1000 )
 			assertTrue( "new Instant(1000) sets time to 1000 ms", d.time == 1000 )
			d = new Instant( -1000 )
 			assertTrue( "new Instant(1000) sets time to -1000 ms", d.time == -1000 )
   			
   			// String param
			d = new Instant( "2000" )
			assertTrue( "new Instant('2000') sets time to 2000 ms", d.time == 2000 )
			d = new Instant( "-2000" )
			assertTrue( "new Instant('-2000') sets time to -2000 ms", d.time == -2000 )
			   			
   			// Date param
   			var d1:Date = new Date(2000,0,1)
			d = new Instant( d1 )
			assertTrue( "new Instant( new Date(2000,0,1) ) sets time to 1.1.2000", d.time == d1.time )

   			// Instant param
   			var d2:Instant = new Instant(3000)
			d = new Instant( d2 )
			assertTrue( "new Instant( new Instant(3000) ) sets time to 3000 ms", d.time == d2.time )
 			
   			// unrecognised param
		//	d = new Instant( new Point(0,0) )
		}	

		public function testValueOf():void 
		{
			var d:Instant = new Instant( 1000 )
			assertTrue( "Instant.valueOf() returns a Number", d.valueOf() is Number )
 			assertTrue( "Instant.valueOf() returns 1000", d.valueOf() == 1000 )
			
			d = new Instant( -1000 )
			assertTrue( "Instant.valueOf() returns a Number", d.valueOf() is Number )
 			assertTrue( "Instant.valueOf() returns -1000", d.valueOf() == -1000 )
 		}

		public function testToString():void 
		{
			var d:Instant = new Instant( 1000 )
			assertTrue( "Instant.toString() returns a String", d.toString() is String )
 			assertTrue( "Instant.toString() returns '1000'", d.toString() == "1000" )

			d = new Instant( -1000 )
			assertTrue( "Instant.toString() returns a String", d.toString() is String )
 			assertTrue( "Instant.toString() returns '-1000'", d.toString() == "-1000" )
 		}

		public function testNow():void 
		{
 			var nowDate:Number		= new Date().time
 			var nowInstant:Number	= Instant.now()
			assertTrue( "Instant.now() returns a Number", nowInstant is Number )
 			assertTrue( "Instant.now() returns the current time in ms", nowInstant >= nowDate )
		}
		
		public function testTime():void 
		{
   			var d:Instant = new Instant(1000)
   			
 			// test get time
  			assertTrue( ".time returns a Number", d.time is Number )
 			assertTrue( ".time returns 1000", d.time == 1000 )
 
 			// test set time
  			d.time = 2000
 			assertTrue( ".time returns 2000", d.time == 2000 )
  			d.time = -2000
 			assertTrue( ".time returns -2000", d.time == -2000 )
 		 			
 			// test addition
 			assertTrue( "d + 1000 == -1000", d + 1000 == -1000 )
 			// n.b subtraction, multiplication and division all generate errors
 			
 		}

    }
}
