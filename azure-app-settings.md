# Azure Web App Settings für NestJS

## Application Settings im Azure Portal konfigurieren:

1. **Gehen Sie zur Azure Web App** im Portal
2. **Configuration** → **Application settings**
3. **Fügen Sie folgende Settings hinzu:**

| Name | Value | Beschreibung |
|------|-------|--------------|
| `WEBSITES_NODE_DEFAULT_VERSION` | `~20` | Node.js Version |
| `SCM_DO_BUILD_DURING_DEPLOYMENT` | `false` | Build wird in Pipeline gemacht |
| `WEBSITE_RUN_FROM_PACKAGE` | `1` | Aus ZIP-Package laufen |
| `WEBSITE_NODE_DEFAULT_VERSION` | `20.x` | Node.js Version |

## Startup Command (optional):
```
npm run start:prod
```

## Für Linux Web Apps:
Falls Sie Linux statt Windows verwenden, setzen Sie:
- **Startup Command**: `npm run start:prod`
- **Stack**: Node 20 LTS
