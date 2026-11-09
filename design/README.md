# There No Whale — editorial profile

The active profile is built from `readme.md` and `img/editorial/`. Previous `img/identity/` files are retained for existing references; the new README uses only the editorial collection.

## Art direction

Vermilion orange, warm ivory, near black and muted water blue. Gothic lettering in the cover pairs with bold grotesk section headings, tactile ice, a grainy sculpted sun and angular water apertures. Public author signature: **Mihkihtah**. Primary wordmark: **@therenowhale**.

The layout follows a magazine: masthead, cover, navigation, three feature cards, engineering toolkit, learning process, selected projects and colophon. Buttons and section cards link to their actual destinations or README anchors. Essential text also appears in image descriptions or the toolkit disclosure.

## Assets

| Files | Purpose |
| --- | --- |
| `cover.png` | Profile cover |
| `engineering.png`, `experiments.png`, `lab.png` | Linked feature cards |
| `project-*.png` | Wide linked project features |
| `deco.png` | Transparent decorative starburst |
| `button-*.png` | Source code, Swaga Labs, Murhub navigation |
| `divider-*.png` | Section numbering and labels |
| `masthead.png`, `colophon.png` | Editorial framing |
| `toolkit.png`, `process.png` | Precise informational graphics |

The five artwork assets were created with image generation. The other PNGs contain precisely typeset information and can be rebuilt on macOS from the repository root:

```sh
swift -module-cache-path /tmp/therenowhale-swift-cache design/build_editorial.swift img/editorial
```

All profile assets are local PNG files. No external image services, scripts, custom CSS or GitHub-unsupported layout features are required. The toolkit is descriptive; it does not assign skill scores. Existing real project links are retained.
