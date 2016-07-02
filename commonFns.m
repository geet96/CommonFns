//
//  commonFns.m

//
//  Created by Geetanjali Dwiwedi on 02/03/16.
//  Copyright © 2016 Geetanjali Dwiwedi. All rights reserved.
//

#import "commonFns.h"

@implementation commonFns

+(BOOL)validateEmail:(NSString *)string :(NSString *)tittle
{
    if( ![string isEqual:@""])
    {
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        if([emailTest evaluateWithObject:string])
        {
            return true;
        }
        else
        {
            [self alertview:[NSString stringWithFormat:@"Please enter valid %@ ",tittle]];
            return false;
        }
    }
    else
    {
        [self alertview:[NSString stringWithFormat:@"Please enter valid %@ ",tittle]];
        return false;
    }
}

+(BOOL) ValidatePhone:(NSString *)string :(NSString *)tittle
{
    if( ![string isEqual:@""])
    {
        NSString *abnRegex = @"[0-9]+"; // check for one or more occurrence of string you can also use * instead + for ignoring null value
        NSPredicate *abnTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", abnRegex];
        BOOL isValid = [abnTest evaluateWithObject:string];
        if(isValid)
        {
            if(!((string.length < 10)||(string.length > 15)))
            {
                return true;
            }
            else
            {
                [self alertview:[NSString stringWithFormat:@"Please enter a valid %@",tittle]];
                return false;
            }
        }
        else
        {
            [self alertview:[NSString stringWithFormat:@"Please enter valid %@ ",tittle]];
            return false;
        }
        
    }
    else
    {
        [self alertview:[NSString stringWithFormat:@"Please enter valid %@ ",tittle]];
        return false;
    }
}

+(BOOL)validatefieldnotempty:(NSString *)string :(NSString *)tittle
{
    if( ![string isEqual:@""])
    {
        return true;
    }
    else
    {
        [self alertview:[NSString stringWithFormat:@"Please enter %@",tittle]];
        return false;
    }
}

+(BOOL)validateUsername:(NSString *)string :(NSString *)tittle
{
    if( ![string isEqual:@""])
    {
        NSString *abnRegex = @"[A-Za-z0-9]+"; // check for one or more occurrence of string you can also use * instead + for ignoring null value
        NSPredicate *abnTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", abnRegex];
        BOOL isValid = [abnTest evaluateWithObject:string];
        if(isValid)
        {
            //			if(!((string.length < 6)||(string.length > 20)))
            //				{
            //
            //				}
            //			else
            //				{
            //				[self alertview:[NSString stringWithFormat:@"Please enter %@ in the range 6-20 characters ",tittle]];
            //				return false;
            //				}
            return true;
        }
        else
        {
            [self alertview:[NSString stringWithFormat:@"Please enter valid %@ ",tittle]];
            return false;
        }
        
    }
    else
    {
        [self alertview:[NSString stringWithFormat:@"Please enter %@",tittle]];
        return false;
    }
}

+(BOOL)validatePassword:(NSString *)string :(NSString *)tittle
{
    
    if( ![string isEqual:@""])
    {
        return true;
        
    }
    else
    {
        [self alertview:[NSString stringWithFormat:@"Please enter %@",tittle]];
        return false;
    }
}

+(BOOL)validateName:(NSString *)string :(NSString *)tittle
{
    if( ![string isEqual:@""])
    {
        return true;
    }
    else
    {
        [self alertview:[NSString stringWithFormat:@"Please enter %@",tittle]];
        return false;
    }
}

+ (BOOL)validateRelation:(NSString *)string :(NSString *)title
{
    if( ![string isEqual:@""])
    {
        return true;
    }
    else
    {
        [self alertview:[NSString stringWithFormat:@"Please enter %@",title]];
        return false;
    }
}

+(BOOL)validateNumber:(NSString *)string :(NSString *)tittle
{
    if( ![string isEqual:@""])
    {
        NSString *abnRegex = @"[0-9]+";
        
        // check for one or more occurrence of string you can also use * instead + for ignoring null value
        NSPredicate *abnTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", abnRegex];
        BOOL isValid = [abnTest evaluateWithObject:string];
        if(isValid)
        {
            if([tittle isEqualToString:@"promised time"])
            {
                
                NSRange range = [string rangeOfString:@"-"];
                if (range.location != NSNotFound)
                {
                    NSUInteger numberOfOccurrences = [[string componentsSeparatedByString:@"-"] count]-1;
                    
                    if(numberOfOccurrences > 1)
                    {
                        [self alertview:[NSString stringWithFormat:@"Please enter valid %@ ",tittle]];
                        return false;
                    }
                    else{
                        
                        NSArray* testArray2 = [string componentsSeparatedByString:@"-"];
                        
                        if([[testArray2 objectAtIndex:0]integerValue] >= [[testArray2 objectAtIndex:1]integerValue])
                        {
                            [self alertview:[NSString stringWithFormat:@"Please enter  valid %@ ",tittle]];
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    }
                    
                    
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }
        else
        {
            [self alertview:[NSString stringWithFormat:@"Please enter  valid %@ ",tittle]];
            return false;
        }
    }
    else
    {
        
        [self alertview:[NSString stringWithFormat:@"Please enter %@",tittle]];
        return false;
    }
}


+(void)alertview:(NSString *)msg
{
    BOOL showAlert=YES;
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        NSArray* subviews = window.subviews;
        if ([subviews count] > 0){
            if ([[subviews objectAtIndex:0] isKindOfClass:[UIAlertView class]])
            {    showAlert= YES;
            }
            else{
                showAlert=NO;
            }
        }
    }
    
    if (!showAlert) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];
    }
    
    
    
}


+(UIView *)LoadingView:(CGRect)frame{

    UIView *bgTransparentView=[[UIView alloc]initWithFrame:frame];
    bgTransparentView.backgroundColor=[UIColor clearColor];

    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = bgTransparentView.center;
    [indicator startAnimating];
    
//   UIImageView* loader = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , 60, 60)];
//    loader.center=bgTransparentView.center;
//    loader.backgroundColor=[UIColor clearColor];
//    loader.contentMode=UIViewContentModeScaleAspectFit;
//    loader.animationImages = [NSArray arrayWithObjects:
//                              [UIImage imageNamed:@"loading_red_0.png"],[UIImage imageNamed:@"loading_red_1.png"],
//                              [UIImage imageNamed:@"loading_red_2.png"],[UIImage imageNamed:@"loading_red_3.png"],
//                              [UIImage imageNamed:@"loading_red_4.png"],[UIImage imageNamed:@"loading_red_5.png"],
//                              [UIImage imageNamed:@"loading_red_6.png"], [UIImage imageNamed:@"loading_red_7.png"],
//                              [UIImage imageNamed:@"loading_red_8.png"], [UIImage imageNamed:@"loading_red_9.png"],
//                              [UIImage imageNamed:@"loading_red_10.png"], [UIImage imageNamed:@"loading_red_11.png"],
//                              [UIImage imageNamed:@"loading_red_12.png"], [UIImage imageNamed:@"loading_red_13.png"],
//                              [UIImage imageNamed:@"loading_red_14.png"], [UIImage imageNamed:@"loading_red_15.png"],
//                              [UIImage imageNamed:@"loading_red_16.png"], [UIImage imageNamed:@"loading_red_17.png"],
//                              [UIImage imageNamed:@"loading_red_18.png"], [UIImage imageNamed:@"loading_red_19.png"],
//                             nil];
//    loader.animationDuration = 1.0;
//    loader.animationRepeatCount = 0;
//    loader.layer.opacity=1.0;
//    [loader startAnimating];
    [bgTransparentView addSubview:indicator];
    
    
    return bgTransparentView;



}
+(UIView *)showpopUpView:(NSString *)withTitleString withLeftButton:(NSString *)leftButtonTitle withRightTitle:(NSString *)rightButtonTitle withLeftButtonSelector:(SEL)leftSelector withRightButtonSelector:(SEL)rightButtonSeletor withTarget:(id)target withViewFrame:(CGRect )frame{
    
    UIView *bgTransparentView=[[UIView alloc]initWithFrame:frame];
    bgTransparentView.backgroundColor=[UIColor clearColor];
    
    UIView *centreView=[[UIView alloc]initWithFrame:frame];
    
    UIImageView* loader = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , 60, 60)];
    loader.center=bgTransparentView.center;
    loader.backgroundColor=[UIColor clearColor];
    loader.contentMode=UIViewContentModeScaleAspectFit;
    
    
    UILabel *lbl=[[UILabel alloc]initWithFrame:frame];
    lbl.text=withTitleString;
//    lbl.font=[UIFont fontWithName:@"" size:<#(CGFloat)#>];
    
    
    [bgTransparentView addSubview:centreView];
    
    return bgTransparentView;

}

+(CGFloat )getHeightForDescriptionLabel:(NSString *)string withMaxSize:(float)widthOfLabel{
    
    string=[string stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont fontWithName:@"Montserrat-Light" size:14.0f],
                                 NSParagraphStyleAttributeName : paragraph};
    CGSize constrainedSize = CGSizeMake(widthOfLabel, NSIntegerMax);
    CGRect rect = [string boundingRectWithSize:constrainedSize
                                             options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                          attributes:attributes context:nil];
    

    
    return rect.size.height;
}
//+(UIView *)showpopUpView:(NSString *)leftButtonTitle withRightTitle:(NSString *)rightButtonTitle withLeftButtonSelector:(SEL)leftSelector withRightButtonSelector:(SEL)rightButtonSeletor withTarget:(id)target{
//
//
//
//}






@end
