# Publish W7 Concept Deep Dive to the repository owner's GitHub account.
# Prerequisites: GitHub CLI (gh), git, and `gh auth login` performed by the owner.
# Run from anywhere: powershell -ExecutionPolicy Bypass -File .\scripts\publish-github.ps1
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repo = 'yeaphgel/w7-concept-deep-dive'
$description = 'W7 Concept Deep Dive: Clarify language, probe assumptions, upgrade viewpoints. 概念深潜：澄清语言、探测前提、升级观点。'
$source = Split-Path -Parent $PSScriptRoot

foreach ($program in @('gh', 'git')) {
    if (-not (Get-Command $program -ErrorAction SilentlyContinue)) {
        throw "Missing required command: $program. Install it before publishing."
    }
}

& gh auth status *> $null
if ($LASTEXITCODE -ne 0) {
    throw 'GitHub CLI is not authenticated. Run: gh auth login'
}

$login = (& gh api user --jq .login).Trim()
if ($LASTEXITCODE -ne 0 -or $login -ne 'yeaphgel') {
    throw "Please authenticate GitHub CLI as 'yeaphgel' (current: $login)."
}

Push-Location $source
try {
    if (-not (Test-Path '.git')) {
        & git init -b main
        if ($LASTEXITCODE -ne 0) { throw 'Failed to initialize git repository.' }
    }

    & git add -A
    if ($LASTEXITCODE -ne 0) { throw 'Failed to stage files.' }
    $changes = & git status --porcelain
    if ($LASTEXITCODE -ne 0) { throw 'Failed to inspect working tree.' }
    if ($changes) {
        & git commit -m 'Release W7 Concept Deep Dive v0.4.0 with bilingual docs'
        if ($LASTEXITCODE -ne 0) {
            throw 'Git commit failed. Set git user.name and user.email, then rerun.'
        }
    }

    & gh repo view $repo --json name *> $null
    if ($LASTEXITCODE -ne 0) {
        & gh repo create $repo --public --description $description --source . --remote origin --push
        if ($LASTEXITCODE -ne 0) { throw 'GitHub repository creation/push failed.' }
    } else {
        & gh repo edit $repo --visibility public --accept-visibility-change-consequences --description $description
        if ($LASTEXITCODE -ne 0) { throw 'Could not set public visibility or description.' }
        $remotes = & git remote
        if ($remotes -notcontains 'origin') {
            & git remote add origin "https://github.com/$repo.git"
            if ($LASTEXITCODE -ne 0) { throw 'Could not add origin remote.' }
        } else {
            $origin = & git remote get-url origin
            if ($origin -notmatch '(^|[/:])yeaphgel/w7-concept-deep-dive(\.git)?$') {
                throw "Origin points to an unexpected repository: $origin"
            }
        }
        & git push -u origin main
        if ($LASTEXITCODE -ne 0) { throw 'Git push failed; remote may have unrelated history.' }
    }
    Write-Host "Published PUBLIC repository: https://github.com/$repo"
} finally {
    Pop-Location
}
