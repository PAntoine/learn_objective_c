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

#import <Foundation/Foundation.h>
#import	"deck.h"
#import "gui.h"
#import <Foundation/NSString.h>
#import <AppKit/AppKit.h>

void	main(int argc, const char* argv[])
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

	[NSApplication sharedApplication];
	[NSApp setDelegate: [MyDelegate new]];

	[NSApp run];

	[deck release];
	[pool release];
}

