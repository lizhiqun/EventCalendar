//
//  ViewController.h
//  ZHJCalendar
//
//  Created by huajian zhou on 12-4-12.
//  Copyright (c) 2012年 itotemstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTCalendarView.h"


@interface ViewController : UIViewController<ITTCalendarViewDelegate>
{
    ITTCalendarView *_calendarView;
}
@end
