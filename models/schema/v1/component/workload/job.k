import models.schema.v1.component.container as c

schema Job:
    """ Job describes how the Application's tasks are expected to be run. A job will contiune to run until it succeeds.

    Attributes
    ----------
    container: c.Container, default is Undefined, required.
        Containers defines the templates of containers to be ran.
        More info: https://kubernetes.io/docs/concepts/containers
    schedule: str, default is Undefined, optional.

    Examples
    --------
    import models.schema.v1.component.workload as wl
    import models.schema.v1.component.container as c

    job = wl.Job {
        container: c.Container{
            image:   "busybox:1.28"
            command: ["/bin/sh", "-c", "echo hello"]
            env: {
                "name": "value"
            }
        }
        schedule: "0 0 13 * 5"
    }
    """

    container: c.Container
    # The schedule in Cron format
    schedule?: str
