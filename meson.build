project ('vvfs-compiler', ['vala', 'c'], version: '1.0.0')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = join_paths (source_dir, 'vapi')
data_dir = join_paths (source_dir, 'data')
build_dir = join_paths (join_paths (source_dir, meson.current_build_dir ()))

add_project_arguments ([ '--vapidir', vapi_dir ], language: 'vala')

gnome = import ('gnome')

# Dependencies
base_dependencies = [
    dependency ('glib-2.0'),
    dependency ('gio-2.0'),
    dependency ('sdl2')
]

subdir ('src')
