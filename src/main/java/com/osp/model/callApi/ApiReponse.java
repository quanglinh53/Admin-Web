package com.osp.model.callApi;

public class ApiReponse {
    private boolean success;
    private int reponseCode;
    private Object obj;
    private String messageError;

    public ApiReponse() {
    }

    public ApiReponse(boolean success, int reponseCode) {
        this.success = success;
        this.reponseCode = reponseCode;
    }

    public ApiReponse(boolean success, int reponseCode, Object obj) {
        this.success = success;
        this.reponseCode = reponseCode;
        this.obj = obj;
    }

    public ApiReponse(boolean success, int reponseCode, String messageError) {
        this.success = success;
        this.reponseCode = reponseCode;
        this.messageError = messageError;
    }

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getReponseCode() {
        return reponseCode;
    }

    public void setReponseCode(int reponseCode) {
        this.reponseCode = reponseCode;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }
}
