-- Random Sentence/Story Demo
-- Chelsea Thompto

-- variable for current sentence, starts at 1
currentSentence = 1

-- arrays for each story, you can add or subtract sentences as needs
storyOne = {"Story 1 sentence one.",
  "Story 1 sentence two.",
  "Story 1 sentence three.",
  "Story 1 sentence four.",
  "Story 1 sentence five."}
storyTwo = {"Story 2 sentence one.",
  "Story 2 sentence two.",
  "Story 2 sentence three.",
  "Story 2 sentence four.",
  "Story 2 sentence five."}
storyThree = {"Story 3 sentence one.",
  "Story 3 sentence two.",
  "Story 3 sentence three.",
  "Story 3 sentence four.",
  "Story 3 sentence five."}
storyFour = {"Story 4 sentence one.",
  "Story 4 sentence two.",
  "Story 4 sentence three.",
  "Story 4 sentence four.",
  "Story 4 sentence five."}
-- array of all stories, this holds all the stories together
storyArray = {storyOne,storyTwo,storyThree,storyFour}

require("L5")

function setup()
  size(400, 400)
  windowTitle("Random Sentence/Story Demo")
  describe('Black text on light grey.')

  -- set default visuals
  background(200)
  fill(0)
  textAlign(CENTER)
  textSize(20)

  -- pick a random story to start
  currentStory = random(storyArray)

  -- draw the first line of the story
  text(currentStory[currentSentence], width/2,height/2)
end

-- advance story with mouse click
function mousePressed()
  -- move to next sentence
  currentSentence = currentSentence+1
  -- check to see if number is at the end of the 
  -- story and pick new story and reset if needed
  if currentSentence > #currentStory then
    currentSentence = 1
    currentStory = random(storyArray)
  end

  -- draw background and new setence
  background(200)
  text(currentStory[currentSentence], width/2,height/2)

end