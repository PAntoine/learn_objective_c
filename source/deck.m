#import "deck.h"
#import "card.h"

@implementation Deck

-(id) init
{
	int suit;
	int value;
	Card*	prev;
	Card*	next;
	Card*	temp;

	self = [super init];
	
	cards = [[NSMutableArray array] initWithCapacity:52 ];

	NSLog(@"the array is: %@\n",cards);

	prev = nil;

	for (suit=0; suit < 4; suit++)
	{
		for (value=0; value < 13; value++)
		{	
			Card* c = [ Card cardWithSuitValuePosition:suit:value ];
			
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

	NSLog(@"the array is: %@\n",cards);

	return self;
}

/*--------------------------------------------------------------------------------*
 * Name: shuffle
 * Desc: This message will shuffle the deck.
 *       [prev] <- [item] -> [next]
 *       
 *--------------------------------------------------------------------------------*/
-(void) shuffle
{
	for (index=0;index < 52; index++)
	{
		swap = rand() % 52;

		if (swap != index)
		{
			Card* temp = [ card objectAt: index ];

			// remove index from the list
			[ temp->prev setNext: [ temp next ] ];
			[ [ temp next ] setPrev: [ temp prev ] ];

			// add index into new position
			Card* new_pos = [ cards objectAt: swap ];

			[ temp setNext: new_pos ];
			[ temp setPrev: [ new_pos prev ] ];
			[ [ new_pos prev ] setNext: temp ];
			[ new_pos setPrev: temp ];
		}
	}
}

#if 0
-(void) dalloc
{
	[ cards release ];
}
#endif

@end
