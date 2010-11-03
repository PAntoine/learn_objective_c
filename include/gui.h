#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>

@interface MyDelegate : NSObject
{
	NSWindow*		main_window;
	NSImage*		card_image;
	NSData*			card_data;
	NSImageView*	image_view;
}

- (void) createMenu;
- (void) createWindow;
- (void) applicationWillFinishLaunching: (NSNotification *)not;
- (void) applicationDidFinishLaunching: (NSNotification *)not;
@end

