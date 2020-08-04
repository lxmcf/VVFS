project ('vvfs', ['vala', 'c'], version: '0.1.1')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = join_paths (source_dir, 'vapi')
data_dir = join_paths (source_dir, 'data')
build_dir = join_paths (join_paths (source_dir, meson.current_build_dir ()))

add_project_arguments ([ '--vapidir', vapi_dir ], language: 'vala')

gnome = import ('gnome')
pkgconfig = import ('pkgconfig')

# Dependencies
base_dependencies = [
    dependency ('glib-2.0'),
    dependency ('gio-2.0'),
    dependency ('sdl2')
]

tests_enabled = get_option ('tests')

subdir ('lib')

if tests_enabled
    subdir ('tests')
endif