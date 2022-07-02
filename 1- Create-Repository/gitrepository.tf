provider "github" {
  token="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"
}

resource "github_repository" "gitrepo-assignment" {
  name        = "repo-from-terraform"
  description = "assignment for internship of ShunyEka Systems pvt ltd"

  visibility = "public"
  auto_init = true

}