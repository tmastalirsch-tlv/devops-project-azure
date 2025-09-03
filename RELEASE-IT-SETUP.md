# DevOps Project - Release-it Setup 🚀

## Übersicht

Dieses Projekt verwendet [release-it](https://github.com/release-it/release-it) für automatische Versionierung und Release-Management. Release-it ist ein vielseitiges CLI-Tool, das von vielen großen Projekten wie Axios, jQuery, und Redux verwendet wird.

## ✅ Implementierte Features

### 1. **Dockerfile & Docker Testing**
- **Multi-Stage Dockerfile** mit Node.js 20 Alpine
- **Lokales Testing** erfolgreich durchgeführt
- **Security Best Practices**: Non-root User, optimierte Build-Schritte

### 2. **Release-it Konfiguration**
- **Automatische Versionierung** basierend auf Patch-Increments
- **Git-Integration**: Automatische Commits, Tags und Push
- **GitHub Releases**: Automatische Release-Erstellung
- **Hooks**: Pre- und Post-Release Aktionen (Linting, Testing, Building)

### 3. **GitHub Actions CI/CD Pipeline**
- **Test & Build Pipeline**: Automatische Tests und Builds
- **Release Pipeline**: Verwendet release-it für Versionierung
- **Repository Dispatch**: Triggert Docker Build nach Release
- **Docker Image Build & Push**: Automatisch zur GitHub Container Registry

### 4. **Version Tagging**
- Docker Images werden mit **App-Version** und **latest** getaggt
- Registry: `ghcr.io/your-username/devops-project-azure:x.x.x`

## 📁 Konfigurationsdateien

### `.release-it.json`
```json
{
  "git": {
    "commitMessage": "chore: release v${version}",
    "tagName": "v${version}",
    "push": true,
    "commit": true,
    "tag": true,
    "requireCleanWorkingDir": false
  },
  "github": {
    "release": true,
    "releaseName": "Release v${version}",
    "releaseNotes": null
  },
  "npm": {
    "publish": false
  },
  "hooks": {
    "before:init": ["npm run lint", "npm test"],
    "after:bump": "npm run build",
    "after:release": "echo Successfully released ${name} v${version} to ${repo.repository}"
  }
}
```

### GitHub Actions Workflows

#### `.github/workflows/version-and-release.yml`
- **Test Phase**: Node.js 20, Linting, Tests, Build
- **Release Phase**: Führt `release-it --ci --increment patch` aus
- **Repository Dispatch**: Triggert Docker Build bei neuem Release

#### `.github/workflows/docker-build-push.yml`
- **Triggered by**: Repository Dispatch Event
- **Docker Build**: Multi-Stage Build mit Dockerfile
- **Registry Push**: GitHub Container Registry (`ghcr.io`)
- **Tagging**: Version-spezifisch + latest

## 🚀 Workflow Ablauf

1. **Developer Push** → `main` Branch
2. **Tests & Linting** → Automatische Qualitätsprüfung
3. **Release-it Execution** → Patch Version Increment (z.B. 0.0.1 → 0.0.2)
4. **Git Operations** → Commit, Tag, Push
5. **GitHub Release** → Automatische Release-Erstellung
6. **Repository Dispatch** → Event mit Version-Info
7. **Docker Build** → Image Build & Push zu GitHub Container Registry

## 📝 Usage

### Lokale Entwicklung
```bash
# Dependencies installieren
npm install

# App lokal starten
npm run start:dev

# Release lokal testen (Dry Run)
npx release-it --dry-run

# Manueller Release (falls nötig)
npm run release
```

### Docker
```bash
# Image bauen
docker build -t devops-project-azure:latest .

# Container starten
docker run -p 3000:3000 devops-project-azure:latest

# Aus Registry pullen
docker pull ghcr.io/your-username/devops-project-azure:latest
```

### Production Deployment
```bash
# Neueste Version
docker run -d -p 3000:3000 --name devops-app \\
  ghcr.io/your-username/devops-project-azure:latest

# Spezifische Version
docker run -d -p 3000:3000 --name devops-app \\
  ghcr.io/your-username/devops-project-azure:1.2.3
```

## 🔧 Repository Setup (Erforderlich)

1. **Repository auf Public setzen** (für GitHub Container Registry)
2. **GitHub Actions aktivieren** (Settings → Actions → Allow all actions)
3. **Packages Permission** (Settings → Actions → General → Workflow permissions → Read and write permissions)

## 🎯 Nächste Schritte

1. **Ersten Release triggern**:
   ```bash
   git add .
   git commit -m "feat: setup release-it automation with docker build"
   git push origin main
   ```

2. **Workflow Monitoring**: GitHub Actions Tab überwachen
3. **Docker Image Verifizierung**: Registry nach erfolgreichem Build prüfen

## 🔄 Release-it Vorteile

- **Flexibilität**: Hochgradig konfigurierbar
- **Plugin System**: Erweiterbar mit zahlreichen Plugins
- **Interactive Mode**: Unterstützt auch interaktive Releases
- **Wide Adoption**: Verwendet von vielen großen Open-Source Projekten
- **Git Integration**: Nahtlose Integration mit Git-Workflows
- **CI/CD Ready**: Optimiert für Continuous Integration

## 📚 Weiterführende Links

- [Release-it Documentation](https://github.com/release-it/release-it)
- [Release-it Plugins](https://github.com/release-it/release-it#plugins)
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
