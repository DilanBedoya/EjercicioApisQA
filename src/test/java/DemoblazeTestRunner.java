import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class DemoblazeTestRunner {

    //Utilizando Junit5 Pruebas
    //Test Completo
    @Karate.Test
    Karate RunnerAll() {
        return Karate.run("classpath:ManageUsersDemoBlaze").outputCucumberJson(true).relativeTo(getClass());
    }
    //Test Independiente
    @Karate.Test
    Karate RunnerSingup() {
        return Karate.run("classpath:ManageUsersDemoBlaze/signup/signup.feature").outputCucumberJson(true).relativeTo(getClass());
    }
    @Karate.Test
    Karate RunnerLogin() {
        return Karate.run("classpath:ManageUsersDemoBlaze/login/login.feature").outputCucumberJson(true).relativeTo(getClass());
    }

    //Generar reporte completo en cucumber en la carpeta Build - Abrir cualquier html con algún navegador
    //En caso de querer un nuevo reporte eliminar la carpeta Build y ejecutar el Runner
    @Test
    public void ReportCucumber() {
        Results results = Runner.path("classpath:ManageUsersDemoBlaze")
                .outputCucumberJson(true)
                .parallel(4); // Ejecutar en paralelo si lo desea
        generateReport(results.getReportDir());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "TestUsersBlaze");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }


}
