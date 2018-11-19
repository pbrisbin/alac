This project is inactive and has been **ARCHIVED**.

# Arch Linux Archive Crawler

Provides a (somewhat) nicer interface for https://archive.archlinux.org/,
hopefully to drive my [downgrade][] script soon.

[downgrade]: https://github.com/pbrisbin/downgrade

## Usage

```
curl https://alac.herokuapp.com/chromium
https://archive.archlinux.org/packages/c/chromium/chromium-29.0.1547.62-1-i686.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-29.0.1547.62-1-x86_64.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-29.0.1547.65-1-i686.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-29.0.1547.65-1-x86_64.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-29.0.1547.76-1-i686.pkg.tar.xz

-- snip --

https://archive.archlinux.org/packages/c/chromium/chromium-47.0.2526.73-2-i686.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-47.0.2526.73-2-x86_64.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-47.0.2526.80-1-i686.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-47.0.2526.80-1-x86_64.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-47.0.2526.80-2-i686.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-47.0.2526.80-2-x86_64.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-48.0.2564.82-1-i686.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-48.0.2564.82-1-x86_64.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-48.0.2564.97-1-i686.pkg.tar.xz
https://archive.archlinux.org/packages/c/chromium/chromium-48.0.2564.97-1-x86_64.pkg.tar.xz
```

## TODO

- Parameters (filter, sort, etc) & a JSON response
- Actually crawl and cache, don't parse HTML in-band
