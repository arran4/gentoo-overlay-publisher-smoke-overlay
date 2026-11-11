# Gentoo Overlay Publisher smoke overlay

**Disposable integration fixture — not a production overlay.**

This repository is a dedicated, public test target for [Gentoo Overlay Publisher](https://github.com/arran4/gentoo-overlay-publisher). It is intentionally separate from general Gentoo/G2 test overlays so publishing experiments do not interfere with other projects.

## Repository structure

- `profiles/repo_name`, `profiles/eapi` and `metadata/layout.conf` define a normal Gentoo repository with `masters = gentoo` and thin Manifests.
- `app-misc/overlay-publisher-smoke` is a deliberately small, source-free EAPI 8 installation fixture. It installs a harmless shell program; no external network download is needed to build the fixture.
- `app-misc/overlay-publisher-smoke/metadata.xml` is retained as an existing metadata document so publisher updates can be tested for preservation of unrelated information.
- `.github/workflows/verify.yml` runs unprivileged structure, XML and shell-syntax checks. **It does not yet claim to prove a Portage build or actual remote publishing.**

## Intended end-to-end coverage

After the publisher's Action and CLI are implemented, this repository will serve as a real pull-request destination. Tests should demonstrate:

1. Publishing a brand-new generated ebuild and auxiliary files through an isolated PR.
2. Re-running an identical release without creating a new revision or duplicate PR.
3. Generating an actual changed revision, preserving prior versions according to policy, and producing correct Manifest records.
4. Preserving unrelated `metadata.xml` data, existing packages, and all files outside the selected ownership scope.
5. Validating output using G2 and a Gentoo environment with Portage fetch/build/install checks (including architecture-specific scenarios where supported).
6. Rejecting missing, stale, partial, conflicting or unauthorized data without destructive changes.

Validation of untrusted pull requests must not receive target-repository write credentials. Any workflow that invokes the publisher with write access must be triggered only from trusted code with an appropriately scoped token or GitHub App. Tests should write to separate branches and **must not auto-merge**, unless an explicitly reviewed test-cleanup policy is introduced.

## Local use

Once registered as a local Gentoo repository, the fixture is addressable as:

```text
app-misc/overlay-publisher-smoke::gentoo-overlay-publisher-smoke-overlay
```

It is not intended to be added to users' production Portage configurations. The current fixture uses `~amd64 ~arm64` keywords and no distfiles. Its empty, tracked `Manifest` is intentional for the thin-Manifest baseline. Future publisher-generated ebuilds may introduce real DIST checksums.

## Ownership

This is an integration-test target; the publisher's source code, public library, and Action live in the separate [Gentoo Overlay Publisher repository](https://github.com/arran4/gentoo-overlay-publisher). Do not put the publishing implementation here. Changes to the test overlay should go through normal reviewable PRs.
