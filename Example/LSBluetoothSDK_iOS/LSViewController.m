//
//  LSViewController.m
//  LSBluetoothSDK_iOS
//
//  Created by alex.wu on 04/16/2020.
//  Copyright (c) 2020 alex.wu. All rights reserved.
//

#import "LSViewController.h"
#import "LSBluetoothManager+AddDevice.h"
#import <LSDeviceBluetooth/LSBluetoothManager.h>
@interface LSViewController ()

@end

@implementation LSViewController

- (void)viewDidLoad
{
    LSDeviceInfo *deviceInfo = [[LSDeviceInfo alloc] init];
    deviceInfo.macAddress = @"D90C978F0425";
    deviceInfo.modelNumber= @"LS108-B";
    deviceInfo.deviceName= @"LS108-B";
    deviceInfo.broadcastId = @"CE5C95AEF815";
    deviceInfo.deviceId = @"a33fff3faa33";
    deviceInfo.deviceSn = @"2228828828282828";
    deviceInfo.deviceType = LSDeviceTypePedometer;
    [[LSBluetoothManager defaultManager] addMeasureDevice:deviceInfo result:^(LSAccessCode code) {
        NSLog(@"%ld", code);
    }];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
