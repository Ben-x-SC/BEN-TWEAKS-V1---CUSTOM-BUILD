# ⚡ __BEN-TWEAKS-V1---CUSTOM-BUILD__

> **Tweaks personalizados para Ryzen 5 5500 + GTX 1660 Super + 16GB 2400MHz**  
> Optimización agresiva pero segura para sistemas gaming de gama media.

---

## 📌 ¿Qué es esto?

**BEN-TWEAKS V1** es un script `.bat` de optimización para Windows, creado y probado en mi propia PC. No es un tweak genérico sacado de YouTube — está ajustado específicamente para la arquitectura **AMD Ryzen 5000 + NVIDIA GTX 1660 Super** con **16GB de RAM a 2400MHz**.

Lo hice para mi build, lo comparto para que lo uses, lo modifiques, o lo tomes como base para el tuyo.

---

## 🖥️ Hardware objetivo

| Componente | Especificación |
|---|---|
| **CPU** | AMD Ryzen 5 5500 (6 núcleos / 12 hilos) |
| **GPU** | NVIDIA GTX 1660 Super (6GB GDDR6) |
| **RAM** | 16GB DDR4 2400MHz |
| **SO** | Windows 10 / Windows 11 |

> Si tu build es diferente, puede que algunas cosas no apliquen igual — más abajo explico qué hace cada stage para que puedas adaptar lo que necesites.

---

## 🚀 ¿Qué optimiza?

El script se divide en stages claras:

### 🧹 Stage 3 — Limpieza de rendimiento
- Temp de Windows y sistema
- Prefetch
- Caché de Windows Update
- Caché de shaders DirectX y NVIDIA (DXCache, GLCache)
- Thumbnails y reportes de errores
- Logs de eventos

### ⚙️ Stage 4 — Optimizaciones core

| Stage | Qué hace |
|---|---|
| **4.1** | Plan de energía Alto Rendimiento + Ryzen: estado mínimo del procesador al 100% (mantiene boost activo) |
| **4.2** | Scheduler de CPU optimizado para 6 núcleos + prioridad alta para procesos de juego |
| **4.3** | Prioridades de CPU/IO elevadas para **Fortnite** y **Valorant** |
| **4.4** | Gestión de memoria ajustada para 16GB — ejecutivo de paginación desactivado |
| **4.5** | GTX 1660 Super: Hardware Scheduling activado, PowerMizer en máximo rendimiento, TDR optimizado |
| **4.6** | Latencia de input reducida (mouse/teclado) + MSI habilitado en USB |
| **4.7** | Game Mode activado, Game DVR desactivado |
| **4.8** | Exclusiones de Windows Defender para Fortnite y Valorant |
| **4.9** | Red optimizada para gaming competitivo — algoritmo de Nagle desactivado, TCP sin delay |
| **4.10** | Ryzen 5000: clock de plataforma, dynamic tick y TSC sync optimizados |
| **4.11** | Efectos visuales en modo rendimiento |
| **4.12** | Servicios de fondo innecesarios desactivados (SysMain, DiagTrack, etc.) |
| **4.13** | Telemetría de Windows reducida |

### ✅ Enfoque SEGURO — cosas que NO toca

- ❌ No cambia Core Parking (Windows lo gestiona mejor)
- ❌ No desactiva interrupciones de forma agresiva
- ❌ No modifica timers del sistema de forma peligrosa
- ✅ Crea un **punto de restauración automático** antes de hacer cualquier cambio

---

## ▶️ Cómo usar

1. **Descarga** el archivo `R55500_1660S.bat`
2. **Click derecho** → "Ejecutar como administrador"
3. El script crea un punto de restauración automáticamente antes de todo
4. Al terminar, te pregunta si quieres reiniciar (recomendado)

> ⚠️ **Requiere privilegios de administrador.** Si lo abres sin ellos, el script se detiene solo.

---

## 🔄 ¿Quieres revertir los cambios?

Antes de tocar nada, el script crea un punto de restauración llamado:  
`BEN_TWEAKS_CUSTOM_RYZEN5_GTX1660S`

Para restaurar:  
**Inicio → Crear un punto de restauración → Restaurar sistema** → selecciona ese punto.

---

## 🛠️ ¿Quieres modificarlo?

¡Adelante! El código está comentado stage por stage. Puedes:

- Cambiar los paths de los juegos (Fortnite/Valorant están hardcodeados en `C:\Program Files\Epic Games` y `C:\Riot Games`)
- Adaptar las exclusiones de Defender a tus juegos
- Ajustar el plan de energía a tu CPU (el GUID del plan de Alto Rendimiento puede variar)
- Agregar o quitar servicios del Stage 4.12

Forkea el repo, hazlo tuyo y compártelo con tu build.

---

## 📊 Resultados esperados

Estos son mis resultados subjetivos en mi build:

- 📉 Input lag más bajo en Valorant y Fortnite
- 📈 FPS más estables (menos drops repentinos)
- 🧠 RAM liberada al inicio por menos servicios en background
- 🌐 Ping más consistente en partidas competitivas

> *Los resultados varían según tu setup. No prometo milagros, prometo tweaks honestos.*

---

## 💬 ¿Quieres una optimización personalizada para tu build?

Si tienes un hardware diferente y quieres tweaks adaptados a tu setup, escríbeme:

### 🎵 TikTok: [@xbx_ben](https://www.tiktok.com/@xbx_ben)

---

## 📄 Licencia

Libre para usar, modificar y distribuir. Sin restricciones.  
Si lo usas como base para algo, un crédito siempre se agradece. 🤝

---

<div align="center">
  <sub>Hecho con 💚 y muchas horas de testing — BEN-TWEAKS V1 © 2024</sub>
</div>
