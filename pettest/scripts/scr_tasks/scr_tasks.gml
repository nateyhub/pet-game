enum TaskProgress {
	NOT_STARTED,
	IN_PROGRESS,
	COMPLETED	
}

enum DialogueStage {
	INTRO,
	DETAILS,
	IN_PROGRESS,
	COMPLETED,
	POST_COMPLETION
}

enum Emotion {
	NEUTRAL,
	HAPPY,
	SAD,
	ANGRY
}

global.tasks = 
{
	"lost_cat": {
	    "title": "Find the neighbour's lost cat",
	    "description": "Your neighbour has lost their brand new cat. Last seen at central park. Find their cat and bring it back to them.",
		"status": TaskProgress.NOT_STARTED,
		"dialogue_stage": DialogueStage.INTRO,
	    "dialogue": {
		    "intro": [
		        {
			        "speaker": "Mary",
			        "expression": Emotion.SAD,
			        "text": "Help, please help! I've lost my dearest cat"
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.SAD,
			        "text": "It's all my fault... I left the door open while putting out the trash and she ran out!"
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.SAD,
			        "text": "I've been worried sick for days. I just got her last week and hadn't found the time to buy a collar."
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.SAD,
			        "text": "Do you think you can find her for me?"
		        }
		    ],
		    "details": [
		        {
			        "speaker": "Player",
			        "expression": Emotion.HAPPY,
			        "text": "Woof!"
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.HAPPY,
			        "text": "Thanks! You know what they say - two heads are better than one! Even if one of them belongs to a dog..."
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.NEUTRAL,
			        "text": "Yesterday, while grabbing groceries, I thought I saw her at roaming around the park..."
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.SAD,
			        "text": "But before I could get to her she disappeared in the bushes!"
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.NEUTRAL,
			        "text": "I guess that would be a good place to start."
		        }
		    ],
		    "in_progress": [
		        {
			        "speaker": "Mary",
			        "expression": Emotion.NEUTRAL,
			        "text": "Have you found my cat yet?"
		        }
		    ],
		    "completed": [
		        {
			        "speaker": "Mary",
			        "expression": Emotion.HAPPY,
			        "text": "There she is! I was starting to think I would never see her again!"
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.HAPPY,
			        "text": "Thank you so much! I know it's not much, but hopefully this makes up for your efforts."
		        },
		        {
			        "speaker": "Player",
			        "expression": Emotion.HAPPY,
					"text": "Woof!"
		        }
		    ],
		    "post_completion": [
		        {
			        "speaker": "Mary",
			        "expression": Emotion.HAPPY,
			        "text": "Great day for a trip to the park!"
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.HAPPY,
			        "text": "My cat has been doing great lately."
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.SAD,
			        "text": "Mother doesn't really like my cat."
		        },
		        {
			        "speaker": "Mary",
			        "expression": Emotion.HAPPY,
			        "text": "I have no friends but at least I have my cat!"
		        }
		    ]
	    },
	    "objectives": {
			"cat_found": false
	    },
	    "reward": {
		    "coins": 100,
		    "items": []
		}
	},
}