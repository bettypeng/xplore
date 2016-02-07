//
//  DraggableViewBackground.m
//  testing swiping
//
//  Created by Richard Kim on 8/23/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "DraggableViewBackground.h"
#import "ViewController.h"

@implementation DraggableViewBackground{
    NSInteger cardsLoadedIndex; //%%% the index of the card you have loaded into the loadedCards array last
    NSMutableArray *loadedCards; //%%% the array of card loaded (change max_buffer_size to increase or decrease the number of cards this holds)
    
    UIButton* menuButton;
    UIButton* messageButton;
    UIButton* checkButton;
    UIButton* xButton;
}
//this makes it so only two cards are loaded at a time to
//avoid performance and memory costs
static const int MAX_BUFFER_SIZE = 2; //%%% max number of cards loaded at any given time, must be greater than 1
static const float CARD_HEIGHT = 386; //%%% height of the draggable card
static const float CARD_WIDTH = 290; //%%% width of the draggable card

@synthesize exampleCardLabels; //%%% all the labels I'm using as example data at the moment
@synthesize title;
@synthesize pics;
@synthesize dates;
@synthesize end;
@synthesize dateArray;
@synthesize desc;
@synthesize description;
@synthesize allCards;//%%% all the cards



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [super layoutSubviews];
        [self setupView];
        exampleCardLabels = [[NSArray alloc]initWithObjects:@"Robot Block Party volunteer", @"Save The Bay", @"Swell Superheroes Day", @"JA Day - Carl Lauro Elementary", @"Earth Day Cleanup", @"Play Partner Volunteer", @"Ice Watch USA Volunteer", @"Inspiring Minds Computer Mentor", nil]; //%%% placeholder for card-specific information
        pics = [[NSArray alloc] initWithObjects:@"robot", @"savethebay", @"superheroes", @"jainaday", @"earthday", @"zoo", @"icewatch", @"computer", nil];
        dateArray = [[NSArray alloc] initWithObjects:@"2/28: 8-11 AM", @"3/1 - 5/1", @"4/5: 5-7PM", @"3/24: 12-2PM", @"4/16: 10-4PM", @"Times flexible", @"Winter 2016", @"11/30/15 03:30 PM - 4/29/16 05:45 PM", nil];
        desc = [[NSArray alloc] initWithObjects:@"The Robot Block Party features demonstrations and exhibits of robots used or created by universities, community organizations, industry and K-12 schools across Rhode Island. We need volunteers to help exhibitors load in and set up their booths, to help spectators find their way in the venue and answer general questions about the event.", @"Save The Bay is a non-profit organization whose mission is to provide education to the community about protecting and restoring the ecological health of the Narragansett Bay region. Volunteer restoration efforts including salt marsh digging and planting projects. Specific field activities include water table depth monitoring, vegetation monitoring, and fish monitoring.", @"Volunteers needed for Swell Superheroes visit to the Hasbro Children's Hospital. Enthusiasm, a superhero costume, and some experience working with kids is all that is needed!", @"Junior Achievement is the world’s largest organization dedicated to educating students about workforce readiness, entrepreneurship and financial literacy through experiential, hands-on programs. We are seeking volunteers to teach in all grades, Kindergarten through 5th. All five elementary sessions will be taught in one day on March 24, 2016.", @" All volunteers should dress for the weather and wear clothes they don't mind getting dirty. Closed-toed shoes are required. Volunteers must be able to do some light to moderate bending and lifting. All volunteers are encouraged to bring their own reusable water bottle and snacks to the cleanup event.", @"A Play Partner is a volunteer who is primarily responsible for observing and facilitating children’s play experiences as well as providing resources for zoo patrons in the activity play spaces located within the Our Big Backyard exhibit at Roger Williams Park Zoo.", @"IceWatch USA™, a program of Nature Abounds, brings you the opportunity to help scientists study how our climate is changing! All you need to do is to choose a location to observe over the winter, like a nearby lake, bay, or river, and record and report your observations about precipitation, ice and wildlife.", @"Inspiring Minds is looking for STEAM (science, technology, engineering, arts, mathematics) enthusiasts to teach suring our out-of-school time programming. Ideal volunteers will have a background a STEAM field, be a self-starter, motivated, organized, responsible, and enjoy working with youth. College experience and/or degree preferred.", nil];

        loadedCards = [[NSMutableArray alloc] init];
        allCards = [[NSMutableArray alloc] init];
        cardsLoadedIndex = 0;
        [self loadCards];
    }
    return self;
}

//%%% sets up the extra buttons on the screen
-(void)setupView
{

    self.backgroundColor = [UIColor colorWithRed:.92 green:.93 blue:.95 alpha:1]; //the gray background colors
//    menuButton = [[UIButton alloc]initWithFrame:CGRectMake(17, 34, 22, 15)];
    menuButton = [[UIButton alloc]initWithFrame:CGRectMake(17, 30, 45, 30)];
    [menuButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    messageButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 34, 18, 18)];
//    [messageButton setImage:[UIImage imageNamed:@"messageButton"] forState:UIControlStateNormal];
    xButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 485, 59, 59)];
    [xButton setImage:[UIImage imageNamed:@"xButton"] forState:UIControlStateNormal];
    [xButton addTarget:self action:@selector(swipeLeft) forControlEvents:UIControlEventTouchUpInside];
    checkButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 485, 59, 59)];
    [checkButton setImage:[UIImage imageNamed:@"checkButton"] forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(swipeRight) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:menuButton];
    [self addSubview:messageButton];
    [self addSubview:xButton];
    [self addSubview:checkButton];
}


//%%% creates a card and returns it.  This should be customized to fit your needs.
// use "index" to indicate where the information should be pulled.  If this doesn't apply to you, feel free
// to get rid of it (eg: if you are building cards from data from the internet)
-(DraggableView *)createDraggableViewWithDataAtIndex:(NSInteger)index
{
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"xplorgray" ofType:@"png"]]];
    logo.frame = CGRectMake(20, 130, 260, 200);
    [self addSubview: logo];
    
    end = [[UITextView alloc] initWithFrame:CGRectMake(self.frame.size.width/4, 200, self.frame.size.width/2, 80)];
    [self addSubview: end];
    end.text = @"Come back soon to xplor new opportunities!";
    [end setTextAlignment:NSTextAlignmentCenter];
    end.textColor = [UIColor blackColor];
    [end setFont:[UIFont fontWithName:@"Avenir Next" size: 15]];
    end.backgroundColor = [UIColor clearColor]; //the gray background colors
    
    DraggableView *draggableView = [[DraggableView alloc]initWithFrame:CGRectMake((self.frame.size.width - CARD_WIDTH)/2, (self.frame.size.height - CARD_HEIGHT)/2 + 20, CARD_WIDTH, CARD_HEIGHT)];
    
    
    draggableView.information.text = [exampleCardLabels objectAtIndex:index]; //%%% placeholder for card-specific information
    //    UIImageView *companyPic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"teespring"]];
    UIImageView *companyPic = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource: [pics objectAtIndex:index]  ofType:@"png"]]];
    companyPic.frame = CGRectMake(65, 70, 150, 150);
    [draggableView.information addSubview: companyPic];
    
    dates = [[UILabel alloc] initWithFrame:CGRectMake(0, 230, self.frame.size.width-30, 40)];
    [draggableView.information addSubview: dates];
    dates.text = [dateArray objectAtIndex:index];
    [dates setTextAlignment:NSTextAlignmentCenter];
    dates.textColor = [UIColor blackColor];
    [dates setFont:[UIFont fontWithName:@"Avenir Next" size: 15]];
    
    description= [[UITextView alloc]initWithFrame:CGRectMake(10, 270, self.frame.size.width-50, 135)];
    description.text = [desc objectAtIndex:index];
    [description setTextAlignment:NSTextAlignmentCenter];
    description.textColor = [UIColor blackColor];
    [draggableView.information addSubview: description];
    [description setFont:[UIFont fontWithName:@"Avenir Next" size: 11]];
    
    
    draggableView.delegate = self;
    return draggableView;
}


//%%% loads all the cards and puts the first x in the "loaded cards" array
-(void)loadCards
{
    if([exampleCardLabels count] > 0) {
        NSInteger numLoadedCardsCap =(([exampleCardLabels count] > MAX_BUFFER_SIZE)?MAX_BUFFER_SIZE:[exampleCardLabels count]);
        //%%% if the buffer size is greater than the data size, there will be an array error, so this makes sure that doesn't happen
        
        //%%% loops through the exampleCardsLabels array to create a card for each label.  This should be customized by removing "exampleCardLabels" with your own array of data
        for (int i = 0; i<[exampleCardLabels count]; i++) {
            DraggableView* newCard = [self createDraggableViewWithDataAtIndex:i];
            [allCards addObject:newCard];
            
            if (i<numLoadedCardsCap) {
                //%%% adds a small number of cards to be loaded
                [loadedCards addObject:newCard];
            }
        }
        
        //%%% displays the small number of loaded cards dictated by MAX_BUFFER_SIZE so that not all the cards
        // are showing at once and clogging a ton of data
        for (int i = 0; i<[loadedCards count]; i++) {
            if (i>0) {
                [self insertSubview:[loadedCards objectAtIndex:i] belowSubview:[loadedCards objectAtIndex:i-1]];
            } else {
                [self addSubview:[loadedCards objectAtIndex:i]];
            }
            cardsLoadedIndex++; //%%% we loaded a card into loaded cards, so we have to increment
        }
    }
}


//%%% action called when the card goes to the left.
// This should be customized with your own action
-(void)cardSwipedLeft:(UIView *)card;
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    
    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }
}


//%%% action called when the card goes to the right.
// This should be customized with your own action
-(void)cardSwipedRight:(UIView *)card
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    
    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    
    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }

}

//%%% when you hit the right button, this is called and substitutes the swipe
-(void)swipeRight
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeRight;
    [UIView animateWithDuration:0.2 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView rightClickAction];

}

//%%% when you hit the left button, this is called and substitutes the swipe
-(void)swipeLeft
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeLeft;
    [UIView animateWithDuration:0.2 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView leftClickAction];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
