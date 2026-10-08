---
name: Kinetic Pulse
colors:
  surface: '#111316'
  surface-dim: '#111316'
  surface-bright: '#37393d'
  surface-container-lowest: '#0c0e11'
  surface-container-low: '#1a1c1f'
  surface-container: '#1e2023'
  surface-container-high: '#282a2d'
  surface-container-highest: '#333538'
  on-surface: '#e2e2e6'
  on-surface-variant: '#b9cbbe'
  inverse-surface: '#e2e2e6'
  inverse-on-surface: '#2f3034'
  outline: '#849589'
  outline-variant: '#3b4a40'
  surface-tint: '#00e296'
  primary: '#b6ffd4'
  on-primary: '#003822'
  primary-container: '#00f0a0'
  on-primary-container: '#006843'
  inverse-primary: '#006c46'
  secondary: '#ffb59d'
  on-secondary: '#5d1900'
  secondary-container: '#b83900'
  on-secondary-container: '#ffddd2'
  tertiary: '#d0f6ff'
  on-tertiary: '#00363e'
  tertiary-container: '#53e5ff'
  on-tertiary-container: '#006472'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#4dffb2'
  primary-fixed-dim: '#00e296'
  on-primary-fixed: '#002112'
  on-primary-fixed-variant: '#005234'
  secondary-fixed: '#ffdbd0'
  secondary-fixed-dim: '#ffb59d'
  on-secondary-fixed: '#390c00'
  on-secondary-fixed-variant: '#832600'
  tertiary-fixed: '#a2eeff'
  tertiary-fixed-dim: '#2fd9f4'
  on-tertiary-fixed: '#001f25'
  on-tertiary-fixed-variant: '#004e5a'
  background: '#111316'
  on-background: '#e2e2e6'
  surface-variant: '#333538'
typography:
  display-lg:
    fontFamily: Lexend
    fontSize: 56px
    fontWeight: '700'
    lineHeight: 64px
    letterSpacing: -0.03em
  display-lg-mobile:
    fontFamily: Lexend
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Lexend
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Lexend
    fontSize: 26px
    fontWeight: '600'
    lineHeight: 34px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Lexend
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
  title-lg:
    fontFamily: Manrope
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  title-md:
    fontFamily: Manrope
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 22px
  body-lg:
    fontFamily: Manrope
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Manrope
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-lg:
    fontFamily: Lexend
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 18px
    letterSpacing: 0.02em
  label-md:
    fontFamily: Lexend
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.04em
  label-sm:
    fontFamily: Lexend
    fontSize: 10px
    fontWeight: '500'
    lineHeight: 14px
    letterSpacing: 0.05em
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-tablet: 1.5rem
  gutter-desktop: 2rem
  margin: 1rem
  margin-tablet: 2rem
  margin-desktop: 3rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2.25rem
---

## Brand & Style

The design system establishes a high-performance, accessible, and motivating atmosphere tailored for mobile-first fitness tracking. The core personality is encouraging, precise, and vital—balancing clinical metric clarity with personal achievement euphoria. 

The aesthetic synthesizes Material 3 expressive surface architecture with high-vitality athletic styling:
- **Clean Neutral Foundations:** Soft, distraction-free structural planes ensure vital stats stand out instantly under bright gym lights or direct outdoor sunlight.
- **Electric Biometric Accents:** High-energy electric emerald teal drives interaction points and achievement states, paired with an active kinetic orange accent for exertion, streaks, and heart-rate peaks.
- **Approachable Geometry:** Generously rounded container surfaces (`rounded-2xl` to `rounded-3xl`) and pill elements strip away intimidations of complex workout data, making metric onboarding effortless for beginners.

## Colors

The design system relies on a rich, low-strain dark default theme optimized for OLED battery conservation and high-contrast indoor/outdoor readability. 

- **Primary (`#00F0A0` - Hyper Emerald):** Communicates active progression, biometric health, completion, and primary tap targets. Delivers optimal luminance against deep slate surfaces.
- **Secondary (`#FF6B35` - Kinetic Orange):** Highlights exertion strain, calories burned, active heart zones, and active streaks.
- **Tertiary (`#22D3EE` - Cyan Velocity):** Reserved for pace, cadence, recovery periods, and secondary biometric data streams.
- **Neutral Surface Ecosystem (`#121417` - Carbon):** Built with stepped surface-container layers (`#181B20`, `#22262C`, `#2D323A`) to establish tonal hierarchy without heavy border lines.
- **Content Contrast:** High-contrast text layers (`#F1F5F9` on high surfaces, `#94A3B8` for secondary labels) conform strictly to WCAG 2.1 AAA for numeric legibility during motion.

## Typography

The type system pairs **Lexend** for headlines, numeric callouts, and interactive chips with **Manrope** for analytical copy and system guidance:

- **Lexend:** Developed explicitly to reduce visual stress and optimize rapid cognitive processing. Used across primary data indicators, metrics, timestamps, and bold titles so workout metrics are identifiable at a glance while in motion.
- **Manrope:** A geometric, balanced grotesk providing seamless reading comfort for workout explanations, coach tips, and nutrition logs.
- **Numeric Hierarchy:** When displaying dynamic real-time metrics (e.g., active pace, reps, heart rate), utilize tabular figures (`tnum`) in Lexend to avoid horizontal jitters during active tracking.

## Layout & Spacing

A mobile-first fluid grid prioritizes ergonomic one-hand reachability and thumb-zone accessibility:

- **Hand-Zone Distribution:** Primary action buttons, active workout triggers, and metric tabs sit comfortably in the lower 40% of the display viewport.
- **Adaptive Breakpoints:**
  - **Compact (Mobile: < 600px):** Single-column stack, 16px lateral canvas margins, 16px fluid gutters. Dense data modules reflow into horizontal scrolling metric carousels.
  - **Medium (Tablet / Foldable: 600px–1023px):** 8-column layout, 24px margins and gutters. Biometric graphs sit adjacent to set/rep split logs.
  - **Expanded (Desktop / Web Portal: ≥ 1024px):** 12-column layout capped at 1200px container width. Multi-pane dashboard architecture (summary, workout log, calendar).
- **Rhythm Principles:** Strict 4px/8px incremental rhythm keeps metric badges and cards balanced while leaving breathing room around primary targets.

## Elevation & Depth

Visual hierarchy leverages Material 3 tonal layering combined with subtle luminous diffusion:

- **Tonal Layering:** Depth is primarily defined by lightness steps rather than drop shadows:
  - `Surface 0` (`#121417`): Viewport background.
  - `Surface 1` (`#181B20`): Page-level groupings and canvas containers.
  - `Surface 2` (`#22262C`): Metric cards, activity panels, and list rows.
  - `Surface 3` (`#2D323A`): Floating controls, bottom sheets, and elevated dialogs.
- **Luminous Atmospheric Shadows:** On elevated cards and dynamic primary buttons, cast a subtle colored glow using low-opacity primary tokens (`rgba(0, 240, 160, 0.15)` blur: 16px, y: 6px).
- **Subtle Boundary Strokes:** Surfaces utilize faint 1px structural borders (`rgba(255, 255, 255, 0.07)`) to maintain component edges when transitioning across varied displays.

## Shapes

The design system embraces high-radius curvature inspired by smooth athletic curves and human biomechanics:

- **Pill Primitives (`rounded-full` / Level 3):** Buttons, interactive filter chips, badges, and progress bar caps take on full pill curvature.
- **Card Enclosures (`rounded-2xl` / `rounded-3xl`):** Primary metric tiles use 24px (`rounded-2xl`) to 32px (`rounded-3xl`) corner radiuses, generating an approachable and tactile surface aesthetic.
- **Consistency Rule:** Inner sub-elements (nested containers, progress tracks) inherit nested curvature rules (inner radius = outer radius minus container padding) to prevent geometric visual clash.

## Components

### Buttons
- **Primary Pill:** Full-width or inline pill (`height: 56px` for touch ergonomics). Solid Hyper Emerald background (`#00F0A0`) with deep charcoal text (`#08130E`) in Lexend 600. Luminous hover/active scaling states (0.98 scale factor on press).
- **Secondary / Action Pill:** Surface 3 fill (`#2D323A`), 1px outline (`rgba(255, 255, 255, 0.1)`), high-contrast white text.
- **Floating Action Bar:** Persistent floating capsule dock anchored 16px above the home indicator, containing core workout navigation.

### Metric Cards
- Rounded 24px (`rounded-2xl`) or 32px (`rounded-3xl`) using Surface 2 (`#22262C`). 
- Features integrated metric value (display-lg), trend pill badge (+12% vs last week), and a background mini-sparkline or circular progress ring.

### Chips & Filter Pills
- Compact 36px pill wrappers. Default state: Surface 1 background with secondary text. Active state: Primary Hyper Emerald fill with dark text or Cyan Velocity border glow.

### Form Inputs & Steppers
- Large-target inputs (`56px` height) with Surface 1 background and 16px corner radius. Focused state applies a 2px energetic teal ring.
- Rep/Weight stepper controls feature prominent `+` and `-` circular touch regions (minimum 48x48px target area).

### Circular Progress Rings & Biometrics
- Smooth, rounded stroke caps (`stroke-linecap: round`) representing daily movement goals (rings for Move, Exertion, Recovery) utilizing the primary emerald, kinetic orange, and cyan tokens.

### List Items & Log Entries
- Structured rounded-2xl container strips with clear iconography on the left, primary activity details centered, and completion checkmarks or elapsed time on the right. Separated by explicit `space-sm` gaps rather than divider lines.