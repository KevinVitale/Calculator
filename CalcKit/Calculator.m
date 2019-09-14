#import "Calculator+Private.h"

/**
 */
@implementation Calculator (Arithmetic)
/**
 */
- (NSNumber* _Nullable)multiply:(NSString*)input error:(NSError**)error {
    return [self calculateInput:input
           performingArithmetic:^(NSDecimalNumber *result, NSDecimalNumber *num) {
               return [result decimalNumberByMultiplyingBy:num];
           }
                          error:error];
}

/**
 */
- (NSNumber* _Nullable)divide:(NSString*)input error:(NSError**)error {
    return [self calculateInput:input
           performingArithmetic:^(NSDecimalNumber *result, NSDecimalNumber *num) {
               return [result decimalNumberByDividingBy:num];
           }
                          error:error];
}

/**
 */
- (NSNumber* _Nullable)add:(NSString*)input error:(NSError**)error {
    return [self calculateInput:input
           performingArithmetic:^(NSDecimalNumber *result, NSDecimalNumber *num) {
               return [result decimalNumberByAdding:num];
           }
                          error:error];
}

/**
 */
- (NSNumber* _Nullable)subtract:(NSString*)input error:(NSError**)error {
    return [self calculateInput:input
           performingArithmetic:^(NSDecimalNumber *result, NSDecimalNumber *num) {
               return [result decimalNumberBySubtracting:num];
           }
                          error:error];
}
@end
