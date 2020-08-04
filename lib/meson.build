libvvfs_sources = files (
    'File.vala',
    'Utility.vala',
    'FileType.vala'
)

libvvs = library (
    meson.project_name (),

    libvvfs_sources,

    dependencies: [
        base_dependencies,
    ],

    vala_header: 'vvfs.h',
    vala_vapi: 'vvfs.vapi',
    vala_gir: 'vvfs-1.0.gir',

    version: meson.project_version (),
    install: true,

    install_dir: [ true, true, true, true ]
)

install_data (
    'vvfs.deps',
    install_dir: join_paths (get_option ('datadir'), 'vala', 'vapi')
)

libvvfs_dep = declare_dependency (
    link_with: libvvs,
    dependencies: [
        base_dependencies,
    ],
    include_directories: [
        include_directories ('.')
    ]
)

libvvfs_pkg = pkgconfig.generate (
    libvvs,
    name: 'vvfs',
    requires: base_dependencies,
    subdirs: [ 'vvfs' ],
    description: 'A basic virtual file system and Gresource to SDL2 RWOPS bridge',
    version: meson.project_version (),
    url: 'https://github.com/lxmcf/vvfs'
)
