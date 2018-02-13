# pe-r10k-vanagon

## Releasing a new r10k into PE
You want to get a new release of r10k into Puppet Enterprise.

1. In `configs/components/rubygem-r10k.json`,  update `ref` to the r10k [tag](https://github.com/puppetlabs/r10k/tags) or [commit sha](https://github.com/puppetlabs/r10k/commits/master) you want to package.
2. In `configs/components/rubygem-r10k.rb`, bump `pkg.version` to the version of r10k which is being packaged by pe-r10k-vanagon
3. Commit changes on a new branch, open a PR, find someone to +1 and merge
4. After merge, we still need to promote the newly built package into PE. The pe-r10k-vanagon pipelines do not start automatically. In Jenkins, kick off the pe-r10k-vanagon "init" job for the branch you're targeting. Here's [the job for Irving as an example](https://cinext-jenkinsmaster-enterprise-prod-1.delivery.puppetlabs.net/view/all/job/enterprise_pe-r10k-vanagon_init-van-int_suite-daily-irving/). Note that the integration tests that will run here are the *previous* version tests. This may or may not matter to you.
5. Once the above jobs succeeds or fails in an expected way due to your additions, tag pe-r10k-vanagon via Kerminator in the "release-new" HipChat: `!tag pe-r10k-vanagon <pkg.version> at <commit sha from above> with "<git tag message>"`, replacing the placeholders with real values. Note that for `pkg.version`, the first three digits are the r10k version from step #2, and that the last digit needs is determined by the tags already in the pe-r10k-vanagon repo.
6. Now kick off the [pe-r10k-vanagon job](https://cinext-jenkinsmaster-enterprise-prod-1.delivery.puppetlabs.net/view/Code%20Manager/job/enterprise_pe-r10k-vanagon_init-van-int_suite-daily-irving/) with `GITHUB_REF` set to your pkg.version from step #5 and `PE_PROMOTION` set to `true`. This does the promotion and will run through the acceptance tests once again.
