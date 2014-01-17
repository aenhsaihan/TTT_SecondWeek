//
//  TTTViewController.m
//  Child Application
//
//  Created by Aditya Narayan on 11/26/13.
//  Copyright (c) 2013 TurnToTech. All rights reserved.
//

#import "TTTViewController.h"

@interface TTTViewController ()

@end

@implementation TTTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(id)sender {
    self.parentUserID = self.getParentUserID.text;
    
    [self.getParentUserID resignFirstResponder];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    NSString *latitude = [NSString stringWithFormat:@"%f", manager.location.coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", manager.location.coordinate.longitude];
    
    NSDictionary *childDict = @{@"utf8": @"✓", @"authenticity_token":@"EvZva3cKnzo3Y0G5R3NktucCr99o/2UWOPVAmJYdBOc=", @"user":@{@"username":self.parentUserID,@"current_lat":latitude,@"current_longitude":longitude}, @"commit":@"Create User", @"action":@"update", @"controller":@"users"};
    
    if ([NSJSONSerialization isValidJSONObject:childDict]) {
        
        NSError *errorInfo;
        
        self.childDictJSON = [NSJSONSerialization dataWithJSONObject:childDict options:0 error:&errorInfo];
        
        if (!self.childDictJSON) {
            NSLog(@"%@", [errorInfo localizedDescription]);
        }
    } else {
        NSLog(@"Error: Your dictionary is not a valid JSON Object");
    }
    
    NSString *digitalUnleashURLString = [NSString stringWithFormat:@"http://protected-wildwood-8664.herokuapp.com/users/%@", self.parentUserID];
    
    NSURL *digitalUnleashURL = [NSURL URLWithString:digitalUnleashURLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:digitalUnleashURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [request setHTTPMethod:@"PATCH"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [self.childDictJSON length]] forHTTPHeaderField:@"Content-length"];
    [request setHTTPBody: self.childDictJSON];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
    NSLog(@"didReceiveData");
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    NSLog(@"willCacheResponse");
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSLog(@"Posted to the server successfully!");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"Error = %@", [error localizedDescription]);
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
}

- (void)dealloc {
    [_getParentUserID release];
    [super dealloc];
}
@end
