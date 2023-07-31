import models.schema.v1.component.workload as wl

schema Component:
    """ Component defines the delivery artifact of one application. Each component
    can be composed of a Workload and its supporting Accessories.

    Attributes
    ----------
    containers: {str:c.Container}, default is Undefined, required.
        Containers defines the templates of containers to be ran.
        More info: https://kubernetes.io/docs/concepts/containers
    sidecars: {str:s.Sidecar}, default is Undefined, optional.
        Sidecar defines the templates of sidecar containers to be ran.
    replicas: int, default is Undefined, optional.
        Entrypoint array. Not executed within a shell.
        Command will overwrite the ENTRYPOINT value set in the Dockfile, otherwise the Docker
        image's ENTRYPOINT is used if this is not provided.
    labels: {str:str}, default is Undefined, optional.
        Labels are key/value pairs that are attached to the component.
    annotations: {str:str}, default is Undefined, optional.
        Annotations are key/value pairs that attach arbitrary non-identifying metadata to the component.

    Examples
    --------
    Instantiate a long-running service Component with "nginx:v1" image and customized labels.

    component = cmp.Component {
        workload: wl.LongRunningService{
            containers: {
                "nginx": c.Container {
                    image: "nginx:v1"
                }
            }
            replicas: 2
        }
        labels: {
            "key": "value"
        }
    }
    """

    # The Workload is a specification of how the container(s) should be run.
    workload:                   wl.LongRunningService | wl.Job

    ###### List of Workload supporting accessory. Accessory defines various runtime capabilities and operation functionalities.

    ###### Variables for Day-2 Operation.

    ###### Variables for Workload scheduling.

    ###### Other metadata info

    # Labels and annotations can be used to attach arbitrary metadata as key-value pairs to resources.
    labels?: {str:str}
    annotations?: {str:str}
