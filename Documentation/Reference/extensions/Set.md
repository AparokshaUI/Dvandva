**EXTENSION**

# `Set`
```swift
extension Set where Element == Edge
```

## Properties
### `all`

```swift
public static var all: Self
```

A set of the vertical and horizontal edges.

### `vertical`

```swift
public static var vertical: Self
```

A set of the top and bottom edge.

### `horizontal`

```swift
public static var horizontal: Self
```

A set of the leading and trailing edge.

### `top`

```swift
public static var top: Self
```

A set of the top edge.

### `bottom`

```swift
public static var bottom: Self
```

A set of the bottom edge.

### `leading`

```swift
public static var leading: Self
```

A set of the leading edge.

### `trailing`

```swift
public static var trailing: Self
```

A set of the trailing edge.

## Methods
### `add(_:)`

```swift
public func add(_ edges: Self) -> Self
```

Combine two sets of edges.
- Parameter edges: The edges.
- Returns: The combined set of edges.

#### Parameters

| Name | Description |
| ---- | ----------- |
| edges | The edges. |