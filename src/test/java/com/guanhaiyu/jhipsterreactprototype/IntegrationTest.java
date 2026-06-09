package com.guanhaiyu.jhipsterreactprototype;

import com.guanhaiyu.jhipsterreactprototype.config.AsyncSyncConfiguration;
import com.guanhaiyu.jhipsterreactprototype.config.DatabaseTestcontainer;
import com.guanhaiyu.jhipsterreactprototype.config.JacksonConfiguration;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.testcontainers.context.ImportTestcontainers;

/**
 * Base composite annotation for integration tests.
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@SpringBootTest(
    classes = {
        JhipsterReactPrototypeApp.class,
        JacksonConfiguration.class,
        AsyncSyncConfiguration.class,
        com.guanhaiyu.jhipsterreactprototype.config.JacksonHibernateConfiguration.class,
    }
)
@ImportTestcontainers(DatabaseTestcontainer.class)
public @interface IntegrationTest {}
