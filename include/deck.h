#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>

@class	Card;

@interface Deck: NSObject
{
	int				index;
	NSMutableArray	*cards;
}

//-(void)		init;
//-(void)		shuffle;
//-(NSArray*)	dealHand;

@end
