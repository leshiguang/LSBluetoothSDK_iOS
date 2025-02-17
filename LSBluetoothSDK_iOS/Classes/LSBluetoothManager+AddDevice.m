//
//  LSBluetoothManager+AddDevice.m
//  AFNetworking
//
//  Created by alex.wu on 2020/4/21.
//

#import "LSBluetoothManager+AddDevice.h"
@implementation LSBluetoothManager(AddDevice)

/**
 * Added in version 1.0.0
 * 添加单个测量设备
 */
-(BOOL)addMeasureDevice:(LSDeviceInfo *)lsDevice result:(void (^)(LSAccessCode)) result {
    NSString *macStr = [lsDevice.macAddress stringByReplacingOccurrencesOfString:@":" withString:@""];
    lsw_authorize_device(@"device-activate", @"1.0", macStr, (lsDevice.modelNumber ?: lsDevice.deviceName), ^(LSAccessCode code) {
        if (code == SUCCESS) {
            [self addMeasureDevice:lsDevice service:@"device-activate" version:@"1.0"];
        }
        if (result) {
            result(code);
        }
    });
    return YES;
}
@end
