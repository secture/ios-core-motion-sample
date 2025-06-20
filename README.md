
# Sample Project: Core Motion 🏃

## Introducción
Este proyecto demuestra cómo utilizar **Core Motion** para rastrear la actividad física del usuario, como caminar, correr, estar en un vehículo y montar en bicicleta.

## Características
- Rastrear la actividad del usuario (por ejemplo, caminar, correr, montar en bicicleta).
- Obtener actualizaciones en tiempo real sobre el tipo de actividad actual usando `CMMotionActivityManager`.
- Mostrar información de la actividad (tipo de actividad, nivel de confianza).

## Configuración:
1. **Abrir el proyecto** en **Xcode**.
2. Asegúrate de que tu **Xcode Team** esté configurado en **Signing & Capabilities**.
3. **Añadir el framework `CoreMotion`** al proyecto:
   - Ve a **Build Phases** → **Link Binary with Libraries** → **+** → Añadir **CoreMotion.framework**.
4. **Añadir permisos requeridos** a `Info.plist`:
   ```xml
   <key>NSMotionUsageDescription</key>
   <string>Necesitamos acceso a tus datos de movimiento para rastrear tu actividad física, como caminar y correr, para fines de fitness.</string>

**Permisos Requeridos**:

La aplicación requiere acceso a los datos de movimiento, y la clave NSMotionUsageDescription en Info.plist debe explicar por qué se necesitan estos datos.

**Rastrear Actividad**:

La aplicación usa CMMotionActivityManager de Core Motion para detectar la actividad del usuario (caminar, correr, montar en bicicleta, etc.).

La aplicación muestra el tipo de actividad actual (por ejemplo, "Caminando" o "Corriendo") en tiempo real.

**Monitorear Transiciones de Actividad**:

La aplicación escucha las transiciones de actividad (por ejemplo, de caminar a correr) y actualiza la UI en consecuencia.

**Probar el Rastreo de Actividad Física**:

Ejecuta la aplicación en un dispositivo físico para el tipo de actividad real.

Empieza a caminar para probar la detección de actividad.

*Sugerencias*:

Puedes agregar lógica para enviar notificaciones basadas en actividades específicas.

## Conclusión:
Este proyecto de ejemplo demuestra cómo usar Core Motion para rastrear la actividad física. La aplicación proporciona el tipo de actividad actual, lo que la hace ideal para aplicaciones relacionadas con el fitness o la salud. Puedes expandir este proyecto integrando datos de salud a través de HealthKit o añadiendo las notificaciones para actividades específicas.

