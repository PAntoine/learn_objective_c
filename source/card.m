#import "card.h"

@implementation Card

+(id) cardWithSuitValuePosition:(int)val :(int) index
{
	id result = [Card alloc];

	[result initWithSuitValuePosition:val:index];

	return result;
}

-(void) initWithSuitValuePosition:(int)suit_val :(int) index_val
{
	suit = suit_val;
	index = index_val;
	next = nil;
	prev = nil;
}

-(void) setNext: (Card*) next_link
{
	next = next_link;
}

-(void) setPrev: (Card*) prev_link
{
	prev = prev_link;
}

-( NSString*) description
{
	return [ NSString stringWithFormat: @"%@ of %@ ", name[index],suits[suit] ];
}

@end
