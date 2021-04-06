import MyMathFramework.MyMathFramework_Private

public enum MyMathReturnCode {
    case MATH_RETURN_CODE_OK
    case MATH_RETURN_CODE_UNKNOWN_ERROR
    case MATH_RETURN_CODE_OVERFLOW
    case MATH_RETURN_CODE_DIVISION_BY_ZERO
}

private func handle_return_code(_ return_code: mymath_return_code) -> MyMathReturnCode {
    switch return_code {
    case mymath_return_code.init(rawValue: 0):
        return MyMathReturnCode.MATH_RETURN_CODE_OK
    case mymath_return_code.init(rawValue: 1):
        return MyMathReturnCode.MATH_RETURN_CODE_OVERFLOW
    case mymath_return_code.init(rawValue: 2):
        return MyMathReturnCode.MATH_RETURN_CODE_DIVISION_BY_ZERO
    default:
        return MyMathReturnCode.MATH_RETURN_CODE_UNKNOWN_ERROR
    }
}

public func add(result: inout Int32, a: Int32, b: Int32) -> MyMathReturnCode {
    return handle_return_code(mymath_add(&result, a, b))
}

public func subtract(result: inout Int32, a: Int32, b: Int32) -> MyMathReturnCode {
    return handle_return_code(mymath_subtract(&result, a, b))
}

public func multiply(result: inout Int32, a: Int32, b: Int32) -> MyMathReturnCode {
    return handle_return_code(mymath_multiply(&result, a, b))
}

public func divide(result: inout Int32, a: Int32, b: Int32) -> MyMathReturnCode {
    return handle_return_code(mymath_divide(&result, a, b))
}
