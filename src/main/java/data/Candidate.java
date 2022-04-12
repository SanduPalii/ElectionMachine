package data;

import java.io.Serializable;

/**
 * @author sonny
 *
 */
public class Candidate implements Serializable{
	private int id;
	private String lName;
	private String fName;
	private String pAlign;
	private String hState;
	private int cAge;
	private String whyQuestion;
	private String becauseAnswer;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getLastName() {
		return lName;
	}
	public void setLastName(String lName) {
		this.lName = lName;
	}
	
	
	public String getFirstName() {
		return fName;
	}
	public void setFirstName(String fName) {
		this.fName = fName;
	}
	
	
	public String getPalign() {
		return pAlign;
	}
	public void setPalign(String pAlign) {
		this.pAlign = pAlign;
	}
	
	public String getState() {
		return hState;
	}
	public void setState(String hState) {
		this.hState = hState;
	}
	
	public int getAge() {
		return cAge;
	}
	public void setAge(int cAge) {
		this.cAge = cAge;
	}
	
	public String getWhyQ() {
		return whyQuestion;
	}
	public void setWhyQ(String whyQuestion) {
		this.whyQuestion = whyQuestion;
	}
	
	public String getBecauseAnswer() {
		return becauseAnswer;
	}
	public void setBecauseAnswer(String becauseAnswer) {
		this.becauseAnswer = becauseAnswer;
	}
	
	public String toString() {
		return id + " " + lName + " " + fName + "  " + pAlign + " " + hState + " " + cAge + "  " + whyQuestion + " " + becauseAnswer;
	}
}