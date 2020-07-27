namespace VVFS {
    public class Utility {
        public static bool file_exists (string file) {
            bool exists = FileUtils.test (file, FileTest.EXISTS);

            if (!exists) {
                warning (@"The file at ?$file? does not exist");
            }

            return exists;
        }

        public static bool resource_exists (string file) {
            bool exists = false;

            try {
                exists = resources_get_info (file, ResourceLookupFlags.NONE, null, null);
            } catch (Error e) {
                warning (e.message);
            }

            return exists;
        }
    }
}
