package com.ispan.eeit64.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "basicsettings")
public class BasicSettingsBean {
    @Id
    @Column(name = "setName", columnDefinition = "varchar(100) NOT NULL COMMENT'設定名稱'")
    private String setName;

    @Column(name = "setValue", columnDefinition = "	longtext NOT NULL COMMENT'設定值'")
    private String setValue;

	@Override
	public String toString() {
		return "BasicSettingsBean [setName=" + setName + ", setValue=" + setValue + "]";
	}

	public BasicSettingsBean() {
		super();
	}

	public BasicSettingsBean(String setName, String setValue) {
		super();
		this.setName = setName;
		this.setValue = setValue;
	}

	public String getSetName() {
		return setName;
	}

	public void setSetName(String setName) {
		this.setName = setName;
	}

	public String getSetValue() {
		return setValue;
	}

	public void setSetValue(String setValue) {
		this.setValue = setValue;
	}
    
}
