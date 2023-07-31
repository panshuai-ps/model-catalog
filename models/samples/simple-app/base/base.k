import models.schema.v1 as ac
import models.schema.v1.component as cmp
import models.schema.v1.component.container as c
import models.schema.v1.component.workload as wl

# 注意：请一定不要删除或则重命名该文件，同时 appConfiguration 变量名也请不要修改

appConfiguration : ac.AppConfiguration {
    components: {
        "proxy": cmp.Component {
            workload: wl.LongRunningService{
                containers: {
                    "nginx": c.Container {
                        image: "nginx:v1"
                        command: ["/bin/sh", "-c", "echo hi"]
                        args: ["/bin/sh", "-c", "echo hi"]
                        env: {
                            # 简单的Key-Value类型的环境变量
                            "env1": "VALUE"
                            # 取值为某个Secret的Key类型的环境变量
                            "env2": "secret://sec-name/key"
                        }
                        workingDir: "/tmp"
                    }
                }
                replicas: 2
            }
        }
        "hello": cmp.Component {
            workload: wl.Job {
                container: c.Container{
                    image:   "busybox:1.28"
                    command: ["/bin/sh", "-c", "echo hello"]
                    env: {
                        "name": "value"
                    }
                }
                schedule: "0 0 13 * 5"
            }
        }
    }
}
