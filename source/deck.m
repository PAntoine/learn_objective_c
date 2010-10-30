#import "deck.h"
#import "card.h"

@implementation Deck

/*--------------------------------------------------------------------------------*
 * Name: init
 * Desc: This message will create the card pack.
 *--------------------------------------------------------------------------------*/
-(id) init
{
	int suit;
	int value;
	Card*	prev;
	Card*	next;
	Card*	temp;

	self = [super init];
	
	first_card = nil;

	cards = [[NSMutableArray array] initWithCapacity:52 ];

	NSLog(@"the array is: %@\n",cards);

	prev = nil;

	for (suit=0; suit < 4; suit++)
	{
		for (value=0; value < 13; value++)
		{	
			Card* c = [ Card cardWithSuitIndex:suit:value ];
			
			[ prev setNext: c ];
			[ c setPrev: prev ];

			[ cards addObject: c ];
			
			temp = prev;
			prev = c;

			[ temp release ];
		}
	}

	[ prev release ];

	[ self shuffle ];

	return self;
}

/*--------------------------------------------------------------------------------*
 * Name: dumpRefCount
 * Desc: This message will dump the ref counts.
 *       This is mosly a debug function to work out how the ref-counts work.
 *--------------------------------------------------------------------------------*/
-(void) dumpRefCount
{
	Card*	temp;
	int		value = 0;

	temp = first_card;

	for (value=0;value<52;value++)
	{
		temp = [ cards objectAtIndex: value ];
		NSLog(@"[%d] %@ (ref-count: %d)\n",value,temp,[temp retainCount] );
	}
}

/*--------------------------------------------------------------------------------*
 * Name: shuffle
 * Desc: This message will shuffle the deck.
 *       This is the worlds stupidest shuffle algorithm. It builds a linked list
 *       of cards, rather then swapping the objects within the array which might
 *       be quicker. But, I don't know objective-c so I might be wrong.
 *--------------------------------------------------------------------------------*/
-(void) shuffle
{
	int	swap;
	int index;

	for (index=0;index < 52; index++)
	{
		swap = rand() % 52;

		if (swap != index)
		{
			Card* temp = [ cards objectAtIndex: index ];

			// remove index from the list
			[ [ temp getPrev ] setNext: [ temp getNext ] ];
			[ [ temp getNext ] setPrev: [ temp getPrev ] ];

			// add index into new position
			Card* new_pos = [ cards objectAtIndex: swap ];

			[ [ new_pos getPrev ] setNext: temp ];
			[ temp setPrev: [ new_pos getPrev ] ];

			[ temp setNext: new_pos ];
			[ new_pos setPrev: temp ];

			if ( [temp getPrev] == nil )
			{
				first_card = temp;
			}
		}
	}

	num_dealt = 0;
}

/*--------------------------------------------------------------------------------*
 * Name: getNextCard
 * Desc: This message will get the next card.
 *       The function does no checking of values and relies on the obj-c feature
 *       that messages to nil return nil (and do not crash).
 *-------------------------------------------------------------------------------*/
-(Card*) getNextCard
{
	Card* temp = first_card;

	first_card = [ first_card getNext ];

	return temp;
}

/*--------------------------------------------------------------------------------*
 * Name: dealHand
 * Desc: This message will create the card pack.
 *-------------------------------------------------------------------------------*/
-(BOOL) dealHand : (NSMutableArray*) hand
{
	if ((num_dealt+5) > 52)
	{
		return NO;
	}
	else
	{
		[ hand removeAllObjects ];
		[ hand addObject : [self getNextCard] ];
		[ hand addObject : [self getNextCard] ];
		[ hand addObject : [self getNextCard] ];
		[ hand addObject : [self getNextCard] ];
		[ hand addObject : [self getNextCard] ];

		return YES;
	}
}

/*--------------------------------------------------------------------------------*
 * Name: dalloc
 *-------------------------------------------------------------------------------*/
-(void) dalloc
{
	[ cards release ];
}

@end
