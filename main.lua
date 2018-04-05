
--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

-------------------------------------------------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local numericField
local randomNumber1 = 0
local randomNumber2 = 0
local randomNumber3 = 0
local randomNumber4 = 0
local userAnswer
local correctAnswer = 0
local incorrectObject
local randomOperation = 0
local numericField
local score = 0
local answerDivision = 0
local SquareRoot
local clockText
local totalSeconds = 10
local secondsLeft = 10

local heart1
local heart2
local heart3
local lives = 3
 local incoorrectObject

--displays the timer
 clockText = display.newText("TimeLeft:" .. secondsLeft,500,600,nil,40)
clockText:setTextColor(155/255,180/255,1/255)

--displays the correctAnswer and makes it invisible
CorrectText = display.newText("" , display.contentWidth/4, display.contentHeight)
    CorrectText:setTextColor(155/255, 0/255, 0/255)
    CorrectText.isVisible = false

    local gameover = display.newImageRect("Images/gameover.png", 1999,1999) 
gameover.x = display.contentCenterX
gameover.y = display.contentCenterY
gameover.isVisible = false

--displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 35)
questionObject:setTextColor(155/255, 42/255, 198/255)


heart1 = display.newImageRect("Images/heart.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100,100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100,100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

local function updatehearts()
	if (lives == 3) then
	heart3.isVisible = true
	heart2.isVisible = true
	heart1.isVisible = true
end
	if (lives == 2) then
	heart3.isVisible = false
	heart2.isVisible = true
	heart1.isVisible = true
end
	if (lives == 1) then
	heart3.isVisible = false
	heart2.isVisible = false
	heart1.isVisible = true
end
if (lives == 0) then
	heart3.isVisible = false
	heart2.isVisible = false
	heart1.isVisible = false
    gameover.isVisible = true
end
end

-------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------
local function AskQuestion()

 -- program chooses a random number between 1-3
   randomOperation = math.random(1,5)
    
    --generate 2 random numbers between a max. and a min. number
    randomNumber1 = math.random(0, 25)
    randomNumber2 = math.random(0, 21)
    randomNumber3 = math.random(1, 10)
    randomNumber4 = math.random(1, 10)
    randomNumber5 = math.random(50,100)
    randomNumber6 = math.random(1,25)
    randomNumber7 = math.random(3,9)

    if (randomOperation == 1) then correctAnswer = randomNumber1 + randomNumber2
-- create question in text object
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end
   if (randomOperation == 2) then correctAnswer = randomNumber1 - randomNumber2
--create question in text object
  questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
end
  if ((correctAnswer < 0) and (randomOperation ==2 )) then
  	correctAnswer = randomNumber2 - randomNumber1
  	questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
end

if (randomOperation == 3) then correctAnswer = randomNumber3 * randomNumber4
--create question in text object
    questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "

end

if (randomOperation == 4) then answerDivision = randomNumber5 / randomNumber6
correctAnswer = math.ceil(answerDivision)
--creates the question in text object and changes the text for the Correct answer
CorrectText.text = "The correct answer is:" .. correctAnswer
questionObject.text =randomNumber5 .. " / " .. randomNumber6 .. " = "
end
if (randomOperation == 5) then SquareRoot = math.sqrt(randomNumber7)
	correctAnswer = math.ceil(SquareRoot)
	--creates the question in text object and changes the text for the correct answer
questionObject.text = " sqrt : " .. randomNumber7 .. " = "
CorrectText.text = "The correct answer is:" .. correctAnswer

end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectAnswer.isVisible = false
	AskQuestion()
end

--hides correctAnswer and asks a new queestion
local function HideCorrectAnswer()
	CorrectText.isVisible = false
end

--updates the timer so that seconds go down
local function UpdateTime()

--decrement the number of seconds
secondsLeft = secondsLeft - 1
clockText.text = ("TimeLeft:" .. secondsLeft)

if (secondsLeft == 0)

local function NumericFieldListener( event )

-- User begins editing "numericField"
if ( event.phase == "began") then

	--clear text field
	event.target.text = ""

elseif event.phase == "submitted" then

	--when the answer is submitted (enyer key is pressed) set user inout to user's answer
	userAnswer = tonumber(event.target.text)
end
	--if the users answer and the correct answer are the same:
	   if (userAnswer == correctAnswer) then
		   correctObject.isVisible = true
		   timer.performWithDelay(1000, HideCorrect)
        else lives = lives - 1
        updatehearts()
       incorrectAnswer.isVisisble = true
       timer.performWithDelay(1000,HideIncorrect)
    end
end
-------------------------------------------------------------------------------------------
--OBJECT CREATION
-------------------------------------------------------------------------------------------

--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

--Create numeric field
numericField = native.newTextField(500 ,350 , 150, 100 )
numericField.inputType = "number"

--create the correct text object and make it invisible
incorrectAnswer = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectAnswer:setTextColor(155/255, 42/255, 198/255)
incorrectAnswer.isVisible = false


--add the event listener for the numeric field
------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------

numericField:addEventListener( "userInput", NumericFieldListener)

  --call the function to ask the question
  AskQuestion()

local backgroundyouwin = display.newImageRect("Images/youwon1.gif", 1999,1999) 
backgroundyouwin.x = display.contentCenterX
backgroundyouwin.y = display.contentCenterY
backgroundyouwin.isVisible = false

