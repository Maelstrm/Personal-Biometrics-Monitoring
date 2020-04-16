CREATE TABLE "User" (
	"user_id" TEXT NOT NULL,
	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"birthday_time" DATE NOT NULL,
	"sex" TEXT NOT NULL,
	"gender" TEXT NOT NULL,
	"height" integer NOT NULL,
	CONSTRAINT "User_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Sessions" (
	"user_id" serial NOT NULL,
	"session_id" serial NOT NULL,
	"user_comments" TEXT NOT NULL,
	CONSTRAINT "Sessions_pk" PRIMARY KEY ("session_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Measurement_Data" (
	"session_id" TEXT NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Session_Data" (
	"session_id" TEXT NOT NULL,
	"start_time" serial NOT NULL,
	"end_time" DATE NOT NULL,
	"power_source" TEXT NOT NULL,
	CONSTRAINT "Session_Data_pk" PRIMARY KEY ("session_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "EEG_Data" (
	"session_id" TEXT NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Pulse_Ox_Data" (
	"session_id" TEXT NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ECG_Data" (
	"session_id" TEXT NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Sessions" ADD CONSTRAINT "Sessions_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");

ALTER TABLE "Measurement_Data" ADD CONSTRAINT "Measurement_Data_fk0" FOREIGN KEY ("session_id") REFERENCES "Sessions"("session_id");

ALTER TABLE "Session_Data" ADD CONSTRAINT "Session_Data_fk0" FOREIGN KEY ("session_id") REFERENCES "Sessions"("session_id");

ALTER TABLE "EEG_Data" ADD CONSTRAINT "EEG_Data_fk0" FOREIGN KEY ("session_id") REFERENCES "Measurement_Data"("session_id");

ALTER TABLE "Pulse_Ox_Data" ADD CONSTRAINT "Pulse_Ox_Data_fk0" FOREIGN KEY ("session_id") REFERENCES "Measurement_Data"("session_id");

ALTER TABLE "ECG_Data" ADD CONSTRAINT "ECG_Data_fk0" FOREIGN KEY ("session_id") REFERENCES "Measurement_Data"("session_id");

