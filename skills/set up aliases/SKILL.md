---
name: set up aliases
description: Add accurate and relevant aliases to Obsidian notes for improved linkability, search discovery, and cross-language accessibility. Use when creating new notes, reviewing existing notes without aliases, or when the user asks to add alternative names for concepts.
---

# Set Up Aliases Skill

This skill enables agents to add meaningful `aliases` to Obsidian notes, improving note discoverability and enabling natural linking across languages and abbreviations.

## Overview

Aliases are alternative names for a note stored in the YAML frontmatter. When an alias is defined, Obsidian treats it as an equivalent way to reference that note via wikilinks or search.

**Why aliases matter:**
- **Cross-language support** — Link to notes using translations
- **Abbreviation linking** — Use acronyms like `[[CoT]]` instead of `[[chain of thought]]`
- **Natural language** — Allow different phrasings to resolve to the same note
- **Search discovery** — Find notes using alternative terminology

## Alias Guidelines

### When to Add Aliases

| Scenario | Example |
|----------|---------|
| **Acronym/abbreviation exists** | `chain of thought` → `CoT` |
| **Translation needed** | `machine learning` → `aprendizaje automático` |
| **Common alternative names** | `artificial intelligence` → `AI` |
| **Disambiguation variants** | `white-box (ai).md` → `IA de caja blanca` |

### Alias Quality Criteria

| Criterion | Good Practice | Avoid |
|-----------|---------------|-------|
| **Relevance** | Only add aliases that users would actually search for | Generic or tangentially related terms |
| **Accuracy** | Aliases must be true synonyms or translations | Loosely related concepts |
| **Minimal set** | 1-3 well-chosen aliases | Dozens of marginal variants |
| **Language consistency** | Match user's primary and secondary languages | Random languages |

### Alias Types

1. **Acronyms** — Standard abbreviations recognized in the field
2. **Translations** — Full translations to user's secondary language (Spanish)
3. **Alternative names** — Recognized synonyms in the same language

## Frontmatter Format

```yaml
---
aliases:
  - first alias
  - second alias
---
```

**Rules:**
- Use lowercase unless the alias is a proper noun or acronym
- No quotes needed unless the alias contains special characters
- Acronyms use standard capitalization (e.g., `CoT`, `CLI`, `MCP`)

## Examples

### Example 1: Technical Concept with Acronym

**Note:** `chain of thought.md`

```yaml
---
aliases:
  - cadena de pensamiento
  - CoT
---
```

**Reasoning:**
- `CoT` — Standard acronym in AI/ML literature
- `cadena de pensamiento` — Spanish translation for cross-language linking

---

### Example 2: Interface Concept

**Note:** `command line interface.md`

```yaml
---
aliases:
  - interfaz de línea de comandos
  - CLI
---
```

**Reasoning:**
- `CLI` — Universal abbreviation
- `interfaz de línea de comandos` — Spanish translation

---

### Example 3: Named Cycle/Framework

**Note:** `thought-action-observation cycle.md`

```yaml
---
aliases:
  - TAO
  - ciclo pensamiento-acción-observación
---
```

**Reasoning:**
- `TAO` — Acronym derived from initials
- `ciclo pensamiento-acción-observación` — Direct Spanish translation preserving hyphens

---

### Example 4: Disambiguated Concept

**Note:** `white-box (ai).md`

```yaml
---
aliases:
  - IA de caja blanca
---
```

**Reasoning:**
- Only translation provided since "white-box" has no common acronym in AI context
- The `(ai)` disambiguator is context, not part of the alias

---

### Example 5: Protocol/Standard

**Note:** `model context protocol.md`

```yaml
---
aliases:
  - MCP
  - Protocolo de Contexto para Modelos
---
```

**Reasoning:**
- `MCP` — Standard acronym
- Spanish translation uses proper capitalization for protocol names

---

## Validation Checklist

Before finalizing aliases:

- [ ] **Relevance** — Each alias is a true synonym, acronym, or translation
- [ ] **No duplicates** — Alias doesn't match the filename exactly
- [ ] **Correct format** — YAML list syntax with proper indentation
- [ ] **Acronym accuracy** — Acronyms are recognized in the field, not invented
- [ ] **Translation quality** — Translations are accurate, not machine-literal
- [ ] **Minimal set** — No more than 3-4 aliases unless strongly justified

## References

- [Obsidian Aliases Documentation](https://help.obsidian.md/aliases)
- [Properties and Frontmatter](https://help.obsidian.md/properties)
