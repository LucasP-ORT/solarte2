
# Project Blueprint

## Overview

This document outlines the project structure, design, and features of the Flutter application.

## Current State

### Style and Design

*   **Theme:** The application uses the default Material Design theme.
*   **Fonts:** Default fonts are used.
*   **Colors:** Default color scheme is used.

### Features

*   The application displays a basic "Hello World" screen.

## Current Request: Map and Totem Markers

### Plan

1.  **Add Dependencies:** Add `flutter_map`, `fl_chart`, and `latlong2` to `pubspec.yaml`.
2.  **Create Totem Chart Popup:** Create a new file `lib/totem_chart_popup.dart` to display the charts for each totem. This will include placeholder data for "Current Charge", "Energy Generated", and "Energy Consumed".
3.  **Implement Map Screen:**
    *   Modify `lib/main.dart` to be the main map screen.
    *   Use `flutter_map` to display an OpenStreetMap tile layer.
    *   Create a list of totem markers with placeholder coordinates.
    *   When a marker is tapped, show the `TotemChartPopup` with the corresponding totem's data.
