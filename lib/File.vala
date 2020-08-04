using SDL;

namespace VVFS {
    public class File {
        private string _filename;
        private Bytes? _bytes;
        private RWops? _rwops;
        private int _size;

        // Read only properties
        public string filename { get { return _filename; } }
        public int size { get { return _size; } }

        public File (string file) {
            _filename = file;

            if (Utility.file_exists (_filename)) {
                _rwops = new RWops.from_file (_filename, "rb");

                uint8[] data_array = new uint8[1];

                for (int i = 0; i < _rwops.size; i++) {
                    data_array += _rwops.read_u8 ();
                }

                _bytes = new Bytes (data_array);
                _size = data_array.length;
            } else {
                nullify ();
            }
        }

        public File.from_gresource (string file) {
            _filename = file;

            try {
                _bytes = resources_lookup_data (_filename, ResourceLookupFlags.NONE);

                _rwops = new RWops.from_mem (_bytes.get_data (), _bytes.length);

                _size = _bytes.length;
            } catch (Error e) {
                warning (e.message);

                nullify ();
            }
        }

        public uint8[]? get_data () {
            return (_bytes == null) ? null : _bytes.get_data ();
        }

        public unowned RWops? get_rwops () {
            return _rwops;
        }

        public unowned Bytes? get_bytes () {
            return _bytes;
        }

        private void nullify () {
            _size = 0;

            _bytes = null;
            _rwops = null;
        }
    }
}
