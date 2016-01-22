# finalproj
Team Yuniclo -- Nicole Cheng & Yuki (Yuxuan) Chen
Period 7

Mission Gnocchi

Project description:
You are put into the shoes of a secret agent tasked with the diffcult mission of unlocking an enemy computer to unlock sensitive information.

To compile/run:
The G4P library is needed for the passcode functions to work. To run, open the file up in processing and press run.

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
			
-January 21:
			- bug found: mouseClicks is not working
			- new feature: text boxes for certificate
			- to-do: fix scene transition; text box positioning
			- merged folders to HelloWorld and MissionGnocchi2