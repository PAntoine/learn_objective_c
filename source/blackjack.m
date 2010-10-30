/*========================================================*
 * Name: Poker
 * Desc: A cheating blackjack game.
 *
 *       This is something I use when learning a new 
 *       lauguage so here is the obj-c version.
 *
 * Auth: Peter Antoine
 * Date: 29th Oct 2010.
 *
 *========================================================*/

#import	"deck.h"
#import <Foundation/Foundation.h>
#import <Foundation/NSString.h>

void	main()
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	Deck*	deck = [Deck alloc];
	NSMutableArray* hand = [NSMutableArray array];

	NSLog(@"started\n");
	[deck init];

	[deck dealHand: hand ];

	NSLog(@"hand is: %@\n",hand);
	
	if ([deck dealHand: hand ])
	{
		NSLog(@"hand is: %@\n",hand);
	}

	[deck release];
	[pool release];
}

