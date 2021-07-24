package com.osp.model;

public class ResultUpload {

    private Long idFile;
    private String name;
    private String path;

    public ResultUpload(String name, String path) {
        this.name = name;
        this.path = path;
    }

    public ResultUpload() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Long getIdFile() {
        return idFile;
    }

    public void setIdFile(Long idFile) {
        this.idFile = idFile;
    }


}