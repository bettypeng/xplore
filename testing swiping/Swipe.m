//
//  Swipe.m
//  testing swiping
//
//  Created by Joy Hsu on 2/6/16.
//  Copyright © 2016 Richard Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Swipe.h"
#import "DraggableViewBackground.h"


@interface Swipe : UIViewController
@end



@implementation Swipe

- (void)viewDidLoad
{
    [super viewDidLoad];
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
    [self.view addSubview:draggableBackground];
    
}

@end

