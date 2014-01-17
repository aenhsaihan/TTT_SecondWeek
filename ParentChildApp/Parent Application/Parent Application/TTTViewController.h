//
//  TTTViewController.h
//  Parent Application
//
//  Created by Aditya Narayan on 11/26/13.
//  Copyright (c) 2013 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTViewController : UIViewController<NSURLConnectionDelegate> {
    NSMutableData *_responseData;
}


@property (retain, nonatomic) IBOutlet UITextField *getUserID;


@property (retain, nonatomic) IBOutlet UITextField *getLatitude;



@property (retain, nonatomic) IBOutlet UITextField *getLongitude;


@property (retain, nonatomic) IBOutlet UITextField *getRadius;

@property (retain, nonatomic) NSString *userID;

@property (retain, nonatomic) NSString *latitude;

@property (retain, nonatomic) NSString *longitude;

@property (retain, nonatomic) NSString *radius;

@property (retain, nonatomic) NSData *userDetailsJSON;


-(NSString *) generateJSON;


@end
