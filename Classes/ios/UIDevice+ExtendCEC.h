//
//  UIDevice+CCExtend.h
//  
//
//  Created by apple on 14-4-10.
//
//

#include <sys/types.h>
#include <sys/sysctl.h>

#import <UIKit/UIKit.h>

#define IPADCEC    ([UIDevice currentDeviceTypeCEC] == IPAD_DEV__)

#define IPHONE4CEC ([UIDevice currentDeviceTypeCEC] == IPHONE4_DEV__)

#define IPHONE5CEC ([UIDevice currentDeviceTypeCEC] == IPHONE5_DEV__)

#define IOS7CEC ([UIDevice iOSVersionCEC] >= 7.0)

typedef enum  {
    IOS_UNKNOWN_DEV__ = 0,
    IPHONE4_DEV__ = 1,
    IPHONE5_DEV__ = 2,
    IPAD_DEV__    = 3
} DeviceTypeCEC;

@interface UIDevice(ExtendCEC)

/** 获取当前设备种类 */
+ (DeviceTypeCEC)currentDeviceTypeCEC;

/** curent using simulator */
+ (BOOL)isSimulatorCEC;

/** device have camera */
+ (BOOL)isCameraDeviceAvailableCEC;

+ (NSString*)platformStringCEC;

/** 返回精简版系统版本如5,6,7 */
+ (CGFloat)iOSVersionCEC;

/** 返回完整系统版本如5.1.2 */
+ (NSString *)iOSVersionStringCEC;

+ (BOOL)retinaScreenCEC;

@end