

#install.packages(c("usethis", "credentials"))

usethis::use_git_config(user.name = "jqirko6",
                         user.email = "joqir24@gmail.com")

usethis::create_github_token()

credentials::set_github_pat("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")
