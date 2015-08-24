//
//  UIImage+OverrideableXCAssets.h
//
//  Created by Rafael Nobre on 21/08/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (OverrideableXCAssets)

/**
 *  Inform the currently used override prefix for image loading operations. Default is "override_"
 *  @return the current prefix
 */
+(NSString*)xcassetsOverridePrefix;

/**
 *  Use this method to use a new override prefix
 *  @param prefix the new prefix
 */
+(void)setXcassetsOverridePrefix:(NSString*)prefix;

@end
