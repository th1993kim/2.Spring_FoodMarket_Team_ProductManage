package com.market.member.dto;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO
{
	private int member_id; 		//회원식별번호	
	private String email;		//이메일
	private String password;		//비밀번호
	private String name;	//이름
	private String phone;	//전화번호
	private String address;	//주소
	private String member_role;	//회원권한
	private String member_status;	//회원상태

	public MemberDTO()
	{
	}
	public MemberDTO(int member_id, String email, String password, String name,
			String phone, String address, String member_role,
			String member_status)
	{
		this.member_id = member_id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.member_role = member_role;
		this.member_status = member_status;
	}

	public int getMember_id()
	{
		return member_id;
	}
	public void setMember_id(int member_id)
	{
		this.member_id = member_id;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getMember_role()
	{
		return member_role;
	}
	public void setMember_role(String member_role)
	{
		this.member_role = member_role;
	}
	public String getMember_status()
	{
		return member_status;
	}
	public void setMember_status(String member_status)
	{
		this.member_status = member_status;
	}
}
