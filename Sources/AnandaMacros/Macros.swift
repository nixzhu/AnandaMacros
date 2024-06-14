/// Generate initializer for an AnandaModel
@attached(member, names: named(init(json:)))
public macro AnandaInit() = #externalMacro(
    module: "AnandaMacrosProvider",
    type: "AnandaInitMacro"
)

/// Provides a raw key for decoding the property
@attached(peer)
public macro AnandaKey(_: String) = #externalMacro(
    module: "AnandaMacrosProvider",
    type: "AnandaKeyMacro"
)

/// Ignore this property from decoding
@attached(peer)
public macro AnandaIgnored() = #externalMacro(
    module: "AnandaMacrosProvider",
    type: "AnandaIgnoredMacro"
)
