using SDL;

namespace VVFS {
    public class File {
        public string filename;

        private Bytes? bytes;
        private RWops? rwops;

        public int size;

        public File (string file) {
            filename = file;

            if (Utility.file_exists (filename)) {
                rwops = new RWops.from_file (filename, "rb");

                uint8[] data_array = new uint8[1];

                for (int i = 0; i < rwops.size; i++) {
                    data_array += rwops.read_u8 ();
                }

                bytes = new Bytes (data_array);
                size = data_array.length;
            } else {
                nullify ();
            }
        }

        public File.from_gresource (string file) {
            filename = file;

            try {
                bytes = resources_lookup_data (filename, ResourceLookupFlags.NONE);

                rwops = new RWops.from_mem (bytes.get_data (), bytes.length);

                size = bytes.length;
            } catch (Error e) {
                warning (e.message);

                nullify ();
            }
        }

        public unowned Bytes? get_bytes () {
            return bytes;
        }

        public unowned RWops? get_rwops () {
            return rwops;
        }

        public uint8[]? get_data () {
            return (bytes == null) ? null : bytes.get_data ();
        }

        public int get_size () {
            return size;
        }

        private void nullify () {
            size = 0;

            bytes = null;
            rwops = null;
        }
    }
}
