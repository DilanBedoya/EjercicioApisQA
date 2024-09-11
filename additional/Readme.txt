
Tecnologías a Utilizar:
Sistema operativo: Windows 10 (o superior)
IDE recomendado: IntelliJ IDEA 2023.3.2
Java Development Kit (JDK): Versión 17 (configurado en JAVA_HOME)
Maven: Versión 3.9.1 (configurado en M2_HOME o MAVEN_HOME)
Karate: Versión 1.2.0

Instrucciones para Ejecutar los Tests:

En IntelliJ IDEA:
Abre IntelliJ IDEA y selecciona File > Open.
Navega hasta el directorio del proyecto y selecciona la carpeta raíz.
Ve a src/test/java/ y selecciona el archivo DemoblazeTestRunner.
Ejecuta los métodos de prueba. Los resultados se mostrarán en la consola.

Verificación de Reportes:

Karate:
Los reportes están en /target/karate-reports.
Abre karate-summary.html en tu navegador.

Cucumber:
Los reportes están en /build/cucumber-html-reports.
Abre overview-features.html en tu navegador.
IMPORTANTE: Borra la carpeta build y ejecuta el método ReportCucumber para generar un nuevo reporte.
