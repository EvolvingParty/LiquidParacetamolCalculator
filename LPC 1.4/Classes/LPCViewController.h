//
//  LPCViewController.h
//  LPC
//
//  Created by Apps 'n' Stuff on 23/11/10.
//  Copyright 2010 Apps 'n' Stuff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPCViewController : UIViewController {
	UILabel *agelabel;
    UILabel *mnthslabel;
    UILabel *yrslabel;
    UILabel *weightlabel;
    UILabel *kgslabel;
    IBOutlet UIView *secondaryView;
    IBOutlet UIView *settingsView;
	IBOutlet UITextField *textfieldweight;
	IBOutlet UITextField *textfieldyrs;
	IBOutlet UITextField *textfieldmths;
	IBOutlet UILabel *dose;
    IBOutlet UILabel *doseweight;
	IBOutlet UILabel *mls;
    IBOutlet UILabel *mlabel;
	NSMutableArray *arrayNo;
	IBOutlet UIPickerView *pickerView;
    UISegmentedControl *segmentedControl;
}

- (IBAction) toggleView:(id)sender;
- (IBAction) toggleViewSettings:(id)sender;
- (IBAction) returnView:(id)sender;
- (IBAction) returnViewSettings:(id)sender;
- (IBAction) calculate;
- (IBAction) clear;
- (IBAction) closekeyboard;
- (IBAction) segmentedControlIndexChanged;

@property (nonatomic, retain) UILabel *mlabel;
@property (nonatomic,retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic,retain) IBOutlet UILabel *agelabel;
@property (nonatomic,retain) IBOutlet UILabel *mnthslabel;
@property (nonatomic,retain) IBOutlet UILabel *yrslabel;
@property (nonatomic,retain) IBOutlet UILabel *weightlabel;
@property (nonatomic,retain) IBOutlet UILabel *kgslabel;

@end

