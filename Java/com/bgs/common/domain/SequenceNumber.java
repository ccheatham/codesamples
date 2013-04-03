package com.bgs.common.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SEQUENCE_NUMBER")
public class SequenceNumber implements Serializable {

	private static final long serialVersionUID = 5184650574192086974L;

	@Id
	@Column(name="column_name")
	private String columnName;

	@Column(name="seq_num")
	private Integer seqNum;

	
	public SequenceNumber() {
		super();
	}

	public String getColumnName() {
		return this.columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public Integer getSeqNum() {
		return this.seqNum;
	}

	public void setSeqNum(Integer seqNum) {
		this.seqNum = seqNum;
	}

}
