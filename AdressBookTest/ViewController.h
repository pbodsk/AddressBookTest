//
//  ViewController.h
//  AdressBookTest
//
//  Created by Peter Bødskov on 1/23/13.
//  Copyright (c) 2013 Peter Bødskov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>
- (IBAction)showAddressBook;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
