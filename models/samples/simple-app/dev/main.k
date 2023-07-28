import models.schema.v1 as ac


# The application configuration in stack will overwrite 
# the configuration with the same attribute in base.
appConfiguration : ac.AppConfiguration {
    components.proxy.containers.nginx: {
        image = "nginx:v1"
    }
}