//
//  TTTViewController.h
//  Child Application
//
//  Created by Aditya Narayan on 11/26/13.
//  Copyright (c) 2013 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TTTViewController : UIViewController<CLLocationManagerDelegate> {
    NSMutableData *_responseData;
}


@property (retain, nonatomic) IBOutlet UITextField *getParentUserID;

@property (retain, nonatomic) CLLocationManager *locationManager;

@property (retain, nonatomic) NSString *parentUserID;

@property (retain, nonatomic) NSData *childDictJSON;

@end
