package com.ispan.eeit64.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
}

