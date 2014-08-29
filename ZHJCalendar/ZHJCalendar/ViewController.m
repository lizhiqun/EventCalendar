//
//  ViewController.m
//  ZHJCalendar
//
//  Created by huajian zhou on 12-4-12.
//  Copyright (c) 2012年 itotemstudio. All rights reserved.
//

#import "ViewController.h"
#import "ITTBaseDataSourceImp.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)showCalendar:(id)sender 
{
    if (_calendarView.appear) 
    {
        [_calendarView hide];        
    }
    else
    {
        [_calendarView showInView:self.view];
    }
}
- (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate 
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:formate];
	NSString *str = [formatter stringFromDate:date];
	[formatter release];
	return str;
}
- (void)calendarViewDidSelectDay:(ITTCalendarView*)calendarView calDay:(ITTCalDay*)calDay
{
    NSArray *selectedDates = calendarView.selectedDateArray;
    if (calendarView.allowsMultipleSelection) 
    {
        for (NSDate *date in selectedDates) 
        {
            NSLog(@"selected date %@", [self stringFromFomate:date formate:@"yyyy-MM-dd"]);
        }        
    }
    else
    {
        ITTDINFO(@"selected date %@", [self stringFromFomate:calendarView.selectedDate formate:@"yyyy-MM-dd"]);        
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _calendarView = [ITTCalendarView viewFromNib];
    ITTBaseDataSourceImp *dataSource = [[ITTBaseDataSourceImp alloc] init];
    _calendarView.date = [NSDate dateWithTimeIntervalSinceNow:2*24*60*60];    
    _calendarView.dataSource = dataSource;
    _calendarView.delegate = self;
    _calendarView.frame = CGRectMake(8, 40, 309, 410);
    _calendarView.allowsMultipleSelection = TRUE;
    [_calendarView showInView:self.view];
    [dataSource release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
