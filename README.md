# finalproj
<b>
Team Yuniclo -- Nicole Cheng & Yuki (Yuxuan) Chen <br>
Period 7<br>
<br>
Mission Gnocchi<br>
<br>
Project description:</b><br>
You are put into the shoes of a secret agent tasked with the diffcult mission of unlocking an enemy computer to unlock sensitive information.<br>
<br>
<b>To compile/run:</b><br>
The G4P library is needed for the passcode functions to work.<br> 
The Minim (2.2.2) library is needed for the audio.<br>
To run, open the file up in processing and press run.<br>
<br>
How to use it:
Upon running the program, you are prompted to complete a tutorial, in which you click the mouse to move to the next scene. 
At one of the tutorial scenes, you are able to fill out a certificate of authenticity to become a secret agent.
Your mission is given to you in a message from Agent P -- you must unlock an enemy computer. 
Once you complete the tutorial, you will see an interactive desktop simulation. 
You can click on the folder icons and open up files and games.
Some folders / files / games require a secret passcode, which can be obtained from winning a game.
After unlocking the final file, you will receive a final message from the owner of the computer -- woah!

Changelog:
- January 20:
	- Nicole:
            - bug fix: hangman no longer lets you restart the game every time the mouse is clicked
			- bug fix: password at the end of hangman is given
			- new feature (ish) : "click to continue" message of the hangman congrats page is no longer just for show
			- bug found: when hangman is lost, winning the restarts doesn't give you the congratulatory page
			- bug fix: ^fixed
			- bug found: congrats page doesn't come when game is exited and reopened
				- maybe we should get rid of the exit button -- it's kind of unnecessary
			- bug fix: ^ removed, and working now
			- bug found: pressing on an incorrect letter multiple times takes away chances
			- bug fix: ^ fixed that
	- Yuki:
			- start of passwords
				- cannot use certain symbols
				- not "entering"
			- bug fix: hangman congrats page now working
			- new feature: reinserted retry and quit buttons, which now work
			
- January 21:
			- bug found: mouseClicks is not working
			- new feature: text boxes for certificate
			- to-do: fix scene transition; text box positioning
			- merged folders to HelloWorld and MissionGnocchi2
	- Nicole:
			- bug found: word solved is not triggering
			- scene changes are not triggering either
			- bug found: text boxes on certificate are not registering and storing
			- bug fix: ^ fixed
	- Yuki:
			- textfields inserted
			- new breakthrough: folder passwords can be used!
- January 22:
	- Nicole:
			- bug fix: scene changes and environ changes are registering with mouseClicks
			- bug fix: the text boxes are recognized as filled in, letting the tutorial go on
	- Yuki:
			- bug fix: optimized scene / environ changes with keyPressed()
			- invisible text boxes now
- January 23:
	- Nicole:
			- creating a third game -- similar to geometry dash
			- this is the "boss level", so it'll have a cover page and an instructions page
			- intro page to the game looks nice
			- instructions page is coming along
	- Yuki:
			- Add background music into project
			- Background music changes according to different setting
			- Transitioning between scenes

- January 24:
	- Nicole:
			- Dashing Geometry: title page and instructions page complete
			- bug found: looping background has glitches
			- bug fix: ^ fixed
			- new feature: cute little red panda character with left and right-facing positions
			- new feature: shape bullets shooting
			- new feature: hp, steps, and remaining bullets stats on screen
			- game is fully-functioning, i believe
 	- Yuki :
			- Finalizing the way background music is played
			- create another folder to contain new game GeoDash
			- Add new scene/final scene
			- Wrote very cheesy script for character
			- Still need to fix some bug with final scene
			- Still need to complete the "minimize" and "maximize" functions for windows
- January 25:
	- Nicole:
			- combined HelloWorld2 and GeoDash into HelloWorld3
			- reorganized tabs for clarity
			- to do: password on congrats page for GeoDash and a click anywhere or press any key thing to go back to desktop
			- ^item completed
			- to do: grammar issues in finale