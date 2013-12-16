//
//  DDGViewController.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDGViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *goButton;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

@end
