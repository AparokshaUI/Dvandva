**ENUM**

# `Icon`

```swift
public enum Icon
```

An icon for widgets displaying icons.

## Cases
### `plus`

```swift
case plus
```

### `menu`

```swift
case menu
```

### `avatar`

```swift
case avatar
```

### `warning`

```swift
case warning
```

### `find`

```swift
case find
```

### `sidebar`

```swift
case sidebar
```

### `reload`

```swift
case reload
```

### `number`

```swift
case number
```

### `platformDependent(linux:mac:)`

```swift
case platformDependent(linux: String, mac: String)
```

An icon which has a different string for Linux and macOS.

### `platformIndependent(name:)`

```swift
case platformIndependent(name: String)
```

An icon which has the same string for Linux and macOS.

## Properties
### `iconName`

```swift
var iconName: String
```

A string representing an icon.
