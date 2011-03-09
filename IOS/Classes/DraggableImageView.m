//
//  DraggableImageView.m
//  simple_blackjack
//
//  Created by development on 10/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
	
#import "DraggableImageView.h"


@implementation DraggableImageView

/*
	// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/	

	
- (void)dealloc 
{
    [super dealloc];
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event 
{
	NSLog(@"touchesBegin: %d",[touches count]);
	// Retrieve the touch point
	CGPoint pt = [[touches anyObject] locationInView:self];
	startLocation = pt;
	startPlace = [self frame];
	startTime = [NSDate timeIntervalSinceReferenceDate];
	start_time = clock();
	[[self superview] bringSubviewToFront:self];
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event 
{
	// Move relative to the original touch point
	CGPoint pt = [[touches anyObject] locationInView:self];

	CGRect frame = [self frame];
	frame.origin.x += pt.x - startLocation.x;
	frame.origin.y += pt.y - startLocation.y;
	[self setFrame:frame];
}

- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
	unsigned int	velocity;
	CGRect			frame = [self frame];
	unsigned int	duration = trunc(([NSDate timeIntervalSinceReferenceDate] - startTime) * 100);
	unsigned int	distance = trunc(sqrt((pow(frame.origin.x - startPlace.origin.x,2) + pow(frame.origin.y - startPlace.origin.y,2))));
	
	velocity = distance/duration;
	NSLog(@"duration: %d distance: %d velocity: %d",duration,distance,velocity);
}

- (void) setId: (int) new_id
{
	my_id = new_id;
}
@end
