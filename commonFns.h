//
//  commonFns.h

//
//  Created by Geetanjali Dwiwedi on 02/03/16.
//  Copyright © 2016 Geetanjali Dwiwedi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface commonFns : NSObject
+(BOOL)validateUsername:(NSString *)string :(NSString *)tittle;
+(BOOL)validatePassword:(NSString *)string :(NSString *)tittle;
+(BOOL)validateEmail:(NSString *)string :(NSString *)tittle;
+(BOOL)ValidatePhone:(NSString *)string :(NSString *)tittle;
+(BOOL)validateName:(NSString *)string :(NSString *)tittle;
+(BOOL)validateNumber:(NSString *)string :(NSString *)tittle;
+(BOOL)validatefieldnotempty:(NSString *)string :(NSString *)tittle;

+(UIView *)LoadingView:(CGRect)frame;
+(CGFloat )getHeightForDescriptionLabel:(NSString *)string withMaxSize:(float)widthOfLabel;

+(UIView *)showpopUpView:(NSString *)withTitleString withLeftButton:(NSString *)leftButtonTitle withRightTitle:(NSString *)rightButtonTitle withLeftButtonSelector:(SEL)leftSelector withRightButtonSelector:(SEL)rightButtonSeletor withTarget:(id)target withViewFrame:(CGRect )frame;

@end
