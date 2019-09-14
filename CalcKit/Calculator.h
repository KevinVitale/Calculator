@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/**
 A calculator. It does math.
 */
@interface Calculator: NSObject
- (instancetype)init;
- (instancetype)initWithNumberFormatter:(NSNumberFormatter*)numberFormatter NS_DESIGNATED_INITIALIZER;
@end

/**

 */
@interface Calculator (Arithmetic)
/**
 Elementary arithmatic: multiplication.

 @param input A comma separated string of integers.
 @param error A pointer to an error object; pass `nil` to ignore errors.
 
 @warning   If an error occurs, the message returns a 'nil' value.
 @note      Errors occur if format of `input` is incorrect or otherwise
            malformed.
 
 @return    The product of `input`, or 'nil'.
 @seealso   https://en.wikipedia.org/wiki/Multiplication
 */
- (NSNumber* _Nullable)multiply:(NSString*)input error:(NSError** _Nullable)error;

/**
 Elementary arithmatic: dividing.

 @param input A comma separated string of integers.
 @param error A pointer to an error object; pass `nil` to ignore errors.
 
 @warning   If an error occurs, the message returns a 'nil' value.
 @note      Errors occur if format of `input` is incorrect or otherwise
            malformed.
 
 @return    The quotient of `input`, or 'nil'.
 @seealso   https://en.wikipedia.org/wiki/Division_(mathematics)
 */
- (NSNumber* _Nullable)divide:(NSString*)input error:(NSError**)error;

/**
 Elementary arithmatic: adding.

 @param input A comma separated string of integers.
 @param error A pointer to an error object; pass `nil` to ignore errors.
 
 @warning   If an error occurs, the message returns a 'nil' value.
 @note      Errors occur if format of `input` is incorrect or otherwise
            malformed.
 
 @return    The sum of `input`, or 'nil'.
 @seealso   https://en.wikipedia.org/wiki/Addition
 */
- (NSNumber* _Nullable)add:(NSString*)input error:(NSError**)error;

/**
 Elementary arithmatic: subtracting.

 @param input A comma separated string of integers.
 @param error A pointer to an error object; pass `nil` to ignore errors.
 
 @warning   If an error occurs, the message returns a 'nil' value.
 @note      Errors occur if format of `input` is incorrect or otherwise
            malformed.
 
 @return    The difference of `input`, or 'nil'.
 @seealso   https://en.wikipedia.org/wiki/Subtraction
 */
- (NSNumber* _Nullable)subtract:(NSString*)input error:(NSError**)error;
@end

extern NSString *const kCalcErrorDomain;
extern NSString *const CalcInvalidInputErrorKey;
extern NSString *const CalcInvalidNumberFormatterStyleErrorKey;

NS_ASSUME_NONNULL_END
