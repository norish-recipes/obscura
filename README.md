# Obscura for Norish

[Obscura](https://github.com/h4ckf0r0day/obscura) is a headless browser that speaks the Chrome
DevTools Protocol, by h4ckf0r0day and its contributors, under the Apache License 2.0 (`LICENSE`).
[Norish](https://github.com/norish-recipes/norish) renders recipe pages with it. This fork builds
upstream's render+stealth release with the patches in `patches/` applied, and nothing else.

## The patches

- **`0001`:** `Network.setExtraHTTPHeaders` reaches the stealth client, which upstream's stealth
  build never gave the headers, and takes an optional `scopeDomain`. With one, a request whose host
  is not on that domain carries none of the headers, checked on every redirect hop. The reply
  echoes `scopeDomain`, so a client can tell this build from one that would send them anywhere.

## Releases

Each release is `<upstream tag>-norish.<REVISION>`, with the same archive names upstream uses
(`obscura-x86_64-linux-stealth.tar.gz`, `obscura-aarch64-linux-stealth.tar.gz`). Its source is the
upstream tag with `patches/` applied by `apply-patches.sh`.

`.github/workflows/norish-release.yml` checks upstream every day and builds a release it hasn't
built yet. A push to this branch builds and tests without publishing. Bump `REVISION` when the
patches change. When they stop applying to a new upstream release, the workflow opens an issue.
