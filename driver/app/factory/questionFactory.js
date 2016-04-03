var app = angular.module('app');

app.factory('questionFactory', function () {
    var index = 0;
    var clone = [];


    var question = [
    {
        number: 1,
        image: '0001.jpg',
        question: "What is the road marking means?",
        options: ["Allowed to overtake from both sides", "No overtaking", "Stop", "None of the above"],
        answer: 0
    },
    {
        number: 2,
        image: '0002.jpg',
        question: "In the vehicle, are kids allowed to seat on the front seat?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 3,
        image: '0003.jpg',
        question: "What is the the road marking means ?",
        options: ["Stop Line", " End of the road", " Priority line", " Footpath"],
        answer: 0
    },

    {
        number: 4,
        image: '0004.jpg',
        question: "Kids of below 14 years must sit at the back seat ?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 5,
        image: '0005.jpg',
        question: "Children of 14  Years old must sit at the back seat ?",
        options: ["Yes", "No"],
        answer: 1
    },

    {
        number: 6,
        image: '0006.jpg',
        question: "While driving is it correct to use mobile phone ?",
        options: ["Wrong", "Right"],
        answer: 0
    },

    {
        number: 7,
        image: '0007.jpg',
        question: "Driving the vehicle under the influence of alcohol is against the law; why ?",
        options: ["More difficult for the driver to make safe judgment", "Give you a sense of false confidence", "Slows your reaction time in taking a safe action", "All of the above"],
        answer: 3
    },

    {
        number: 8,
        image: '0008.jpg',
        question: "Usage of mobile phone while driving is an offence as per Qatar traffic law?",
        options: ["Wrong", "Right"],
        answer: 1
    },

    {
        number: 9,
        image: '0009.jpg',
        question: "What do STOP LINE means?",
        options: ["Must Stop even if the road is clear", "Proceed with caution", "Have the right of way", "None of the above"],
        answer: 0
    },

    {
        number: 10,
        image: '0010.jpg',
        question: "While driving, under what circumstances should we use the sun- glasses?",
        options: ["When there is heavy rainfall", "When using the sun-roof", "When there’s bright sunlight", "None of the above"],
        answer: 2
    },

    {
        number: 11,
        image: '0011.jpg',
        question: "Are you allowed to drive-through on white cat’s eyes marker?",
        options: ["No", "Yes"],
        answer: 0
    },

    {
        number: 12,
        image: '0012.jpg',
        question: "What does the land mark shown mean?",
        options: ["Giveway line", "Stop line", "Pedestrian closing", "Parking"],
        answer: 0
    },


    {
        number: 13,
        image: '0013.jpg',
        question: "For what purpose are cat’s eye markers on the road?",
        options: ["Alert the driver is changing the lane", "To caution the driver not to change the lane", "To check the condition of the shocks", "All of the above"],
        answer: 0
    },


    {
        number: 14,
        image: '0014.jpg',
        question: "What does GIVE WAY SIGN on the road mean?",
        options: ["Stop and yield", "Stop"],
        answer: 0
    },

    {
        number: 15,
        image: '0015.jpg',
        question: "What’s the meaning of a single or double solid line(s) in the middle of the road?",
        options: ["No overtaking", "Overtaking allowed if safe and clear", "Overtaking allowed", "None of the above"],
        answer: 0
    },

    {
        number: 16,
        image: '0016.jpg',
        question: "What’s the meaning of the Italic lines in the middle of the road?",
        options: ["Parking space", "No Overtaking", "Give way", "End of the road"],
        answer: 1
    },

    {
        number: 17,
        image: '0017.jpg',
        question: "Rain drops makes the surface slippery as the 1st drops falls?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 18,
        image: '0018.jpg',
        question: "What’s the meaning of the Dotted lines in the middle of the road?",
        options: ["Overtaking allowed", "Parking allowed", "All of the above"],
        answer: 0
    },

    {
        number: 19,
        image: '0019.jpg',
        question: "When do you use hazard lights?",
        options: ["While reversing", "When your vehicle breakdown", "Parking temporally at the side of the road", "All of the above"],
        answer: 1
    },

    {
        number: 20,
        image: '0020.jpg',
        question: "When do you switch on the headlights?",
        options: ["When there is sun glare", "At night", "All of the above"],
        answer: 1
    },

    {
        number: 21,
        image: '0021.jpg',
        question: "If your vehicle engine stops while you’re driving on the road, what should you do?",
        options: ["Put Hazard lights", "Slow down and Stop", "Put Early warning device", "All of the above"],
        answer: 3
    },


    {
        number: 22,
        image: '0022.jpg',
        question: "When are the indicators used?",
        options: ["Left/Right Turns.", "Exiting roundabout", "Changing the lane or overtaking", "All of the above"],
        answer: 3
    },

    {
        number: 23,
        image: '0023.jpg',
        question: "When will you use your High beam lights?",
        options: ["Highway without lighting", "Area without streetlights", "The view is not enough to drive safely", "All of the above"],
        answer: 2
    },

    {
        number: 24,
        image: '0024.jpg',
        question: "Should you give any indicator even if you don’t see any vehicle around you?",
        options: ["No need", "Yes, to keep on practicing on how to use", "Yes, the vehicle can be on your blind sport of your car and you can’t see it via side mirrors.", "All of the above"],
        answer: 2
    },

    {
        number: 25,
        image: '0025.jpg',
        question: "What light should we use during fog?",
        options: ["Indicators", "Low front light", "High light", "Hazard lights"],
        answer: 1
    },

    {
        number: 26,
        image: '0026.jpg',
        question: "During Fog what speed should you use?",
        options: ["40Km/hr", "20Km/hr", "80Km/hr", "All of the above"],
        answer: 0
    },


    {
        number: 27,
        image: '0027.jpg',
        question: "During Sandstorm, what should you do while driving?",
        options: ["Slow down", "Double your distance", "Use low beam lights and mind the edges of the road", "All of the above"],
        answer: 2
    },


    {
        number: 28,
        image: '0028.jpg',
        question: "When you will SWITCH ON your headlights while driving?",
        options: ["At night", "When the area is darken", "Emergency situation like Rain, fog or sandstorm", "All of the above"],
        answer: 0
    },

    {
        number: 29,
        image: '0029.jpg',
        question: "Is it correct to stop the vehicle on the speed hump and have a chat with another driver?",
        options: ["Right", "Wrong"],
        answer: 1
    },

    {
        number: 30,
        image: '0030.jpg',
        question: "While driving in the rain what should you do?",
        options: ["Slow down Double your distance", "Use low beam lights", "Avoid Hard breaking and Maneuvering", "All of the above"],
        answer: 3
    },


    {
        number: 31,
        image: '0031.jpg',
        question: "Is it acceptable to hoot without any imminent danger?",
        options: ["Yes, to express our anger", "Yes, to confirm them presence", "Not acceptable", "None of the above"],
        answer: 2
    },

    {
        number: 32,
        image: '0032.jpg',
        question: "What’s the Safety Distance /tailgating distance between two moving vehicles on the?",
        options: ["2 Sec behind the front vehicle", "2 vehicles behind the from vehicle", "At least one second behind the front vehicle", "All of the above"],
        answer: 0
    },

    {
        number: 33,
        image: '0033.jpg',
        question: "What’s the meaning of a road mark below?",
        options: ["Parking Permitted", "No Overtaking", "Overtaking allowed", "All of the above"],
        answer: 1
    },

    {
        number: 34,
        image: '0034.jpg',
        question: "What do these land markings mean?",
        options: ["Parking Permitted", "Pedestrian Crossing", "No Overtaking", "None of the above"],
        answer: 2
    },

    {
        number: 35,
        image: '0035.jpg',
        question: "When do you check your vehicle?",
        options: ["Daily", "Weekly", "Monthly", "None of the above"],
        answer: 1
    },
    {
        number: 36,
        image: '0036.jpg',
        question: "Do you drive carefully and cautiously to avoid hazard?",
        options: ["No", "Yes"],
        answer: 1
    },

    {
        number: 37,
        image: '0037.jpg',
        question: "What’s the meaning of the sign?",
        options: ["Dangerous path", "Reduce speed and follow the law", "Junction ahead", "Intersection ahead of equal rights"],
        answer: 3
    },

    {
        number: 38,
        image: '0038.jpg',
        question: "When we are using this indicator?",
        options: ["Turning to the left", "Changing lanes and directions", "Overtaking", "All of the above"],
        answer: 1
    },

    {
        number: 39,
        image: '0039.jpg',
        question: "Is that a violation of Qatar traffic rule?",
        options: ["Right", "Wrong"],
        answer: 0
    },


    {
        number: 40,
        image: '0040.jpg',
        question: "Is that a violation of Qatar traffic rule?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 41,
        image: '0041.jpg',
        question: "What do these land markings mean?",
        options: ["Traffic must follow this direction", "Pedestrian crossing", "Give way line", "Overtaking allowed"],
        answer: 2
    },

    {
        number: 42,
        image: '0042.jpg',
        question: "What is the meaning of this land mark?",
        options: ["Parking space", "No Parking", "Overtaking allowed", "None of the above"],
        answer: 1
    },

    {
        number: 43,
        image: '0043.jpg',
        question: "What is the meaning of this road mark?",
        options: ["Stop Line", "Give way Line", "Cross walk", "Foot Path"],
        answer: 2
    },

    {
        number: 44,
        image: '0044.jpg',
        question: "What is the meaning of this land mark middle of the road?",
        options: ["Allowed to pass", "Not allowed to pass", "Allowed to pass in certain conditions", "None of the above"],
        answer: 1
    },

    {
        number: 45,
        image: '0045.jpg',
        question: "What is the land mark means?",
        options: ["Overtaking allowed", "Have Right of way", "No Overtaking", "Give priority to another vehicles"],
        answer: 3
    },

    {
        number: 46,
        image: '0046.jpg',
        question: "Is that a violation of qatar traffic Rule?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 47,
        image: '0047.jpg',
        question: "What is the land mark means?",
        options: ["Diagonal line (due the traffic is allow to pass)", "Diagonal line (due the traffic is not allow to pass)", "Allow to pass in certain conditions", "None of the above"],
        answer: 1
    },

    {
        number: 48,
        image: '0048.jpg',
        question: "What is the traffic sign means?",
        options: ["Give way", "Pedestrian crossing", "Stop lane", "Traffic must follow this direction"],
        answer: 3
    },

    {
        number: 49,
        image: '0049.jpg',
        question: "Is that a violation of qatar traffic Rule?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 50,
        image: '0050.jpg',
        question: "Is that a violation of qatar traffic Rule?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 51,
        image: '0051.jpg',
        question: "Is that a violation of qatar traffic Rule?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 52,
        image: '0052.jpg',
        question: "What is the langdmark means?",
        options: ["Overtaking allowed", "Parking space", "No Overtaking", "All of the above"],
        answer: 2
    },

    {
        number: 53,
        image: '0053.jpg',
        question: "Is that a violation of qatar traffic Rule?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 54,
        image: '0054.jpg',
        question: "What is the traffic sign means?",
        options: ["Diagonal line (no overtaking)", "Parking space", "Roundabout ahead", "All of the above"],
        answer: 2
    },

    {
        number: 55,
        image: '0055.jpg',
        question: "What is the land mark means?",
        options: ["Separation line (overtaking allowed)", "Separation line (no overtaking)", "Parking space", "All of the above"],
        answer: 1
    },


    {
        number: 56,
        image: '0056.jpg',
        question: "What is the meaning of this sign?",
        options: ["Hill top ahead", "Beware of falling rocks", "Beware of animals", "None of the above"],
        answer: 2
    },

    {
        number: 57,
        image: '0057.jpg',
        question: "What is the meaning of the signage shown?",
        options: ["Round about ahead", "Yield, Roundabout", "Give way sign", "U - Turn"],
        answer: 1
    },

    {
        number: 58,
        image: '0058.jpg',
        question: "What is the meaning of the signage shown?",
        options: ["No Parking or waiting", "No stop or Waiting", "Parking permitted", "All of the above"],
        answer: 1
    },

    {
        number: 59,
        image: '0059.jpg',
        question: "What is the meaning of the signage shown?",
        options: ["End of speed limit", "Maximum speed limit", "Trucks not allowed", "None of the above"],
        answer: 1
    },

    {
        number: 60,
        image: '0060.jpg',
        question: "What’s the meaning of the sign shown?",
        options: ["Common parking for both handicap and other motorist", "Parking", "Handicap parking", "Sitting area"],
        answer: 2
    },


    {
        number: 61,
        image: '0061.jpg',
        question: "What are the difficulties of driving during sand storm?",
        options: ["Surface becomes slippery", "Not able to see the edges of the road", "Poor visibility", "All of the above"],
        answer: 3
    },

    {
        number: 62,
        image: '0062.jpg',
        question: "Pedestrians crossing on the road what should you do?",
        options: ["Use horn", "Give way to them and wait till they cross the road", "Drive around them", "Hit them"],
        answer: 1
    },

    {
        number: 63,
        image: '0063.jpg',
        question: "What are the dangers of overloading?",
        options: ["Difficult to control the vehicle", "Risk of your life and other road users", "Properties damage", "All of the above"],
        answer: 3
    },

    {
        number: 64,
        image: '0064.jpg',
        question: "Overloading can cause dangerous situation for the driver passenger and other road users. Right or wrong?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 65,
        image: '0065.jpg',
        question: "What should you do if a police officer requests you to do something?",
        options: ["Don’t care about him", "Follow the traffic light and sign", "Do what he ask you to do", "None of the above"],
        answer: 2
    },

    {
        number: 66,
        image: '0066.jpg',
        question: "What is the land mark means?",
        options: ["Stop Line", "Overtaking allowed", "Parking", "Give priority to another vehicle"],
        answer: 3
    }, 

    {
        number: 67,
        image: '0067.jpg',
        question: "What’s the meaning of the sign board?",
        options: ["Roundabout", "Stop Ahead", "Stop", "Give the priority"],
        answer: 2
    },

    {
        number: 68,
        image: '0068.jpg',
        question: "What’s the meaning of the sign shown?",
        options: ["No traffic in this way", "Road closed", "Danger, follow to the direction", "None of the above"],
        answer: 2
    },


    {
        number: 69,
        image: '0069.jpg',
        question: "When do you use hazard lights?",
        options: ["When you stop your car next to the intersection", "When you want to stop on yellow lines", "When you car breakdowns", "All of the above"],
        answer: 3
    },

    {
        number: 70,
        image: '0070.jpg',
        question: "What is the order sign means?",
        options: ["No left turn", "No right turn", "Direction to be follows keep right", "None of the above"],
        answer: 0
    },

    {
        number: 71,
        image: '0071.jpg',
        question: "What is the traffic sign means ?",
        options: ["End of Main Road", "Two way traffic", "Priority to ongoing traffic", "Oneway Traffic"],
        answer: 2
    },

    {
        number: 72,
        image: '0072.jpg',
        question: "Is it allow to drive the trucks?",
        options: ["Right", "Wrong"],
        answer: 0
    },

    {
        number: 73,
        image: '0073.jpg',
        question: "Is that a violation of Qatar traffic Rule?",
        options: ["Right", "Wrong"],
        answer: 1
    },

    {
        number: 74,
        image: '0074.jpg',
        question: "What is the traffic sign means ?",
        options: ["Compulsory U - turn", "No entry for heavy vehicle", "U - turn ahead for light vehicle only", "None of the above"],
        answer: 2
    },

    {
        number: 75,
        image: '0075.jpg',
        question: "What is the traffic sign means ?",
        options: ["Maximum speed limit", "End of speed limit", "Minimum speed limit", "All of the above"],
        answer: 2
    },

    {
        number: 76,
        image: '0076.jpg',
        question: "What is the meaning of this traffic sign?",
        options: ["No left turn", "Road blocked", "Right lane closed on left", "None of the above"],
        answer: 2
    }
    ];






    return {
        reset: function () {
            index = 0;
            clone = angular.copy(question);
        },

        getQuestion: function () {
            var min = 0;
            var max = clone.length - 1;
            var random = Math.floor(Math.random() * (max - min)) + min;

            var item = {};

            if (random == -1)
                return item;

            item = angular.copy(clone[random]);
            clone.splice(random, 1);

            index++;
            item.index = index;

            return item;
        },


        get: function () {
            return clone;
        }
    };
});