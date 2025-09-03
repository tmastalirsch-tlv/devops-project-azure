# Contributing Guidelines

## Conventional Commits

Dieses Projekt verwendet [Conventional Commits](https://conventionalcommits.org/) für automatische Versionierung und Changelog-Generierung.

### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

| Type | Beschreibung | Version Bump |
|------|-------------|--------------|
| `feat` | Neue Funktionalität | **MINOR** (0.1.0) |
| `fix` | Bug Fix | **PATCH** (0.0.1) |
| `docs` | Nur Dokumentation | Kein Bump |
| `style` | Code-Formatting (keine Logik-Änderung) | Kein Bump |
| `refactor` | Code-Refactoring (keine Features/Fixes) | Kein Bump |
| `perf` | Performance-Verbesserung | **PATCH** (0.0.1) |
| `test` | Tests hinzufügen/ändern | Kein Bump |
| `chore` | Build-Prozess, Tooling | Kein Bump |
| `ci` | CI-Konfiguration | Kein Bump |

### Breaking Changes

Für **MAJOR** Version Bumps (1.0.0):

```bash
# Option 1: ! nach type
feat!: completely new API structure

BREAKING CHANGE: API endpoints have been restructured
```

```bash
# Option 2: BREAKING CHANGE im Footer
feat: add new authentication system

BREAKING CHANGE: The auth token format has changed
```

### Beispiele

#### ✅ Gute Commit Messages

```bash
# Minor Version (neue Features)
feat: add user profile management
feat(auth): implement JWT token refresh
feat: add Docker multi-stage build

# Patch Version (Bug Fixes)
fix: resolve memory leak in user service
fix(api): handle null responses correctly
perf: optimize database queries

# Major Version (Breaking Changes)
feat!: migrate to new database schema
fix!: change API response format

BREAKING CHANGE: User endpoints now return different field names
```

#### ❌ Schlechte Commit Messages

```bash
# Zu vage
update stuff
fix bug
improvements

# Falsche Types
added new feature  # sollte sein: feat: add new feature
fixed the thing    # sollte sein: fix: resolve issue with thing
```

### Scopes (Optional)

Scopes helfen bei der Organisation:

```bash
feat(auth): add OAuth2 support
fix(api): resolve timeout issues
docs(readme): update installation guide
test(auth): add integration tests
chore(deps): update dependencies
```

### Body und Footer

```bash
feat: add user notification system

Add real-time notifications for user actions including:
- Email notifications
- Push notifications
- In-app notifications

Closes #123
Reviewed-by: @username
```

## Automatische Versionierung

Basierend auf Ihren Commits wird automatisch die Version in `package.json` erhöht:

- **fix:** → 1.0.0 → 1.0.1 (PATCH)
- **feat:** → 1.0.0 → 1.1.0 (MINOR)  
- **BREAKING CHANGE:** → 1.0.0 → 2.0.0 (MAJOR)

## Changelog

Das `CHANGELOG.md` wird automatisch generiert und enthält:

- Alle Features, Fixes und Breaking Changes
- Links zu Commits und Issues
- Datum der Releases
- Contributor-Informationen

## Workflow

1. **Feature entwickeln**
2. **Conventional Commit** erstellen
3. **Push to main** (oder PR merge)
4. **Automatische Versionierung** durch GitHub Actions
5. **Automatische Changelog-Generierung**
6. **Docker Image Build & Push**

## Tools

- **Release-it**: Automatische Versionierung
- **Conventional Changelog**: Changelog-Generierung
- **GitHub Actions**: CI/CD Pipeline
- **Docker**: Multi-Stage Container Build
