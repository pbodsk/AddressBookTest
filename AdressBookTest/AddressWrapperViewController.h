//
//  AddressWrapperViewController.h
//  AdressBookTest
//
//  Created by Peter Bødskov on 1/23/13.
//  Copyright (c) 2013 Peter Bødskov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressWrapperViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *addressWrapper;
- (IBAction)enterPhone;
- (IBAction)pickFromAddressBook;
@end
