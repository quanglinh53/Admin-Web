package com.osp.model;

public class Response {
    private String status;
    private String message;
    private String result;

    public Response(String status, String message, String result) {
        this.status = status;
        this.message = message;
        this.result = result;
    }

    public Response(String message) {
        this.message = message;
    }

    public Response() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
