#import "Calculator+Private.h"
#import "CalcUtil.h"

/**
 */
@implementation Calculator
@synthesize numberFormatter;

/**
 */
- (instancetype)init {
    return (self = [self initWithNumberFormatter:[Calculator defaultNumberFormatter]]);
}

/**
 */
- (instancetype)initWithNumberFormatter:(NSNumberFormatter*)numberFormatter {
    if (self = [super init]) {
        self.numberFormatter = numberFormatter;
    }
    return self;
}

/**
 */
+ (NSNumberFormatter *)defaultNumberFormatter {
    NSNumberFormatter *defaultFormatter = [NSNumberFormatter.alloc init];
    defaultFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    return defaultFormatter;
}


/**
 */
- (void)enumerateInput:(NSString*)input
         withOperation:(void (NS_NOESCAPE ^)(NSDecimalNumber* num, NSUInteger idx, BOOL *stop))block
                 error:(NSError**)error {
    // Parse numbers.
    NSArray<NSDecimalNumber*>* _Nullable factors = [input decimalsUsingFormatter:numberFormatter
                                                                separatingString:@","
                                                                           error:error];

    // Bail on ERROR.
    if (*error != nil) {
        return;
    }

    [factors enumerateObjectsUsingBlock:block];
}

/**
 */
- (NSNumber* _Nullable)calculateInput:(NSString*)input
                 performingArithmetic:(NSDecimalNumber* (NS_NOESCAPE ^)(NSDecimalNumber*result, NSDecimalNumber* num))arithmetic
                                error:(NSError**)error {
    // Check for empty `input`.
    if (!input.length) {
        return @0;
    }

    // Compute result.
    NSDecimalNumber *_Nullable __block result = nil;

    // Compute from input.
    NSError* __block arithmeticError = nil;
    [self enumerateInput:input
           withOperation:^(NSDecimalNumber *num, NSUInteger idx, BOOL *stop) {
               // First pass.
               if (!result) {
                   result = [num copy];
               }
               // Perform `arithmetic`, and accumulate result.
               else {
                   @try { result = arithmetic(result, num); }
                   @catch (NSException *exception) {
                       // Generate an error.
                       arithmeticError = [NSError.alloc initWithDomain:exception.name
                                                                  code:0
                                                              userInfo:exception.userInfo];
                       // Stop enumerating.
                       *stop = YES;
                   }
               }
           }
                   error:error];

    // Check for arithmetic error (likely, 'divide by zero').
    if (arithmeticError) {
        *error = arithmeticError;
    }

    // Bail on ERROR.
    if (*error != nil) {
        return nil;
    }

    return result;
}
@end
