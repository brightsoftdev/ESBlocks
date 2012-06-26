//
//  DemoViewController.m
//  ESBlocks
//
//  Created by Chi Zhang on 6/25/12.
//  Copyright (c) 2012 Chi Zhang. All rights reserved.
//

#import "DemoViewController.h"
#import "UIAlertView+ESBlocks.h"
#import "UIActionSheet+ESBlocks.h"
#import "ESAddressBook.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    /*for (int i = 0; i < 10; i++) {
        //NSString *number = [NSString stringWithFormat:@"%d", i];
        NSString *name = [NSString stringWithFormat:@"contact_%d", i];
        [[ESAddressBook sharedAddressBook] createContact:^(ESContactEditor *editor) {
            NSLog(@"%d", kABPersonFirstNameProperty);
            [editor editProperty:kABPersonFirstNameProperty value:name];
        }];
    }*/
    
    /*[[ESAddressBook sharedAddressBook] enumerateContactsUsingBlock:^(ESContact *contact, BOOL *stop) {
        NSLog(@"contact: %@", contact.name);
        for (ESPhoneNumber *number in contact.phoneNumbers) {
            NSLog(@"(%d) number %@ : %@", number.identifier, number.label, number.number);
        }
        [[ESAddressBook sharedAddressBook] editContact:contact actions:^(ESContactEditor *editor) {
            [editor deleteProperty:kABPersonFirstNameProperty];
        }];
    }];*/
}

- (IBAction)showUIAlertViewWithBlocks:(id)sender 
{
    UIAlertView *av = [UIAlertView alertViewWithTitle:@"Title" 
                                              message:@"This is an alert."
                                    cancelButtonTitle:@"Cancel"
                                    otherButtonTitles:[NSArray arrayWithObject:@"OK"]
                                            onDismiss:^(UIAlertView *av, int buttonIndex) {
                                                NSLog(@"dismissed: %d", buttonIndex);
                                            } onCancel:^{
                                                NSLog(@"canceled. "); 
                                            }];
    [av show];
}

- (IBAction)showUIActionSheetWithBlocks:(id)sender 
{
    UIActionSheet *as = [UIActionSheet actionSheetWithTitles:[NSArray arrayWithObjects:@"Option1", @"Option2", nil] 
                                                   onDismiss:^(UIActionSheet *as, int buttonIndex) {
                                                       NSLog(@"dismissed: %d", buttonIndex);
                                                   }];
    [as show];
}

@end