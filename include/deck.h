#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>

@class	Card;

@interface Deck: NSObject
{
	int				num_dealt;
	NSMutableArray	*cards;
	Card			*first_card;
}

-(void)	shuffle;
-(void) dumpRefCount;
-(BOOL)	dealHand:(NSMutableArray*) hand;

@end
