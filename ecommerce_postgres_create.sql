CREATE TABLE "Customers" (
	"id" serial NOT NULL,
	"name" varchar(40) NOT NULL,
	"surname" varchar(40) NOT NULL,
	"age" integer NOT NULL,
	"email" varchar(40) NOT NULL UNIQUE,
	"password" varchar(40) NOT NULL,
	"status" bool NOT NULL,
	CONSTRAINT "Customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "address" (
	"id" serial NOT NULL,
	"user_id" serial NOT NULL,
	"street" varchar(255) NOT NULL,
	"phone" bigserial UNIQUE,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Suppliers" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"suranme" varchar(255) NOT NULL,
	"age" integer NOT NULL,
	"order_id" bigserial NOT NULL,
	"stock_id" bigserial NOT NULL,
	CONSTRAINT "Suppliers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Products" (
	"id" serial NOT NULL,
	"product_name" varchar(255) NOT NULL,
	"category_id" bigserial NOT NULL,
	"sub_category_id" bigserial NOT NULL,
	"tag_id" bigserial NOT NULL,
	"category_name" varchar(255) NOT NULL,
	"sub_category_name" varchar(255) NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Categories" (
	"id" serial NOT NULL,
	"category_name" varchar(255) NOT NULL,
	CONSTRAINT "Categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Sub_categories" (
	"id" serial NOT NULL,
	"sub_category_name" varchar(255) NOT NULL,
	"category_id" serial NOT NULL,
	CONSTRAINT "Sub_categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Tags" (
	"id" serial NOT NULL,
	"tag_name" varchar(255) NOT NULL,
	CONSTRAINT "Tags_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Stocks" (
	"id" serial NOT NULL,
	"total_stocks" bigint NOT NULL,
	"product_id" bigserial NOT NULL,
	"product_stocks" bigint NOT NULL,
	CONSTRAINT "Stocks_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Features" (
	"id" serial NOT NULL,
	"color_name" varchar(255) NOT NULL,
	"product_id" bigserial NOT NULL,
	"size" integer NOT NULL,
	"type" varchar(255) NOT NULL,
	CONSTRAINT "Features_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Orders" (
	"id" serial NOT NULL,
	"customer_id" bigserial NOT NULL,
	"product_id" bigserial NOT NULL,
	"product_name" varchar(255) NOT NULL,
	"amount" integer NOT NULL,
	"cart_id" bigserial NOT NULL,
	CONSTRAINT "Orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Cart" (
	"id" serial NOT NULL,
	"product_name" varchar(255) NOT NULL,
	"product_id" bigserial NOT NULL,
	CONSTRAINT "Cart_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("user_id") REFERENCES "Customers"("id");

ALTER TABLE "Suppliers" ADD CONSTRAINT "Suppliers_fk0" FOREIGN KEY ("order_id") REFERENCES "Orders"("id");
ALTER TABLE "Suppliers" ADD CONSTRAINT "Suppliers_fk1" FOREIGN KEY ("stock_id") REFERENCES "Stocks"("id");

ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("category_id") REFERENCES "Categories"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk1" FOREIGN KEY ("sub_category_id") REFERENCES "Sub_categories"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk2" FOREIGN KEY ("tag_id") REFERENCES "Tags"("id");


ALTER TABLE "Sub_categories" ADD CONSTRAINT "Sub_categories_fk0" FOREIGN KEY ("category_id") REFERENCES "Categories"("id");


ALTER TABLE "Stocks" ADD CONSTRAINT "Stocks_fk0" FOREIGN KEY ("product_id") REFERENCES "Products"("id");

ALTER TABLE "Features" ADD CONSTRAINT "Features_fk0" FOREIGN KEY ("product_id") REFERENCES "Products"("id");

ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk0" FOREIGN KEY ("customer_id") REFERENCES "Customers"("id");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk1" FOREIGN KEY ("product_id") REFERENCES "Products"("id");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk2" FOREIGN KEY ("cart_id") REFERENCES "Cart"("id");

ALTER TABLE "Cart" ADD CONSTRAINT "Cart_fk0" FOREIGN KEY ("product_id") REFERENCES "Products"("id");

