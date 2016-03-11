RedSocks for OpenWrt
===

About
---

A OpenWRT port of [Redsocks][1]

How to build
---

 - OpenWRT

```bash
# in build root
git clone https://github.com/yuanl/redsocks.git package/redsocks

make menuconfig

make -j1 V=s package/redsocks/compile
```

[1]: https://github.com/darkk/redsocks