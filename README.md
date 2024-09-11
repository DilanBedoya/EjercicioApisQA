
# Ejercicio de APIS en demoblaze

Este repositorio contiene la automatización de pruebas para los servicios REST de `signup` y `login` de la página https://www.demoblaze.com. 
Las pruebas se han implementado utilizando Karate, y se han añadido instrucciones detalladas para la ejecución del proyecto.

## 1. Prerequisitos

Para ejecutar este proyecto, debes tener lo siguiente configurado en tu máquina local:

- **Sistema operativo:**  Windows 10 (o Superior)
- **IDE recomendado:** IntelliJ IDEA 2023.3.2
- **Java Development Kit (JDK):** Versión 17 (Debe estar en la variable de entorno JAVA-HOME)
- **Maven:** Versión 3.9.1 (Debe estar en las variables de entorno M2-HOME o MAVEN_HOME)
- **Karate:** Versión 1.2.0

## 2. Comandos de instalación

1. Clona el repositorio desde GitHub o descarga el Zip:
   ```
   git clone https://github.com/tu-usuario/tu-repositorio.git
   ```
2. Descarga las dependencias utilizando Maven (En caso de ser necesario):
   ```
   mvn install -DskipTests
   ```

## 3. Instrucciones para ejecutar los tests

1. **Ejecución de las pruebas**:
   Para ejecutar las pruebas, sigue los siguientes pasos para el IDE Correspondiente:

   ### IntelliJ IDEA:
   - Abre IntelliJ IDEA y selecciona `File > Open`.
   - Navega hasta el directorio del proyecto y selecciona la carpeta raíz donde está el proyecto.
   - En el panel de proyectos, ve a la ruta `src/test/java/` y selecciona el archivo de prueba `DemoblazeTestRunner`
   - Una vez dentro estarán los métodos de los test listos y especificados para ser ejecutados
   - El IDE ejecutará las pruebas y mostrará los resultados en la consola.

2. **Verificación de reportes en Karate**:
   Después de que las pruebas se ejecuten, los reportes generados se pueden encontrar en la carpeta `/target/karate-reports`.
   - Abre la carpeta `target` en el directorio principal del proyecto.
   - Dentro de `target`, abre la carpeta `karate-reports` y busca el archivo `karate-summary.html`.
   - Abre `karate-summary.html` en tu navegador preferido para ver el reporte de los resultados de las pruebas.

3. **Verificación de reportes en Cucumber**:
   Después de que se haya ejecutado el método ``ReportCucumber``  del archivo `DemoblazeTestRunner`, los reportes generados se pueden encontrar en la carpeta `/build/cucumber-html-reports`.
   - Abre la carpeta `build` en el directorio principal del proyecto.
   - Dentro de `build`, abre la carpeta `cucumber-html-reports` y busca el archivo `overview-features.html`.
   - Abre `overview-features.html` en tu navegador preferido para ver el reporte en cucumber de los resultados de las pruebas.
   - **IMPORTANTE**: Borrar la carpeta Build y ejecutar el método `ReportCucumber` para generar un nuevo reporte en cucumber

## 4. Información adicional
- En el  ``  Scenario Outline: Crear un nuevo usuario en signup`` especificar en el example un usuario no **Existente** para que la prueba pase sin **Errores**

- En caso de problemas con Dependencias ejecutar el siguiente comando:
````
mvn -U dependency:resolve
````

- En caso de querer limpiar los reportes de karate ejecutar el siguiente comando 
````
mvn clean test
````






