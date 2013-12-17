//
//  DDGViewController.m
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import "DDGViewController.h"
#import "DDGQueryRequestHandler.h"
#import "DDGSearchResultsViewController.h"

@interface DDGViewController ()

@end

@implementation DDGViewController

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

#pragma mark - Text field delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"])
    {
        [textField resignFirstResponder];
        [self.goButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        
        return NO;
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DDGSearchResultsViewController *destination = segue.destinationViewController;
    destination.searchString = self.searchTextField.text;
    destination.handler = [DDGQueryRequestHandler queryHandlerForSender:destination forString:self.searchTextField.text];
}

@end
