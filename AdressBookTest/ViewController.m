//
//  ViewController.m
//  AdressBookTest
//
//  Created by Peter Bødskov on 1/23/13.
//  Copyright (c) 2013 Peter Bødskov. All rights reserved.
//

#import "ViewController.h"
#import "AddressWrapperViewController.h"


@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)showAddressBook {
    ABPeoplePickerNavigationController *controller = [[ABPeoplePickerNavigationController alloc]init];
    controller.peoplePickerDelegate = self;
    
    AddressWrapperViewController *wrapper = [[AddressWrapperViewController alloc]init];
    [wrapper addChildViewController:controller];
    [wrapper.view addSubview:controller.view];
    [controller willMoveToParentViewController:wrapper];
    [controller didMoveToParentViewController:wrapper];
    [self presentViewController:wrapper animated:YES completion:nil];
}

#pragma mark ABPeoplePickerNavigationControllerDelegate methods
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if(property == kABPersonPhoneProperty){
        NSLog(@"phone selected");
        [self dismissViewControllerAnimated:YES completion:nil];
        NSString* name = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        self.nameLabel.text = name;
        ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
        if (ABMultiValueGetCount(phoneNumbers) > 0) {
            self.phoneLabel.text = (__bridge_transfer NSString*)ABMultiValueCopyValueAtIndex(phoneNumbers, identifier);
        }
        return YES;

    } else {
        return NO;
    }
}


@end
