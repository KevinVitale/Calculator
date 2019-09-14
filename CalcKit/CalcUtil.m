#import "CalcUtil.h"

NSString * const kCalcErrorDomain = @"CalculatorErrorDomain";
NSString *const CalcInvalidInputErrorKey = @"InvalidInput";
NSString *const CalcInvalidNumberFormatterStyleErrorKey = @"InvalidNumberFormatterStyle";

/**
 */
@implementation NSString (Utilities)
- (NSArray<NSDecimalNumber*>* _Nullable )decimalsUsingFormatter:(NSNumberFormatter*)numberFormatter
                                               separatingString:(NSString*)separator
                                                          error:(NSError**)error {
    // Assert
    if (numberFormatter.numberStyle != NSNumberFormatterDecimalStyle) {
        // Generate ERROR.
        if (error != NULL) {
            *error = [NSError.alloc initWithDomain:kCalcErrorDomain
                                              code:0
                                          userInfo:@{
                                             NSLocalizedDescriptionKey : @"Number formatter must have style: \"NSNumberFormatterDecimalStyle\"."
                                           , CalcInvalidNumberFormatterStyleErrorKey : @(NSNumberFormatterDecimalStyle)
                                          }];
        }
        return nil;
    }
    
    // Result
    NSMutableArray<NSDecimalNumber*>* _Nullable __block result = [@[] mutableCopy];

    // Separate
    NSArray<NSString*>* components = [self componentsSeparatedByString:separator];

    // Map
    NSError* __block inputError = nil;
    [components enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber* number = [numberFormatter numberFromString: obj];

        // Validate output.
        if (!number) {
            // Be sure to STOP.
            *stop = YES;

            // 'nil' out RESULTS.
            result = nil;

            // Generate ERROR.
            inputError = [NSError.alloc initWithDomain:kCalcErrorDomain
                                                  code:0
                                              userInfo:@{
                                                 NSLocalizedDescriptionKey : @"Invalid string input."
                                               , CalcInvalidInputErrorKey : obj
                                          }];
        }

        if (!*stop) {
            [result addObject: [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue]];
        }
    }];
    
    // Propagate ERROR.
    if (error != NULL && inputError) {
        *error = inputError;
    }

    return result;
}
@end
