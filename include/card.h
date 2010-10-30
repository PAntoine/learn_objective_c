#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>


static NSString*	suits[4] = { @"Hearts",@"Spades",@"Diamonds",@"Clubs"};
static NSString*	name[13] = { @"Ace",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"jack",@"queen",@"king" };
static int		value[13] = {10,2,3,4,5,6,7,8,9,10,10,10,10};

@interface Card : NSObject
{
	int	suit;
	int index;

	Card*	prev;
	Card*	next;		// this is a linkable item.
}

-(void) initWithSuitValuePosition:(int)val :(int) index ;
-(void) setNext: (Card*) next_link;
-(void) setPrev: (Card*) prev_link;
-(Card*) getNext;
-(Card*) getPrev;
+(id) cardWithSuitValuePosition:(int)val :(int) index ;

@end
