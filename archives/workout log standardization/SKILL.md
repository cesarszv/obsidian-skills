---
name: workout log standardization
description: Standardize raw gym notes and Spanish shorthand into machine-readable English markdown logs. Use when converting informal fitness tracking, handwritten notes, or Spanish workout records into structured vault data.
---

# Workout Log Standardization Skill

This skill enables agents to transform raw, informal workout notes (often in Spanish shorthand) into clean, standardized English markdown files suitable for data analysis and vault integration.

## Overview

Raw workout logs often contain:
- Mixed language (Spanish shorthand + English)
- Inconsistent formatting
- Abbreviations and shorthand
- Missing structure

This skill converts them into:
- Consistent English terminology
- Machine-readable markdown
- Proper YAML frontmatter
- Standardized measurement formats

## File Requirements

| Element | Format | Example |
|---------|--------|---------|
| **Filename** | `YYYY-MM-DD workout.md` | `2026-01-24 workout.md` |
| **Frontmatter** | YAML with date and tags | See below |

### Frontmatter Template

```yaml
---
date: YYYY-MM-DD
tags:
  - cszv/workout/YYYY
---
```

---

## Format A: Strength Training

For weight training, machine exercises, or resistance work.

### Structure

```markdown
# Exercise Name

Rest: [X] [minutes/seconds] between sets

- [Number] repetitions @ [Weight]
- [Number] repetitions @ [Weight]
- [Number] repetitions @ [Weight]
```

### Element Specifications

| Element | Format | Notes |
|---------|--------|-------|
| **Header** | `# Exercise Name` | H1 only. Title Case. American English. |
| **Rest** | `Rest: X minutes between sets` | Use "minutes" or "seconds". Full words. |
| **Blank Line** | Required | After Rest line, before sets. |
| **Set Line** | `- [N] repetitions @ [Weight]` | Use `repetitions` (not "reps"). |
| **Weight** | `@ [Weight]` | Use `@` separator. Specify unit (kg, lbs). |
| **Bar Only** | `@ bar only` | Lowercase "bar only". |
| **Barbell + Weight** | `@ bar + [X]kg` | Format: `bar + Xkg`. |

### Spanish → English Translation Table

| Spanish Input | English Output |
|---------------|----------------|
| `descanso`, `desc` | `Rest` |
| `mins`, `minutos` | `minutes` |
| `segs`, `segundos` | `seconds` |
| `reps`, `repeticiones` | `repetitions` |
| `barra`, `solo barra` | `bar only` |
| `barra +` | `bar +` |
| `Press de banca` | `Bench Press` |
| `Máquina de pecho` | `Pec Fly Machine` |
| `Polea de tríceps` | `Triceps Press Down` |
| `Jalón al pecho` | `Lat Pulldown` |
| `Remo sentado` | `Seated Cable Row` |
| `Curl con barra` | `Barbell Curl` |
| `Curl martillo` | `Hammer Curls` |
| `Sentadilla` | `Squat` |
| `Peso muerto` | `Deadlift` |
| `Prensa de piernas` | `Leg Press` |
| `Extensión de cuádriceps` | `Leg Extension` |
| `Curl de piernas` | `Leg Curl` |
| `Elevación de pantorrillas` | `Calf Raise` |

### Transformation Example

**Input (raw Spanish):**

```text
## Press de banca
2 mins descanso
12reps x barra
12 reps x barra + 10kg
12reps x barra + 15kg
```

**Output (standardized):**

```markdown
# Bench Press

Rest: 2 minutes between sets

- 12 repetitions @ bar only
- 12 repetitions @ bar + 10kg
- 12 repetitions @ bar + 15kg
```

---

## Format B: Cardio / Machine Data

For treadmill, bike, stair climber, or equipment with electronic metrics.

### Structure

```markdown
- **[Duration] of [Equipment Name] ([Brand/Model if available])**
    - [Metric]: [Value] [Unit]
    - [Metric]: [Value] [Unit]
    - ...
```

### Element Specifications

| Element | Format | Notes |
|---------|--------|-------|
| **Main Item** | `- **Xmin of [Equipment]**` | Bold. Duration first. |
| **Sub-metrics** | Indented with 4 spaces | Use `    -` (4 spaces + dash). |
| **Metric Line** | `- [Metric]: [Value] [Unit]` | Capitalize metric names. |
| **Units** | Keep original units | MPH, kph, km, cal, etc. |

### Spanish → English Translation Table

| Spanish | English |
|---------|---------|
| `Tiempo` | `Time` |
| `Distancia` | `Distance` |
| `Calorías` | `Calories` |
| `Velocidad` | `Speed` |
| `Velocidad media` | `Average Speed` |
| `Velocidad máxima` | `Max Speed` |
| `Promedio vatios` | `Average Watts` |
| `Máximos vatios` | `Max Watts` |
| `Tasa de quema` | `Burn Rate` |
| `Nivel` | `Level` |
| `millas` | `miles` |
| `minutos` | `minutes` |
| `cal/hora` | `cal/hour` |

### Transformation Example

**Input (raw Spanish):**

```text
10 minutos de bici estática (LifeCycle GX)
Level: 13
RPM: 58
Velocidad: 18.3 MPH
Distancia: 3.0 millas
Calorías: 136 cal
Tasa de quema: 805 cal/hora
```

**Output (standardized):**

```markdown
- **10 minutes of Stationary Bike (LifeCycle GX)**
    - Level: 13
    - RPM: 58
    - Speed: 18.3 MPH
    - Distance: 3.0 miles
    - Calories: 136 cal
    - Burn Rate: 805 cal/hour
```

---

## Quick Reference

| Category | Format |
|----------|--------|
| **Weight** | `20kg` (no space) • `bar only` • `bar + 10kg` • `bodyweight` |
| **Rest** | `2 mins` → `2 minutes` • `90s` → `90 seconds` |
| **Multiple exercises** | Separate with blank line. No `---` dividers. |
| **Filename** | `YYYY-MM-DD workout.md` (space before workout) |

---

## Validation Checklist

Before finalizing a standardized log:

- [ ] **Filename** — Follows `YYYY-MM-DD workout.md` format
- [ ] **Frontmatter** — Contains `date` and `tags: cszv/workout/YYYY`
- [ ] **Exercise names** — Title Case, American English
- [ ] **Terminology** — Uses `repetitions` (not "reps")
- [ ] **Weight format** — Uses `@` separator with proper units
- [ ] **Rest format** — Full words ("minutes", "seconds")
- [ ] **No dividers** — Blank lines only, no `---` between exercises
- [ ] **Cardio indentation** — 4 spaces for sub-metrics

---

## References

- [Obsidian Properties Documentation](https://help.obsidian.md/properties)
- [YAML Frontmatter Syntax](https://help.obsidian.md/properties)
