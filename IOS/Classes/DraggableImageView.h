//
//  DraggableImageView.h
//  simple_blackjack
//
//  Created by development on 10/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DraggableImageView : UIImageView 
{
	CGPoint	startLocation;
	CGRect	startPlace;
	NSTimeInterval startTime;

	int my_id;
	unsigned long	start_time;
}

- (void) touchesBegan: (NSSet*) touches withEvent: (UIEvent*) event;
- (void) touchesMoved: (NSSet*) touches withEvent: (UIEvent*) event;
- (void) touchesEnded: (NSSet*) touches withEvent: (UIEvent*) event;
- (void) setId: (int) new_id;

@end
