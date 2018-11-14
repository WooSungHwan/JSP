package com.test.jsp;

/*

자바빈 설계 규약

1. 모든 멤버 변수는 private 접근지정자로 선언 + getter/setter 구현
2. getter는 매개변수를 가질 수 없다.
3. setter는 반드시 매개변수를 1개 이상 가져야한다.
4. getter만 혼자 구현은 가능하다. 하지만 setter 혼자서만 구현은 불가능하다.(읽기전용 O, 쓰기전용X)
5. 생성자 매개변수를 가질 수 없다.(생성자 오버로딩 금지)

용도 : 데이터를 관리하기 위한 상자(단위) == DTO 유사
  
  
  
 */

public class Student {
	
	private String name;
	private int age;
	private int kor;
	private int eng;
	private int math;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	
	
	
	
	
}
