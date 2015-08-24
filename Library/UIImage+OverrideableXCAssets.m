//
//  UIImage+OverrideableXCAssets.m
//
//  Created by Rafael Nobre on 21/08/15.
//
//

#import "UIImage+OverrideableXCAssets.h"
#import <JRSwizzle.h>

static NSString *_xcassetsOverridePrefix = @"override_";

static inline NSString* overridenName(NSString *name);

@implementation UIImage (OverrideableXCAssets)

+(void)load {
    NSError *error;
    if (![self jr_swizzleClassMethod:@selector(imageNamed:) withClassMethod:@selector(imageNamedReplacement:) error:&error]) {
        NSLog(@"Error swizzling UIImage imageNamed: %@", [error localizedDescription]);
    }
    if (![self jr_swizzleClassMethod:@selector(imageNamed:inBundle:compatibleWithTraitCollection:) withClassMethod:@selector(imageNamedReplacement:inBundle:compatibleWithTraitCollection:) error:&error]) {
        NSLog(@"Error swizzling UIImage imageNamed: %@", [error localizedDescription]);
    }
}

+ (UIImage*)imageNamedReplacement:(NSString *)name {
    UIImage *image = [self imageNamedReplacement:overridenName(name)];
    if (!image) {
        image = [self imageNamedReplacement:name];
    }
    return image;
}

+ (UIImage*)imageNamedReplacement:(NSString *)name inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection {
    UIImage *image = [self imageNamedReplacement:overridenName(name) inBundle:bundle compatibleWithTraitCollection:traitCollection];
    if (!image) {
        image = [self imageNamedReplacement:name inBundle:bundle compatibleWithTraitCollection:traitCollection];
    }
    return image;
}

+ (NSString*)xcassetsOverridePrefix {
    return _xcassetsOverridePrefix;
}

+ (void)setXcassetsOverridePrefix:(NSString*)prefix {
    _xcassetsOverridePrefix = [prefix copy];
}

@end

static NSString* overridenName(NSString *name) {
    return [_xcassetsOverridePrefix stringByAppendingString:name];
}