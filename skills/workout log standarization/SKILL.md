---
name: workout log standarization
description: standardizes raw gym notes and spanish shorthand into machine-readable english markdown logs. use when converting informal fitness tracking into structured vault data.
---

# Workout Log Standardization

## File Requirements

**Filename:** `YYYY-MM-DD workout.md` (lowercase, space before `workout`)

**Frontmatter:** Required. Copy exactly:

```yaml
---
date: YYYY-MM-DD
tags:
  - cszv/workout/YYYY
---
```

## Format A: Strength Training

For weight training, machine exercises, or resistance work.

**Structure:**

```markdown
# Exercise Name

Rest: [X] [minutes/seconds] between sets

- [Number] repetitions @ [Weight]
- [Number] repetitions @ [Weight]
- [Number] repetitions @ [Weight]
```

| Element              | Format                         | Notes                                      |
| -------------------- | ------------------------------ | ------------------------------------------ |
| **Header**           | `# Exercise Name`              | H1 only. Title Case. American English.     |
| **Rest**             | `Rest: X minutes between sets` | Use "minutes" or "seconds". Full words.    |
| **Blank Line**       | Required                       | After Rest line, before sets.              |
| **Set Line**         | `- [N] repetitions @ [Weight]` | Use `repetitions` (not "reps").            |
| **Weight**           | `@ [Weight]`                   | Use `@` separator. Specify unit (kg, lbs). |
| **Bar Only**         | `@ bar only`                   | Lowercase "bar only".                      |
| **Barbell + Weight** | `@ bar + [X]kg`                | Format: `bar + Xkg`.                       |

**Spanish → English:**

| Spanish Input          | English Output       |
| ---------------------- | -------------------- |
| `descanso`, `desc`     | `Rest`               |
| `mins`, `minutos`      | `minutes`            |
| `segs`, `segundos`     | `seconds`            |
| `reps`, `repeticiones` | `repetitions`        |
| `barra`, `solo barra`  | `bar only`           |
| `barra +`              | `bar +`              |
| `Press de banca`       | `Bench Press`        |
| `Máquina de pecho`     | `Pec Fly Machine`    |
| `Polea de tríceps`     | `Triceps Press Down` |
| `Jalón al pecho`       | `Lat Pulldown`       |
| `Remo sentado`         | `Seated Cable Row`   |
| `Curl con barra`       | `Barbell Curl`       |
| `Curl martillo`        | `Hammer Curls`       |

**Example Input:**

```text
## Press de banca
2 mins descanso
12reps x barra
12 reps x barra + 10kg
12reps x barra + 15kg
```

**Output:**

```markdown
# Bench Press

Rest: 2 minutes between sets

- 12 repetitions @ bar only
- 12 repetitions @ bar + 10kg
- 12 repetitions @ bar + 15kg
```

## Format B: Cardio / Machine Data

For treadmill, bike, stair climber, or equipment with metrics.

**Structure:**

```markdown
- **[Duration] of [Equipment Name] ([Brand/Model if available])**
  - [Metric]: [Value] [Unit]
  - [Metric]: [Value] [Unit]
  - ...
```

| Element         | Format                       | Notes                          |
| --------------- | ---------------------------- | ------------------------------ |
| **Main Item**   | `- **Xmin of [Equipment]**`  | Bold. Duration first.          |
| **Sub-metrics** | Indented with 4 spaces       | Use `    -` (4 spaces + dash). |
| **Metric Line** | `- [Metric]: [Value] [Unit]` | Capitalize metric names.       |
| **Units**       | Keep original units          | MPH, kph, km, cal, etc.        |

**Spanish → English:**

| Spanish            | English         |
| ------------------ | --------------- |
| `Tiempo`           | `Time`          |
| `Distancia`        | `Distance`      |
| `Calorías`         | `Calories`      |
| `Velocidad`        | `Speed`         |
| `Velocidad media`  | `Average Speed` |
| `Velocidad máxima` | `Max Speed`     |
| `Promedio vatios`  | `Average Watts` |
| `Máximos vatios`   | `Max Watts`     |
| `Tasa de quema`    | `Burn Rate`     |
| `Nivel`            | `Level`         |

**Example Input:**

```text
10 minutos de bici estática (LifeCycle GX)
Level: 13
RPM: 58
Velocidad: 18.3 MPH
Distancia: 3.0 millas
Calorías: 136 cal
Tasa de quema: 805 cal/hora
```

**Output:**

```markdown
- **10 minutes of Stationary Bike (LifeCycle GX)**
  - Level: 13
  - RPM: 58
  - Speed: 18.3 MPH
  - Distance: 3.0 miles
  - Calories: 136 cal
  - Burn Rate: 805 cal/hour
```

## Quick Reference

**Weight:** `20kg` (no space) • `bar only` • `bar + 10kg` • `bodyweight`

**Rest:** `2 mins` → `2 minutes` • `90s` → `90 seconds`

**Multiple exercises:** Separate with blank line. No `---` dividers.

## Validation

1. Filename: `YYYY-MM-DD workout.md`
2. Frontmatter: `date` + `tags: cszv/workout/YYYY`
3. Exercise names: Title Case English
4. Use `repetitions` (not "reps"), `@` separator, full time words
