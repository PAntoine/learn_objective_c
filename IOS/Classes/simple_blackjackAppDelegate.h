//
//  simple_blackjackAppDelegate.h
//  simple_blackjack
//
//  Created by development on 05/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class simple_blackjackViewController;

@interface simple_blackjackAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    simple_blackjackViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet simple_blackjackViewController *viewController;

@end

