package model.state;

import java.io.BufferedReader;

public class FileTableData {
    public String filename;
    public BufferedReader bufferedReader;

    public FileTableData(String filename, BufferedReader bufferedReader) {
        this.filename = filename;
        this.bufferedReader = bufferedReader;
    }

    public FileTableData() {
    }
}
