CREATE TABLE PATIENT (ID BIGINT NOT NULL, BIRTHDATE DATE, NAME VARCHAR(255), PATIENTID BIGINT, PRIMARY KEY (ID))
CREATE TABLE TREATMENT (ID BIGINT NOT NULL, TTYPE VARCHAR(31), DIAGNOSIS VARCHAR(255), patient_fk BIGINT, provider_fk BIGINT, PRIMARY KEY (ID))
CREATE TABLE DRUGTREATMENT (ID BIGINT NOT NULL, DOSAGE FLOAT, DRUG VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE PROVIDER (ID BIGINT NOT NULL, NPI BIGINT, SPECIALIZATION VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE SURGERYTREATMENT (ID BIGINT NOT NULL, SURGERYDATE DATE, PRIMARY KEY (ID))
CREATE TABLE RADIOLOGYTREATMENT (ID BIGINT NOT NULL, PRIMARY KEY (ID))
CREATE TABLE RadiologyTreatment_DATES (RadiologyTreatment_ID BIGINT, DATES DATE)
ALTER TABLE TREATMENT ADD CONSTRAINT FK_TREATMENT_provider_fk FOREIGN KEY (provider_fk) REFERENCES PROVIDER (ID)
ALTER TABLE TREATMENT ADD CONSTRAINT FK_TREATMENT_patient_fk FOREIGN KEY (patient_fk) REFERENCES PATIENT (ID)
ALTER TABLE DRUGTREATMENT ADD CONSTRAINT FK_DRUGTREATMENT_ID FOREIGN KEY (ID) REFERENCES TREATMENT (ID)
ALTER TABLE SURGERYTREATMENT ADD CONSTRAINT FK_SURGERYTREATMENT_ID FOREIGN KEY (ID) REFERENCES TREATMENT (ID)
ALTER TABLE RADIOLOGYTREATMENT ADD CONSTRAINT FK_RADIOLOGYTREATMENT_ID FOREIGN KEY (ID) REFERENCES TREATMENT (ID)
ALTER TABLE RadiologyTreatment_DATES ADD CONSTRAINT FK_RadiologyTreatment_DATES_RadiologyTreatment_ID FOREIGN KEY (RadiologyTreatment_ID) REFERENCES TREATMENT (ID)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(38), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0)
