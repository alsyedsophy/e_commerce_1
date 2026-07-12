# Design System

## Principle
Every UI element must use the Design System.
Never hardcode visual values.

## Colors
Use color tokens only.
Examples:
- primary
- secondary
- surface
- background
- error
- success
- warning
Never use Color(...) inside Widgets.

## Typography
Use predefined text styles.
Examples:
- displayLarge
- headlineMedium
- titleLarge
- bodyLarge
- bodyMedium
- labelMedium
Never create TextStyle inline.

## Spacing
Use spacing tokens.
Examples:
xs
sm
md
lg
xl
Never use magic numbers like:
13
17
29

## Radius
Use radius tokens.
Examples:
sm
md
lg
full

## Elevation
Use predefined elevation values.
Avoid arbitrary elevations.

## Icons
Use Material Symbols by default.
Use custom icons only when required.

## Components
Shared UI belongs in the Design System.
Examples:
- AppButton
- AppTextField
- AppCard
- AppDialog
- AppLoading
Do not duplicate shared components.

## Themes
Every component must support:
- Light Theme
- Dark Theme
No exceptions.