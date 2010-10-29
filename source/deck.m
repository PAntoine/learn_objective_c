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

	NSLog(@"the array is: %@\n",cards);

	return self;
}

#if 0
-(void) dalloc
{
	[ cards release ];
}
#endif

@end
