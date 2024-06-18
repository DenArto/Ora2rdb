package ru.redsoft.ora2rdb;

import org.junit.jupiter.api.Test;

import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.assertj.core.api.Assertions.assertThat;

@ExtendWith(MockitoExtension.class)
public class Ora2rdbTest {

    @Test
    void printUsageInformation() throws Exception {

        final String logFile = System.getProperty("java.io.tmpdir") + "/out.log";
        try (PrintStream printStream = new PrintStream(logFile)) {
            System.setErr(printStream);
            Ora2rdb.main(new String[0]);
        }
        final String content = new String(Files.readAllBytes(Paths.get(logFile)));

        assertThat(content)
                .contains("Usage", "Options", "Note");
    }
}
