//
//  NSString+Date.m
//  JabberClient
//
//  Created by cesarerocchi on 9/12/11.
//  Copyright 2011 studiomagnolia.com. All rights reserved.
//

#import "NSString+Utils.h"


@implementation NSString (Utils)

+ (NSString *) getCurrentTime {

//	NSDate *nowUTC = [NSDate date];
//	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
//	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//	[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    NSDateFormatter *Timeformatter = [[NSDateFormatter alloc] init];
    Timeformatter.dateFormat = @"hh:mm a";
    NSString *CurrentTime = [Timeformatter stringFromDate:[NSDate date]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MMM-dd";
    NSDate *date = [NSDate date];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    NSString *prefixDateString = [formatter stringFromDate:date];
    NSDateFormatter *monthDayFormatter = [[NSDateFormatter alloc] init] ;
    [monthDayFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [monthDayFormatter setDateFormat:@"dd"];
    int date_day = [[monthDayFormatter stringFromDate:date] intValue];
    NSString *suffix_string = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";
    NSArray *suffixes = [suffix_string componentsSeparatedByString: @"|"];
    NSString *suffix = [suffixes objectAtIndex:date_day];
    NSString *dateString = [prefixDateString stringByAppendingString:suffix];
    NSLog(@"%@", dateString);
    
    NSMutableArray *substrings = [NSMutableArray new];
    NSScanner *scanner = [NSScanner scannerWithString:dateString];
    while(![scanner isAtEnd]) {
        NSString *substring = nil;
        [scanner scanString:@"-" intoString:nil]; // Scan the # character
        if([scanner scanUpToString:@"-" intoString:&substring]) {
            [substrings addObject:substring];
        }
        [scanner scanUpToString:@"-" intoString:nil]; // Scan all next #
    }
    NSString *CurrentDateTimeString=[NSString stringWithFormat:@"%@", [substrings lastObject]];
    NSString*SecondObject=[NSString stringWithFormat:@" %@", [substrings objectAtIndex:1]];
    NSString*Str=@"On ";
    CurrentDateTimeString = [Str stringByAppendingString:CurrentDateTimeString];
    CurrentDateTimeString = [CurrentDateTimeString stringByAppendingString:SecondObject];
    CurrentDateTimeString = [CurrentDateTimeString stringByAppendingString:@" at "];
    CurrentDateTimeString = [CurrentDateTimeString stringByAppendingString:CurrentTime];
    
	return CurrentDateTimeString;
	
}


+ (NSString *) getCurrentDateTime {
    NSDateFormatter *Dateformatter = [[NSDateFormatter alloc] init];
    Dateformatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString*currentDate = [Dateformatter stringFromDate:[NSDate date]];
    return currentDate;
}

+ (NSString *) getCurrentDay {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger week = [components month];
    NSInteger year = [components year];
    NSString *string = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)year, (long)week,(long)day ];
    NSLog(@"%@",string);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString*TodayDate = [formatter stringFromDate:[NSDate date]];
    NSString*CurrentDate = [TodayDate stringByAppendingString:@" 00:00:00"];
    NSDate *date1 = [formatter dateFromString:TodayDate];
    long lgTime = (long)[date1 timeIntervalSince1970];
    NSLog(@"%ld", lgTime);
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* component = [calender components:NSCalendarUnitWeekday fromDate:date1];
    NSLog(@"date=%@ === %@",[NSDate date],date1);
    NSLog(@"day= %ld",(long)[component weekday]);
    NSInteger weekDay = [component weekday];
    NSString*CurrentDay = [[formatter weekdaySymbols] objectAtIndex:weekDay - 1];
    NSLog(@"Day ::: %@", CurrentDate);
    
    return CurrentDay;
}


+ (NSString *) getCurrentDate {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger week = [components month];
    NSInteger year = [components year];
    NSString *string = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)year, (long)week,(long)day ];
    NSLog(@"%@",string);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString*TodayDate = [formatter stringFromDate:[NSDate date]];
    NSString*CurrentDate = [TodayDate stringByAppendingString:@" 00:00:00"];
    NSDate *date1 = [formatter dateFromString:TodayDate];
    long lgTime = (long)[date1 timeIntervalSince1970];
    NSLog(@"%ld", lgTime);
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* component = [calender components:NSCalendarUnitWeekday fromDate:date1];
    NSLog(@"date=%@ === %@",[NSDate date],date1);
    NSLog(@"day= %ld",(long)[component weekday]);
    NSInteger weekDay = [component weekday];
    NSString*CurrentDay = [[formatter weekdaySymbols] objectAtIndex:weekDay - 1];
    NSLog(@"Day ::: %@", CurrentDay);
    
    return CurrentDate;
}






- (NSString *) substituteEmoticons {
	
	//See http://www.easyapns.com/iphone-emoji-alerts for a list of emoticons available
	
	NSString *res = [self stringByReplacingOccurrencesOfString:@":)" withString:@"\ue415"];	
	res = [res stringByReplacingOccurrencesOfString:@":(" withString:@"\ue403"];
	res = [res stringByReplacingOccurrencesOfString:@";-)" withString:@"\ue405"];
	res = [res stringByReplacingOccurrencesOfString:@":-x" withString:@"\ue418"];
	
	return res;
	
}

@end
