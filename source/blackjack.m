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
#import <Foundation/NSString.h>
#import <Foundation/Foundation.h>

void	main()
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	Deck*	deck = [Deck alloc];

	NSLog(@"started\n");
	[deck init];

	NSLog(@"after init\n");

	[deck release ];
}

