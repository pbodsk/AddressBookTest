//
//  AddressWrapperViewController.m
//  AdressBookTest
//
//  Created by Peter Bødskov on 1/23/13.
//  Copyright (c) 2013 Peter Bødskov. All rights reserved.
//

#import "AddressWrapperViewController.h"

@interface AddressWrapperViewController ()

@end

@implementation AddressWrapperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.addressWrapper.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterPhone {
    self.addressWrapper.hidden = NO;
    [self.view bringSubviewToFront:self.addressWrapper];
}

- (IBAction)pickFromAddressBook {
    self.addressWrapper.hidden = YES;
    [self.view bringSubviewToFront:self.addressWrapper];
}
@end
