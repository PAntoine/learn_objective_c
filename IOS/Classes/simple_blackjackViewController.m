//
//  simple_blackjackViewController.m
//  simple_blackjack
//
//  Created by development on 05/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "simple_blackjackViewController.h"
#import "deck.h"
#import "card.h"

@implementation simple_blackjackViewController

extern unsigned char* data_table[];
extern unsigned int size_table[];

@synthesize deck_select;

@synthesize play_card_1;
@synthesize play_card_2;
@synthesize play_card_3;
@synthesize play_card_4;
@synthesize play_card_5;

@synthesize deal_card_1;
@synthesize deal_card_2;
@synthesize deal_card_3;
@synthesize deal_card_4;
@synthesize deal_card_5;

@synthesize drag_1;
@synthesize drag_2;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib
- (void)viewDidLoad 
{
	[super viewDidLoad];
	
	[drag_1 setUserInteractionEnabled: YES];
	[drag_2 setUserInteractionEnabled: YES];

	[drag_1 setMultipleTouchEnabled: YES];
	
	// Create the two card arrays
	player_cards = [[NSArray alloc] initWithObjects: play_card_1, play_card_2, play_card_3, play_card_4, play_card_5, nil];
	dealer_cards = [[NSArray alloc] initWithObjects: deal_card_1, deal_card_2, deal_card_3, deal_card_4, deal_card_5, nil];

	// Create the image for the deck "button"
	[ deck_select setImage: [self getImage:0] forState: UIControlStateNormal ];
	[ drag_1 setImage: [self getImage:1] ];
	[ drag_2 setImage: [self getImage:0] ];
	
	[ drag_1 setId: 1 ];
	[ drag_2 setId: 2 ];

	
	// Create the deck and the player and dealer hand arrays.
	deck = [[Deck alloc] init];

	player_hand = [[NSMutableArray alloc] initWithCapacity: 5];
	dealer_hand = [[NSMutableArray alloc] initWithCapacity: 5];

	NSLog(@"the suffled array is: %@",deck);

	player_in_action = YES;
	
	card_count = 0;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
    [player_hand release];
    [dealer_hand release];
    [deck release];
    [player_cards release];
    [dealer_cards release];
}

-(IBAction) deckClicked:(id) sender
{	
	if (card_count < 5 && player_in_action)
	{
		[player_hand insertObject:[deck getNextCard] atIndex:card_count ];
		[[player_cards objectAtIndex: card_count] setImage: [self getImage: [[player_hand objectAtIndex: card_count] getImageIndex]]];
		card_count++;
		
		if ( [self calculateHandValue: player_hand num_cards: card_count] <= 21 )
		{
			NSLog(@"hand valid");
		}
		else 
		{
			NSLog(@"hand failed");
			player_in_action = NO;
		}
	}
}

-(IBAction) playerStick:(id) sender
{	
	int dealer_count = 0;
	int dealer_value = 0;
	int player_value = [self calculateHandValue: player_hand num_cards: card_count];
	
	while (dealer_value < player_value)
	{
		[dealer_hand insertObject:[deck getNextCard] atIndex: dealer_count ];
		[[dealer_cards objectAtIndex: dealer_count] setImage: [self getImage: [[dealer_hand objectAtIndex: dealer_count] getImageIndex]]];

		dealer_count++;
		dealer_value = [self calculateHandValue: dealer_hand num_cards: dealer_count];

		usleep(2000);
	}
}	

-(UIImage*) getImage:(int) card_index
{
	return [[ UIImage alloc ] initWithData: [[NSData alloc] initWithBytesNoCopy: data_table[card_index] length: size_table[card_index]] ];
}

-(void) resetPlayArea
{
	int	count;
	
	for (count=0;count<5;count++)
	{
		[ [player_cards objectAtIndex: count] setImage: nil ];
		[ [dealer_cards objectAtIndex: count] setImage: nil ];
	}
}
		
-(int) calculateHandValue: (NSMutableArray*) hand num_cards: (int) num_cards
{
	int count;
	int hand_value = 0;
	int num_aces = 0;
	
	for (count=0;count < num_cards; count++)
	{
		if ([[hand objectAtIndex: count] getValue] == 11)
		{
			num_aces++;
		}

		hand_value += [[hand objectAtIndex: count] getValue];
	}

	while (hand_value > 21 && num_aces > 0)
	{
		hand_value -= 10;
		num_aces--;
	}

	NSLog(@"hand value: %d",hand_value);
	
	return hand_value;
}

@end
