static NSString*	suits[4] = { @"Clubs",@"Diamonds",@"Hearts",@"Spades"};
static NSString*	name[13] = { @"Ace",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"jack",@"queen",@"king" };
static int			value[13] = {11,2,3,4,5,6,7,8,9,10,10,10,10};

@interface Card : NSObject
{
	int	suit;
	int	index;
	int	image;

	Card*	prev;
	Card*	next;		// this is a linkable item.
}

-(void)		initWithSuitIndex:(int)val :(int) index :(int) image_index ;
+(id)		cardWithSuitIndex:(int)val :(int) index :(int) image_index ;
-(void)		setNext: (Card*) next_link;
-(void)		setPrev: (Card*) prev_link;
-(Card*)	getNext;
-(Card*)	getPrev;
-(int)		getValue;
-(int)		getImageIndex;

@end
