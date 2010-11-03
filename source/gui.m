#import "gui.h"
#import <Foundation/NSData.h>

#if 0
        splashWindow = [[NSWindow alloc] initWithContentRect: NSMakeRect (0, 0, 400, 400)
                                         styleMask: NSBorderlessWindowMask
                                        backing:NSBackingStoreBuffered
                                        defer:NO];

        NSImage *imageFromBundle = [NSImage imageNamed:@"splashscreen.png"];
        NSImageView *imageView = [[NSImageView alloc] init];
        [imageView setImage: imageFromBundle];
        [[splashWindow contentView] addSubview: imageView];
        [imageView setBounds: NSMakeRect (0, 0, 256, 256)];

        [splashWindow setHasShadow: YES];
        [splashWindow center];
#endif


extern unsigned char* data_table[];
extern unsigned int size_table[];

@implementation MyDelegate : NSObject

- (void) createMenu
{
	NSMenu *menu;
  
 	menu = AUTORELEASE ([NSMenu new]);

 	[menu	addItemWithTitle:	@"Quit"  
        	action: 			@selector (terminate:)  
        	keyEquivalent: 		@"q"];

  [NSApp setMainMenu: menu];
}

- (void) createWindow
{
	NSRect rect = NSMakeRect (100, 100, 575, 200);
	NSSize size = NSMakeSize (75, 108);
	unsigned int styleMask = NSTitledWindowMask | NSMiniaturizableWindowMask;

	main_window = [NSWindow alloc];
	main_window = [main_window	initWithContentRect: rect
								styleMask: styleMask
								backing: NSBackingStoreBuffered
								defer: NO];

	[main_window setTitle: @"This is a test window"];

	// Create a Demo card_image.
	card_data = [[ NSData alloc ]	initWithBytesNoCopy:	data_table[0] 
									length: 				size_table[0]];

	if (card_data == nil)
		NSLog(@"Failed to create the NSData\n");

	// Now create the NSImage to put the card_image on.
	card_image = [[ NSImage alloc ] initWithData: card_data ];

	if (card_image == nil)
		NSLog(@"Failed to create the image\n");

	image_view = [NSImageView alloc];
	[image_view setImage: card_image];

	[main_window setContentView: image_view];
}

- (void) applicationWillFinishLaunching: (NSNotification *) not
{
	[self createMenu];
	[self createWindow];
}

- (void) applicationDidFinishLaunching: (NSNotification *)not;
{
	[main_window makeKeyAndOrderFront: nil];
}

- (void) dalloc
{
	[ card_data release ];
	[ main_window release ];
}

@end


