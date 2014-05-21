//
//  UIDevice+CCExtend.m
//  
//
//  Created by apple on 14-4-10.
//
//

#import "UIDevice+ExtendCEC.h"

static BOOL isRetinaScreen = NO;
static BOOL didRetinaCheck = NO;

static DeviceTypeCEC deviceType;

@implementation UIDevice(ExtendCEC)

/** 获取当前设备种类 */
+ (DeviceTypeCEC)currentDeviceTypeCEC {
    UIUserInterfaceIdiom useInterfaceIdiom =[[UIDevice currentDevice] userInterfaceIdiom];
    
    if (deviceType != IOS_UNKNOWN_DEV__) {
        return deviceType;
    }
    
    if (useInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        if([UIScreen mainScreen].bounds.size.height == 568) {   //iphone5
            deviceType = IPHONE5_DEV__;
        } else {
            deviceType = IPHONE4_DEV__;
        }
    } else {
        deviceType = IPAD_DEV__;
    }
    return deviceType;
}

+ (BOOL)isSimulatorCEC {
    NSString *platform = [UIDevice platform];
    if ([platform rangeOfString:@"86"].location != NSNotFound) {
        return YES;
    }
    return NO;
}

+ (BOOL)isCameraDeviceAvailableCEC {
    BOOL isRearCameraAvaliabel = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    BOOL isFrontCameraAvaliabel = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    
    return isRearCameraAvaliabel | isFrontCameraAvaliabel;
}

+ (NSString *)platform{
    size_t size;
    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

+ (NSString*)platformStringCEC
{
    NSString *platform = [UIDevice platform];
    
    if ([platform isEqualToString:@"iPhone4,1"]) {
        platform = @"iPhone 4S";
    } else if ([platform isEqualToString:@"iPhone5,1"]) {
        platform = @"iPhone 5";
    } else if ([platform isEqualToString:@"iPhone5,2"]) {
        platform = @"iPhone 5S";
    } else if ([platform isEqualToString:@"iPhone3,1"]) {
        platform = @"iPhone 4";
    }  else if ([platform isEqualToString:@"iPod4,1"]) {
        platform = @"iPod touch 4";
    } else if ([platform isEqualToString:@"iPod5,1"]) {
        platform = @"iPod touch 5";
    } else if ([platform isEqualToString:@"iPad4,2"]) {
        platform = @"iPad 4 3G";
    } else if ([platform isEqualToString:@"iPad4,1"]) {
        platform = @"iPad 4 WiFi";
    } else if ([platform isEqualToString:@"iPad3,2"]) {
        platform = @"iPad 3 3G";
    } else if ([platform isEqualToString:@"iPad3,1"]) {
        platform = @"iPad 3 WiFi";
    } else if ([platform isEqualToString:@"iPad2,2"]) {
        platform = @"iPad 2 3G";
    } else if ([platform isEqualToString:@"iPad2,1"]) {
        platform = @"iPad 2 WiFi";
    } else if ([platform isEqualToString:@"iPad1,1"]) {
        platform = @"iPad 1 WiFi";
    } else if ([platform isEqualToString:@"iPhone1,1"]) {
        platform = @"iPhone";
    } else if ([platform isEqualToString:@"iPhone1,2"]) {
        platform = @"iPhone 3G";
    } else if ([platform isEqualToString:@"iPhone2,1"]) {
        platform = @"iPhone 3GS";
    }
    return platform;
}

/** 返回精简版系统版本如5,6,7 */
+ (CGFloat)iOSVersionCEC {
    CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
    return version;
}

/** 返回完整系统版本如5.1.2 */
+ (NSString *)iOSVersionStringCEC {
    NSString *version = [[UIDevice currentDevice] systemVersion];
    return version;
}

+ (BOOL)retinaScreenCEC {
    if (!didRetinaCheck) {
        isRetinaScreen = ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
                          ([UIScreen mainScreen].scale == 2.0));
        didRetinaCheck = YES;
    }
    return isRetinaScreen;
}

@end
