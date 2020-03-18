#import "BrisikmenPlugin.h"
#if __has_include(<brisikmen/brisikmen-Swift.h>)
#import <brisikmen/brisikmen-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "brisikmen-Swift.h"
#endif

@implementation BrisikmenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBrisikmenPlugin registerWithRegistrar:registrar];
}
@end
