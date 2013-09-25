//
//  LPCViewController.m
//  LPC
//
//  Created by Apps 'n' Stuff on 23/11/10.
//  Copyright 2010 Apps 'n' Stuff. All rights reserved.
//

#import "LPCViewController.h"

@implementation LPCViewController
@synthesize mlabel;
@synthesize segmentedControl;
@synthesize agelabel;
@synthesize mnthslabel;
@synthesize yrslabel;
@synthesize weightlabel;
@synthesize kgslabel;

- (void)viewDidLoad
{
	[super viewDidLoad];
	arrayNo = [[NSMutableArray alloc] init];
	[arrayNo addObject:@" 24mg/1mL  (120mg/5mL)"];
	[arrayNo addObject:@" 48mg/1mL  (240mg/5mL)"];
    [arrayNo addObject:@" 100mg/1mL "];
	    doseweight.text  = @"Please enter the child's weight or age.";
	[pickerView selectRow:0 inComponent:0 animated:NO];
    mlabel.text= [arrayNo objectAtIndex:[pickerView selectedRowInComponent:0]];	
    [agelabel setHidden:YES];
    [mnthslabel setHidden:YES];
    [yrslabel setHidden:YES];
    [textfieldyrs setHidden:YES];
    [textfieldmths setHidden:YES];
    [weightlabel setHidden:NO];
    [kgslabel setHidden:NO];
    [textfieldweight setHidden:NO];


}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
	return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	mlabel.text=[arrayNo objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
	return [arrayNo count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
	return [arrayNo objectAtIndex:row];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction) toggleView:(id)sender {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self view] cache:YES];
	[[self view] addSubview:secondaryView];
	[UIView commitAnimations];
}

- (IBAction) toggleViewSettings:(id)sender {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self view] cache:YES];
	[[self view] addSubview:settingsView];
	[UIView commitAnimations];
}

- (IBAction) returnView:(id)sender {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self view] cache:YES];
	[secondaryView removeFromSuperview];
	[UIView commitAnimations];
}


- (IBAction) closekeyboard
{
	
	[textfieldyrs resignFirstResponder];
	[textfieldweight resignFirstResponder];
	[textfieldmths resignFirstResponder];
	
}

- (IBAction) calculate
{
	
	float numberage = ([textfieldyrs.text floatValue]);
	float numbermths = ([textfieldmths.text floatValue]);
	float age = numbermths/12+numberage;
	float numberweight = ([textfieldweight.text floatValue]);
	float answerweight = age*3+7;

    if (age <= 0 && numberweight <= 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please enter age in years and/or months or the weight of the child." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];	
		[alert show];
		[alert release];
		textfieldweight.text = @"";
		textfieldyrs.text = @"";
		textfieldmths.text = @"";
		dose.text = @"";
        doseweight.text = @"";
		mls.text = @"";
        doseweight.text  = @"Please enter the child's weight or age.";
	}
	
	if (age <= .0834 && age > 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Childrens Liquid Paracetamol is not recommended for children one month or younger." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];	
		[alert show];
		[alert release];
		textfieldweight.text = @"";
		textfieldyrs.text = @"";
		textfieldmths.text = @"";
		dose.text = @"";
        doseweight.text = @"";
		mls.text = @"";
        doseweight.text  = @"Please enter the child's weight or age.";
	}
	
	if (age > .0834 && age < .5) {
		textfieldweight.text = @"3.5";
        doseweight.text=@"Estimated body weight is 3.5kg.";
	}
	if (age >= .5 && age < 1) {
		textfieldweight.text = @"7";
        doseweight.text=@"Estimated body weight is 7kg.";
	}
    if (age >= 1 && age < 2) {
		textfieldweight.text = @"10";
        doseweight.text=@"Estimated body weight is 10kg.";
	}
    if (age <= 12 && age >= 2) {
		textfieldweight.text = [[NSString alloc] initWithFormat:@"%.2f", answerweight];
        doseweight.text = [[NSString alloc] initWithFormat:@"Estimated body weight is %.0fkg", answerweight];
	}
	if (age > 12 || numberweight > 43) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"This calculator is designed for Childrens Liquid Paracetamol only and is not for use on persons over 12 years." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];	
		[alert show];
		[alert release];
		textfieldweight.text = @"";
		textfieldyrs.text = @"";
		textfieldmths.text = @"";
		dose.text = @"";
		mls.text = @"";
        doseweight.text  = @"Please enter the child's weight or age.";
	}

	float number1 = ([textfieldweight.text floatValue]);
    float numberSt = ([mlabel.text floatValue]);
	float answer = number1*15;
	dose.text = [[NSString alloc] initWithFormat:@"%.2f", answer];
	
	float answer2 = answer/numberSt;
	mls.text = [[NSString alloc] initWithFormat:@"%.3f", answer2];
}

-(IBAction)returnViewSettings:(id)sender {
    // perform selector after delay
    [self performSelector:@selector(doSomething) withObject:nil afterDelay:0.5];
}

- (void)doSomething {
    float number1 = ([textfieldweight.text floatValue]);
    float numberSt = ([mlabel.text floatValue]);
	float answer = number1*15;
	dose.text = [[NSString alloc] initWithFormat:@"%.2f", answer];
    
	float answer2 = answer/numberSt;
	mls.text = [[NSString alloc] initWithFormat:@"%.3f", answer2];

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self view] cache:YES];
	[settingsView removeFromSuperview];
	[UIView commitAnimations];
}

-(IBAction) segmentedControlIndexChanged{
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            textfieldweight.text = @"";
            textfieldyrs.text = @"";
            textfieldmths.text = @"";
                doseweight.text  = @"Please enter the child's weight or age.";
            [agelabel setHidden:YES];
            [mnthslabel setHidden:YES];
            [yrslabel setHidden:YES];
            [textfieldyrs setHidden:YES];
            [textfieldmths setHidden:YES];
            [weightlabel setHidden:NO];
            [kgslabel setHidden:NO];
            [textfieldweight setHidden:NO];
            break;
		case 1:
            textfieldweight.text = @"";
            textfieldyrs.text = @"";
            textfieldmths.text = @"";
                doseweight.text  = @"Please enter the child's weight or age.";
            [agelabel setHidden:NO];
            [mnthslabel setHidden:NO];
            [yrslabel setHidden:NO];
            [textfieldyrs setHidden:NO];
            [textfieldmths setHidden:NO];
            [weightlabel setHidden:YES];
            [kgslabel setHidden:YES];
            [textfieldweight setHidden:YES];
            break;
            
        default:
            break;
    }
    
    
}


- (IBAction) clear
{
	textfieldweight.text = @"";
	textfieldyrs.text = @"";
	textfieldmths.text = @"";
	dose.text = @"0.00";
	mls.text = @"0.000";
    doseweight.text  = @"Please enter the child's weight or age.";
    
}

- (void)dealloc {
    [super dealloc];
    [doseweight release];
    [textfieldweight release];
	[textfieldyrs release];
	[textfieldmths release];
    [secondaryView release];
    [settingsView release];
    [dose release];
    [mls release];
}

@end
