#import "libactivator/libactivator.h"
#import "../AccessibilityUtilities.h"

@interface WhitePointModulePlugin : NSObject <LAListener>
+(void)load;
+(instancetype)sharedInstance;
@end

@implementation WhitePointModulePlugin

+(void)load
{
    [self sharedInstance];
}

+(instancetype)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init {
    if (self = [super init]) {
        LAActivator *la = [LAActivator sharedInstance];
        [la registerListener:self forName:@"com.opa334.whitepointmodule.enable"];
        [la registerListener:self forName:@"com.opa334.whitepointmodule.disable"];
    }
    return self;
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedGroupForListenerName:(NSString *)listenerName {
    return @"White Point Module";
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedTitleForListenerName:(NSString *)listenerName {
    if ([listenerName isEqualToString:@"com.opa334.whitepointmodule.enable"]){
        return @"Enable";
    }else{
        return @"Disable";
    }
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedDescriptionForListenerName:(NSString *)listenerName {
    if ([listenerName isEqualToString:@"com.opa334.whitepointmodule.enable"]){
        return @"Turn on white point reduction";
    }else{
        return @"Turn off white point reduction";
    }
}


- (UIImage *)activator:(LAActivator *)activator requiresIconForListenerName:(NSString *)listenerName scale:(CGFloat)scale{
    UIImage *icon = [[UIImage alloc] init];
    if (scale == 3.0f){
        icon = [UIImage imageWithContentsOfFile:@"/Library/ControlCenter/Bundles/WhitePointModule.bundle/SettingsIcon@3x.png"];
    }else{
        icon = [UIImage imageWithContentsOfFile:@"/Library/ControlCenter/Bundles/WhitePointModule.bundle/SettingsIcon@2x.png"];
    }
    return icon;
}
- (UIImage *)activator:(LAActivator *)activator requiresSmallIconForListenerName:(NSString *)listenerName scale:(CGFloat)scale{
    UIImage *icon = [[UIImage alloc] init];
    if (scale == 3.0f){
        icon = [UIImage imageWithContentsOfFile:@"/Library/ControlCenter/Bundles/WhitePointModule.bundle/SettingsIcon@3x.png"];
    }else{
        icon = [UIImage imageWithContentsOfFile:@"/Library/ControlCenter/Bundles/WhitePointModule.bundle/SettingsIcon@2x.png"];
    }
    return icon;
}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event forListenerName:(NSString *)listenerName{
    if ([listenerName isEqualToString:@"com.opa334.whitepointmodule.enable"]){
        [AXSettings sharedInstance].reduceWhitePointEnabled = YES;
    }else{
        [AXSettings sharedInstance].reduceWhitePointEnabled = NO;
    }
}

@end
