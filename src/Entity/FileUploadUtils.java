package Entity;
import java.util.UUID;
public class FileUploadUtils {
	private String name;
	private String place;
	private String time;
	private String people;
	private String photoname;
	private String info;
	private String userName;
	private int id;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public static String getNewFilename(String oldfilename) {
		String uuid = UUID.randomUUID().toString();//全球通用唯一表示
		System.out.println(uuid);
		return uuid+"_"+oldfilename;
	}
	public FileUploadUtils(String name,String place,String time,String people,String info,String userName,String photoname) {
		this.name = name;
		this.place = place;
		this.time = time;
		this.people = people;
		this.info = info;
		this.photoname = photoname;
		this.userName=userName;
	
	}
}
