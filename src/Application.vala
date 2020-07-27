namespace VVFS.Compiler {
    public class Application : GLib.Application {
        private ApplicationCommandLine application_command_line;

        private static bool print_version = false;

        private const OptionEntry[] COMMAND_OPTIONS = {
            { "version", 'v', 0, OptionArg.NONE, ref print_version, "Display version number." },
            { "file", 'f', 0, OptionArg.FILENAME, null, "Compile the given vresource index file." },
            { "output", 'o', 0, OptionArg.NONE, null, "Write output to given directory." },
            { "test", 't', 0, OptionArg.NONE, null, "Execute built in test function." },
            { null }
        };

        public Application () {
            Object (
                application_id: "com.github.lxmcf.vvfs-compiler",
                flags: ApplicationFlags.HANDLES_COMMAND_LINE
            );
        }

        public override int command_line (ApplicationCommandLine command_line) {
            this.hold ();

            int result = handle_command_line (command_line);

            this.release ();
            return result;
        }

        private int handle_command_line (ApplicationCommandLine command_line) {
            string[] args = command_line.get_arguments ();

            if (args.length == 1) {
                args = { args[0], "." };
            }

            unowned string[] tmp = args;

            try {
                var option_context = new OptionContext ("- VVFS-Compiler");
                option_context.set_help_enabled (true);
                option_context.add_main_entries (COMMAND_OPTIONS, null);
                //  option_context.set_summary ("This is a summary");
                //  option_context.set_description ("This is a description");

                option_context.parse (ref tmp);
            } catch (OptionError e) {
                command_line.print ("Error: %s" + "\n", e.message);
                command_line.print ("Run '%s --help' to see a full list of available options." + "\n", args[0]);

                return 1;
            }

            if (print_version) {
                command_line.print ("Version: %s" + "\n", "Insert some number thing here");
                return 0;
            }

            return 0;
        }
    }
}
