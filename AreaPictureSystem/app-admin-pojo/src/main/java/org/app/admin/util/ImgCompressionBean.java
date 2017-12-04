package org.app.admin.util;

public class ImgCompressionBean {

    private String min_generateName;    // 1 缩略图（小）
    private String middle_generateName; // 1 缩略图（中）
    private String max_generateName;    // 1 缩略图（大）

    public String getMin_generateName() {
        return min_generateName;
    }

    public void setMin_generateName(String min_generateName) {
        this.min_generateName = min_generateName;
    }

    public String getMiddle_generateName() {
        return middle_generateName;
    }

    public void setMiddle_generateName(String middle_generateName) {
        this.middle_generateName = middle_generateName;
    }

    public String getMax_generateName() {
        return max_generateName;
    }

    public void setMax_generateName(String max_generateName) {
        this.max_generateName = max_generateName;
    }

    @Override
    public String toString() {
        return "ImgCompressionBean{" +
                "min_generateName='" + min_generateName + '\'' +
                ", middle_generateName='" + middle_generateName + '\'' +
                ", max_generateName='" + max_generateName + '\'' +
                '}';
    }
}
