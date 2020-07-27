project ('vvfs', ['vala', 'c'], version: '0.0.1')

add_project_arguments (['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = join_paths (source_dir, 'vapi')
data_dir = join_paths (source_dir, 'data')
build_dir = join_paths (join_paths(source_dir, meson.current_build_dir ()))

gnome = import ('gnome')

# Dependencies
base_dependencies = [
    dependency ('glib-2.0'),
    dependency ('gio-2.0'),
    dependency ('gxml-0.16'),

    meson.get_compiler ('c').find_library ('SDL2')
]

# VAPI Dependencies
base_vapi = [
    meson.get_compiler ('vala').find_library ('sdl2', dirs: vapi_dir)
]

subdir ('src')
# subdir ('lib')