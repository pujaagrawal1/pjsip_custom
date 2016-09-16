//
//  ViewController.m
//  simpleVoiP
//
//  Created by akshay bansal on 8/5/16.
//  Copyright © 2016 akshay bansal. All rights reserved.
//

#import "ViewController.h"
//#import "XCPjsua.h"
#import "customPjsua.h"

@interface ViewController ()
{
   customPjsua *sharedObj;

}
- (IBAction)makeCall:(id)sender;
- (IBAction)EndCall:(id)sender;

    

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sharedObj=[customPjsua sharedManager];
    
    
    
    //startPjsip("akshay10503878", "192.168.20.217");
    // startPjsip("akshay10503878", "sip.linphone.org");
    // makeCall("sip:puja@sip.linphone.org");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
       
        
        dispatch_async(dispatch_get_main_queue(), ^{

            [sharedObj initialisePjsua];
            sharedObj.serverField=@"108.170.10.194";
            sharedObj.usernameField=@"800";
            sharedObj.passwordField=@"1234";
            [sharedObj sipRegister];
            //startPjsip("800", "108.170.10.194");

         });
     });




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeCall:(id)sender {
   
    
    
    
    
    
    
    // makeCall("sip:puja@192.168.20.217");
    //  makeCall("sip:800@108.170.10.194");
    //       answercall();
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
         dispatch_async(dispatch_get_main_queue(), ^{
        
             [sharedObj makeCall:@"101"];
             
         });
    });
}

- (IBAction)EndCall:(id)sender {
  //  endCall();
}
@end
