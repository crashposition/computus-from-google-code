# The Computus Engine #
## Exploring Space and Time with Flash and Actionscript 3 ##

This is the code repository for [The Computus Engine](http://www.computus.org) - a project exploring digital horology. All the source code here is written in Actionscript 3 and is made available under the open source [MIT Licence](http://www.opensource.org/licenses/mit-license.php). The journal for the project can be found at http://www.computus.org/journal .

The eventual aim of the project is to build a web application for the interactive exploration of space and time. All of the code found here form part of that project. For more information about the overall structure check out the [The Computus Engine web site](http://www.computus.org/journal/?p=1294).

#### STAR: Space Time Actionscript Resource ####
```
org.computus.star```
This is very much a work in progress. The STAR project is an attempt to create a unified spacetime framework that can store data about events, in any location, at any point in time. Due to the complexity of this project it also has associated FlexUnit unit tests.
[project journal entries](http://www.computus.org/journal/?cat=65)

#### Timekeeper: Accurate timekeeping for the Adobe Flash Player ####
```
org.computus.utils.timekeeper ```
Neither the ENTER\_FRAME event nor the Timer class keep accurate time in the Adobe Flash Player. This project codenamed _Harrison_ fixes the problem of isochronism by producing reliable tick events to within 0.1 seconds. Other features include a variable tick duration and period. Unlike the timers found in most AS3 tweening systems the Timekeeper class favours accuracy over speed.
[project home page](http://www.computus.org/journal/?page_id=869) , [project journal entries](http://www.computus.org/journal/?cat=62)

#### BaseComponent: Simple base class for user interface components in AS3 ####
```
org.computus.ui.core.BaseComponent ```
This base class codenamed _Da Vinci_ grew out of a series of journal entries about designing a component architecture in Flash. It elegantly solves the problem of garbage collection by enforcing the initialisation and destruction of components when they are added to or removed from the DisplayList. It also offers offers a simple system to buffer redraw requests.
[project home page](http://www.computus.org/journal/?page_id=877) , [project journal entries](http://www.computus.org/journal/?cat=61)

#### Preloader: Animated Preloader for Flash and AS3 ####
```
org.computus.ui.utils.Preloader ```
A simple animated preloader for Flash projects.
[project journal entry](http://www.computus.org/journal/?p=18)
