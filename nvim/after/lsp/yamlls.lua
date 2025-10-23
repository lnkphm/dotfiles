return {
    settings = {
        yaml = {
            redhat = {
                telemetry = {
                    enabled = false
                }
            },
            format = {
                enable = true
            },
            validate = true,
            hover = true,
            completion = true,
            schemas = {
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.34.1-standalone-strict/all.json"] = { "**/*.k8s.yaml" },
                ["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { "**/.gitlab-ci.yaml", "**/.gitlab-ci.yml" },
                ["https://www.schemastore.org/kustomization.json"] = { "kustomization.yaml", "kustomization.yml" },
                ["https://www.schemastore.org/github-workflow.json"] = { "**/.github/workflows/*.yml", "**/.github/workflows/*.yaml", "**/.gitea/workflows/*.yml", "**/.gitea/workflows/*.yaml", },
            },
        },
    }
}
