//
//  TTTViewController.m
//  Parent Application
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
    
    NSString * createJSON = @"{\"utf8\":\"✓\", \"authenticity_token\":\"EvZva3cKnzo3Y0G5R3NktucCr99o/2UWOPVAmJYdBOc=\", \"user\":{\"username\":\"batman\", \"latitude\":\"5\", \"longitude\":\"5\"}, \"commit\":\"Create User\", \"action\":\"update\", \"controller\":\"users\"}";
    
    NSLog(@"JSON = \n %@",createJSON);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submitInfo:(id)sender {
    
    self.userID = self.getUserID.text;
    self.latitude = self.getLatitude.text;
    self.longitude = self.getLongitude.text;
    self.radius = self.getRadius.text;
    
    [self.getUserID resignFirstResponder];
    [self.getLatitude resignFirstResponder];
    [self.getLongitude resignFirstResponder];
    [self.getRadius resignFirstResponder];
    
    NSLog(@"%@ %@ %@ %@", self.userID, self.latitude, self.longitude, self.radius);
    
    NSString *jsonString = [self generateJSON];
    
    if (jsonString != nil) {
        /*
            To create, just use: /users
            To edit, use: /users/username
            To get info: /users/username.json
         */
        
        NSURL *digitalLeash = [NSURL URLWithString:@"http://protected-wildwood-8664.herokuapp.com/users"];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:digitalLeash cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%d", [self.userDetailsJSON length]] forHTTPHeaderField:@"Content-length"];
        [request setHTTPBody: self.userDetailsJSON]; //Should I be sending the string, or the data? UPDATE: Figured it out, just made a property for 'userDetailsJSON'
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    } else {
        NSLog(@"Your method returned nil");
    }
}

-(NSString *) generateJSON {
    NSError *errorInfo;
    
    // {"utf8":"✓", "authenticity_token":"EvZva3cKnzo3Y0G5R3NktucCr99o/2UWOPVAmJYdBOc=", "user":{"username":"batman", "latitude":"5", "longitude":"5"}, "commit":"Create User", "action":"update", "controller":"users"}
    
    NSDictionary *userDetails = @{@"utf8": @"✓", @"authenticity_token":@"EvZva3cKnzo3Y0G5R3NktucCr99o/2UWOPVAmJYdBOc=", @"user":@{@"username":self.userID,@"latitude":self.latitude,@"longitude":self.longitude,@"radius":self.radius}, @"commit":@"Create User", @"action":@"update", @"controller":@"users"};
    
    
    if ([NSJSONSerialization isValidJSONObject:userDetails]) {
        
        self.userDetailsJSON = [NSJSONSerialization dataWithJSONObject:userDetails options:0 error:&errorInfo];
    
        
        if (!self.userDetailsJSON) {
            NSLog(@"%@", [errorInfo localizedDescription]);
        } else {
            NSString *userDetailsJSONString = [[NSString alloc] initWithData:self.userDetailsJSON encoding:NSUTF8StringEncoding];
            return userDetailsJSONString;
        }
    } else {
        NSLog(@"Error: Your dictionary is not a valid JSON object.");
        return nil;
    }
    
    return nil;

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
    NSString *_responseDataString = [[NSString alloc] initWithData:_responseData encoding:NSASCIIStringEncoding];
    NSLog(@"didReceiveResponse: %@", _responseDataString);
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

- (void)dealloc {
    [_getUserID release];
    [_getLatitude release];
    [_getLongitude release];
    [_getRadius release];
    [_getLongitude release];
    [super dealloc];
}
@end
