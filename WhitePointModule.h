#import "WhitePointModuleBackgroundViewController.h"
#import "WhitePointModuleContentViewController.h"

#import <ControlCenterUIKit/CCUIContentModule.h>

#import "libactivator/libactivator.h"

extern CGFloat whitePointIntensityValueForModuleValue(CGFloat moduleValue);
extern CGFloat moduleValueForWhitePointIntensityValue(CGFloat whitePointIntensityValue);

@interface WhitePointModule : NSObject <CCUIContentModule, LAListener>
{
	NSUserDefaults* _preferences;
	BOOL _ignoreUpdates;
	BOOL _invertPercententageEnabled;
	WhitePointModuleBackgroundViewController* _backgroundViewController;
	WhitePointModuleContentViewController* _contentViewController;
}
- (void)updateState;
- (void)applyState;
@end
