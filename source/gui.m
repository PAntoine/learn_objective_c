#include "gui.h"

@implementation MyDelegate : NSObject

- (void) applicationWillFinishLaunching: (NSNotification *) not
{
  NSMenu *menu;
  
  menu = AUTORELEASE ([NSMenu new]);
  [menu addItemWithTitle: @"Quit"  
        action: @selector (terminate:)  
        keyEquivalent: @"q"];

  [NSApp setMainMenu: menu];
}
@end


