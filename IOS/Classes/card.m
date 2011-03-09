#import "card.h"

@implementation Card

+(id) cardWithSuitIndex:(int)val :(int) index :(int) image_index
{
	id result = [Card alloc];

	[result initWithSuitIndex:val:index:image_index];

	return result;
}

-(void) initWithSuitIndex:(int)suit_val :(int) index_val :(int) image_index
{
	suit = suit_val;
	index = index_val;
	image = image_index;
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

-(Card*) getNext
{
	return next;
}

-(Card*) getPrev
{
	return prev;
}

-( NSString*) description
{
	return [ NSString stringWithFormat: @"%@ of %@ ", name[index],suits[suit] ];
}

/*--------------------------------------------------------------------------------*
 * Name: getValue
 * Desc: This function will return the value of the card.
 *-------------------------------------------------------------------------------*/
-(int) getValue
{
	return value[index];
}

/*--------------------------------------------------------------------------------*
 * Name: getImageIndex
 * Desc: This function will return the image value for the card.
 *-------------------------------------------------------------------------------*/
-(int) getImageIndex
{
	return image;
}


@end
	