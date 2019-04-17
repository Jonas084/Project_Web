package spring.fin.model;

public class InstaTagDTO {
	

    private int tag_Number;

    private String tagname;

    private int tagcount;

    private float tagshare;

    public int getTag_Number() {
        return tag_Number;
    }

    public void setTag_Number(int tag_Number) {
        this.tag_Number = tag_Number;
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname;
    }

    public int getTagcount() {
        return tagcount;
    }

    public void setTagcount(int tagcount) {
        this.tagcount = tagcount;
    }

    public float getTagshare() {
        return tagshare;
    }

    public void setTagshare(float d) {
        this.tagshare = d;
    }
}
