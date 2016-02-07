//
//  ViewController.m
//  testing swiping
//
//  Created by Richard Kim on 5/21/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//
//  @cwRichardKim for updates and requests

#import "ViewController.h"
#import "DraggableViewBackground.h"
#import <linkedin-sdk/LISDK.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:draggableBackground];
    
}
- (IBAction)login:(id)sender {
    if([self.password.text isEqualToString:@""] && [self.username.text isEqualToString:@""] ){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login error" message:@"Empty" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    } else if([self.username.text isEqualToString:@"student"]) {
        //student view
    } else {
        //company view
    }
}

@end
