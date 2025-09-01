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

global.tasks = 
{
	"lost_cat":
	{
	    "title": "Find the neighbour's lost cat",
	    "description": "Your neighbour has lost their brand new cat. Last seen at central park. Find their cat and bring it back to them.",
	    "status": TaskProgress.NOT_STARTED,
		"dialogue_stage": DialogueStage.INTRO,
	    "dialogue": {
		    "intro": [
		        "Help, please help! I've lost my dearest cat!",
		        "It's all my fault... I left the door open while putting out the trash and she ran out!",
				"I've been worried sick for days. I just got her last week and hadn't found the time to buy a collar.",
		        "Do you think you can find her?"
		    ],
		    "details": [
				"Yesterday, while grabbing groceries, I thought I saw her at roaming around the park...",
				"But before I could get to her she disappeared in the bushes!",
				"I guess that would be a good place to start."],
		    "in_progress": ["Have you found my cat yet?"],
		    "completed": [
				"There she is! I was starting to think I would never see her again!",
				"Thank you so much! I know it's not much, but hopefully this makes up for your efforts."
				],
		    "post_completion": [
				"Great day for a trip to the park!",
				"My cat has been doing great lately.",
				"Mother doesn't really like my cat.",
				"I have no friends but at least I have my cat!",
				"I'm thinking of buying a fursuit to match with my cat... is that weird?",
				"The house feels alive again now that my cat's back.",
				"She keeps knocking things off the table - it's like nothing changed!",
				"I should probably get her a collar this time...",
				"I've started keeping the windows closed, just in case...",
				"Thanks again! I still can't believe you actually found her.",
				"I caught her sleeping in the laundry basket yesterday! Silly cat...",
				"Every time I hear a meow outside I panic now!",
				"I've been buying more treats than usual to spoil her.",
				"She's already forgotten the whole ordeal... wish I could too!",
				"The neighbours keep asking me how I lost her. So embarrassing...",
				"I feel like I owe you one. If you ever need help, let me know.",
				"I think she likes you more than me now!"
		    ]
	    },
	    "requirements": {
			"find_item": "obj_cat"
	    },
	    "reward": {
			"coins": 100,
			"items": []
	    }
	}
}

if global.tasks.lost_cat.status == TaskProgress.NOT_STARTED {
	show_debug_message("{0} not started",  global.tasks.lost_cat.title)
}