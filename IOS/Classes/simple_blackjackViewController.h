//
//  simple_blackjackViewController.h
//  simple_blackjack
//
//  Created by development on 05/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "deck.h"
#import "DraggableImageView.h"

@interface simple_blackjackViewController : UIViewController 
{
	UIButton*	deck_select;
	UIImageView*	play_card_1;
	UIImageView*	play_card_2;
	UIImageView*	play_card_3;
	UIImageView*	play_card_4;
	UIImageView*	play_card_5;
	
	UIImageView*	deal_card_1;
	UIImageView*	deal_card_2;
	UIImageView*	deal_card_3;
	UIImageView*	deal_card_4;
	UIImageView*	deal_card_5;

	DraggableImageView*	drag_1;
	DraggableImageView*	drag_2;
	
	NSArray*	player_cards;
	NSArray*	dealer_cards;
	
	int num_player_cards;
	int num_dealer_cards;

	// cards for the game
	Deck*   	deck;
	NSMutableArray*	player_hand;
	NSMutableArray*	dealer_hand;

	// game logic controller

	int card_count;

	BOOL	player_in_action;
}

@property (nonatomic, retain) IBOutlet	UIButton* 	deck_select;

@property (nonatomic,retain) IBOutlet	UIImageView*	play_card_1;
@property (nonatomic,retain) IBOutlet	UIImageView*	play_card_2;
@property (nonatomic,retain) IBOutlet	UIImageView*	play_card_3;
@property (nonatomic,retain) IBOutlet	UIImageView*	play_card_4;
@property (nonatomic,retain) IBOutlet	UIImageView*	play_card_5;

@property (nonatomic,retain) IBOutlet	UIImageView*	deal_card_1;
@property (nonatomic,retain) IBOutlet	UIImageView*	deal_card_2;
@property (nonatomic,retain) IBOutlet	UIImageView*	deal_card_3;
@property (nonatomic,retain) IBOutlet	UIImageView*	deal_card_4;
@property (nonatomic,retain) IBOutlet	UIImageView*	deal_card_5;

@property (nonatomic,retain) IBOutlet	DraggableImageView*	drag_1;
@property (nonatomic,retain) IBOutlet	DraggableImageView*	drag_2;

-(IBAction) deckClicked:(id) sender;
-(IBAction) playerStick:(id) sender;

-(UIImage*) getImage:(int) card_index;
-(int) calculateHandValue: (NSMutableArray*) hand num_cards: (int) num_cards;

-(void) resetPlayArea;
@end

