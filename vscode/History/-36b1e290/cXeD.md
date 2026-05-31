# ADR-0007  quitectura Multitenant

**Fecha**: 2026-05-09
**Estado**: Aceptado
**Autores**: Equipo OVELIX
* * *

## Contexto

OVELIX es una herramienta de corrección asistida por IA que se integra con Canvas LMS via LTI 1.3. Puede ser adoptada por múltiples instituciones educativas. En el diseño inicial debíamos decidir entre dos modelos de despliegue:

*   **Multitenant**: una única instancia de la aplicación y base de datos sirve a todas las instituciones, separadas lógicamente por `institution_id`.
*   **Single-tenant**: cada institución recibe su propio despliegue independiente (su propio Cloud Run, su propia base de datos, su propio Redis).
* * *

## Decisión

**Adoptamos arquitectura multitenant.**

Toda la separación de datos se gestiona a nivel de aplicación mediante `institution_id` (derivado del `canvas_course_id` del claim LTI). Un único despliegue en Cloud Run + una base de datos PostgreSQL + un Redis atienden a todas las instituciones.
* * *

## Razones

### 1\. Coste operativo significativamente menor

Con multitenant, el coste de infraestructura es fijo independientemente de cuántas instituciones onboardeen. Con single-tenant, cada nueva institución suma una instancia de Cloud Run, una instancia de Cloud SQL y una instancia de Memorystore — el coste escala linealmente con el número de clientes.

### 2\. Operaciones simplificadas

Un único servicio para desplegar, monitorear, parchear y escalar. Con single-tenant habría que gestionar N pipelines de CI/CD, N bases de datos, N certificados, N configuraciones de Terraform — todo multiplicado por el número de instituciones.

### 3\. La migración multitenant → single-tenant es factible

Si en el futuro una institución requiriera aislamiento total (por contrato, regulación o volumen), la migración es directa:
*   Exportar los datos filtrados por `institution_id` a una nueva base de datos.
*   Desplegar una copia del servicio con configuración propia.
*   El código no necesita cambiar — `institution_id` ya filtra todo.

### 4\. La migración inversa es muy costosa

Partir de N despliegues independientes y unificarlos en un sistema multitenant requiere:
*   Resolver colisiones de IDs entre bases de datos.
*   Unificar esquemas que pueden haber divergido.
*   Migrar configuraciones dispersas a un modelo centralizado.
*   Coordinar downtime de múltiples servicios.

Es un proyecto de meses, no de días.
* * *

## Ventajas y desventajas

**Ventajas:**
*   Barata — infraestructura fija, el coste no crece con cada institución nueva.
*   Servicios siempre actualizados — todos los tenants reciben parches y features al mismo tiempo.
*   Fácil migrar a single-tenant si se necesita — los datos ya están filtrados por `institution_id`.

**Desventajas:**
*   Datos compartidos — todos los tenants coexisten en la misma base de datos.
* * *