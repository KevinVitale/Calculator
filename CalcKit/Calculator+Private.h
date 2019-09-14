#ifndef Calculator_Private_h
#define Calculator_Private_h

#import "Calculator.h"

NS_ASSUME_NONNULL_BEGIN

/**
 */
@interface Calculator ()
///
@property (copy) NSNumberFormatter *numberFormatter;

/**
 */
- (NSNumber* _Nullable)calculateInput:(NSString*)input
                 performingArithmetic:(NSDecimalNumber* (NS_NOESCAPE ^)(NSDecimalNumber*result, NSDecimalNumber* num))arithmetic
                                error:(NSError**)error;

/**
 */
+ (NSNumberFormatter*)defaultNumberFormatter;
@end

NS_ASSUME_NONNULL_END

#endif /* Calculator_Private_h */
