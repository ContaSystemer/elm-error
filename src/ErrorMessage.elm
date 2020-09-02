module ErrorMessage exposing (typeMismatch, internal, canNotInit, unexpectedMessageFromJs)

{-| The module contains helper functions for specific error messages.

@docs typeMismatch, internal, canNotInit, unexpectedMessageFromJs

-}

import JsData


{-| Joins error type with message
-}
toErrorString : String -> String -> String
toErrorString errorType message =
    errorType ++ ": " ++ message


{-| Returns error message for type mismatch
-}
typeMismatch : String -> String
typeMismatch =
    toErrorString "Type mismatch"


{-| Returns error message for internal error
-}
internal : String -> String
internal =
    toErrorString "Internal error"


{-| Return error message that given module could not be initialized with given item for given reason
-}
canNotInit : String -> String -> String -> String
canNotInit moduleName item =
    toErrorString ("Can not initialise " ++ moduleName ++ " with given " ++ item)


{-| Return internal error message about receiving unexpected message from JS
-}
unexpectedMessageFromJs : JsData.JsData -> String
unexpectedMessageFromJs =
    toErrorString "Unexpected message from JS" << JsData.toString
