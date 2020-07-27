using VVFS;

public static int main (string[] args) {
    Utility.file_exists ("null.dat");
    Utility.resource_exists ("null.dat");

    return 0;
}
