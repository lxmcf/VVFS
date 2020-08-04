<h1 align="center">VVFS</h1>

VVFS is basic (WIP)virtual file system and bridge for GNOME GResource and SDL2 RWOPS; designed for the [Virgil](https://github.com/lxmcf/virgil) game engine.

### Dependencies

- `glib-2.0`
- `libsdl2-dev`
- `meson`

### Compiling &amp; Installing

```sh
meson build --prefix=/usr
cd build
sudo ninja install
```