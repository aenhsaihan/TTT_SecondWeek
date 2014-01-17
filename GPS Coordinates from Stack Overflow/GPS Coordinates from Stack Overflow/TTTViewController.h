//
//  TTTViewController.h
//  GPS Coordinates from Stack Overflow
//
//  Created by Aditya Narayan on 11/25/13.
//  Copyright (c) 2013 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TTTViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;


@end
