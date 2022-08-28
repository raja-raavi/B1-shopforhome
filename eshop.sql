-- Table: public.cart

-- DROP TABLE IF EXISTS public.cart;

CREATE TABLE IF NOT EXISTS public.cart
(
    user_id bigint NOT NULL,
    CONSTRAINT cart_pkey1 PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cart
    OWNER to postgres;
	
----------------------------------------------------

-- Table: public.discount

-- DROP TABLE IF EXISTS public.discount;

CREATE TABLE IF NOT EXISTS public.discount
(
    id character varying COLLATE pg_catalog."default" NOT NULL,
    status bigint,
    CONSTRAINT discount_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.discount
    OWNER to postgres;
	
------------------------------------------------------

-- Table: public.order_main

-- DROP TABLE IF EXISTS public.order_main;

CREATE TABLE IF NOT EXISTS public.order_main
(
    order_id bigint NOT NULL,
    buyer_address character varying(255) COLLATE pg_catalog."default",
    buyer_email character varying(255) COLLATE pg_catalog."default",
    buyer_name character varying(255) COLLATE pg_catalog."default",
    buyer_phone character varying(255) COLLATE pg_catalog."default",
    create_time timestamp without time zone,
    order_amount numeric(19,2) NOT NULL,
    order_status integer NOT NULL DEFAULT 0,
    update_time timestamp without time zone,
    CONSTRAINT order_main_pkey PRIMARY KEY (order_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_main
    OWNER to postgres;
	
------------------------------------------------------

-- Table: public.product_category

-- DROP TABLE IF EXISTS public.product_category;

CREATE TABLE IF NOT EXISTS public.product_category
(
    category_id integer NOT NULL,
    category_name character varying(255) COLLATE pg_catalog."default",
    category_type integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    CONSTRAINT product_category_pkey PRIMARY KEY (category_id),
    CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_category
    OWNER to postgres;
	
--------------------------------------------------------

-- Table: public.product_in_order

-- DROP TABLE IF EXISTS public.product_in_order;

CREATE TABLE IF NOT EXISTS public.product_in_order
(
    id bigint NOT NULL,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    product_icon character varying(255) COLLATE pg_catalog."default",
    product_id character varying(255) COLLATE pg_catalog."default",
    product_name character varying(255) COLLATE pg_catalog."default",
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_pkey PRIMARY KEY (id),
    CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id)
        REFERENCES public.order_main (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_cart_fkey FOREIGN KEY (cart_user_id)
        REFERENCES public.cart (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT product_in_order_count_check CHECK (count >= 1),
    CONSTRAINT product_in_order_product_stock_check CHECK (product_stock >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_in_order
    OWNER to postgres;
	
------------------------------------------------------------

-- Table: public.product_info

-- DROP TABLE IF EXISTS public.product_info;

CREATE TABLE IF NOT EXISTS public.product_info
(
    product_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    category_type integer DEFAULT 0,
    create_time timestamp without time zone,
    product_description character varying(255) COLLATE pg_catalog."default",
    product_icon character varying(255) COLLATE pg_catalog."default",
    product_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_status integer DEFAULT 0,
    product_stock integer NOT NULL,
    update_time timestamp without time zone,
    CONSTRAINT product_info_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_info_product_stock_check CHECK (product_stock >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_info
    OWNER to postgres;
	
-----------------------------------------------------------------

-- Table: public.tokens



ALTER TABLE IF EXISTS public.tokens
    OWNER to postgres;
	
--------------------------------------------------------------------------

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    name character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    phone character varying(255) COLLATE pg_catalog."default",
    role character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;
	
---------------------------------------------------------------------------

-- Table: public.wishlist

-- DROP TABLE IF EXISTS public.wishlist;

CREATE TABLE IF NOT EXISTS public.wishlist
(
    id bigint NOT NULL,
    created_date timestamp without time zone,
    user_id bigint,
    product_id character varying COLLATE pg_catalog."default",
    CONSTRAINT wishlist_pkey PRIMARY KEY (id),
    CONSTRAINT product_wish_fkey FOREIGN KEY (product_id)
        REFERENCES public.product_info (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "user_wish_Fkey" FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.wishlist
    OWNER to postgres;
	
---------------------------------------------------------------------------------------------------






--Product_Info


INSERT INTO "public"."product_category" VALUES (2147483641, 'WALL PAINTINGS', 0, '2022-07-07 23:03:26', '2022-07-07 23:03:26');
INSERT INTO "public"."product_category" VALUES (2147483642, 'WALL DECORS', 1, '2022-07-07 23:03:26', '2022-07-07 23:03:26');
INSERT INTO "public"."product_category" VALUES (2147483643, 'CLOCKS', 2, '2022-07-07 23:03:26', '2022-07-07 23:03:26');
INSERT INTO "public"."product_category" VALUES (2147483644, 'LIGHTINGS', 3, '2022-07-07 23:03:26', '2022-07-07 23:03:26');


--Product



INSERT INTO "public"."product_info" VALUES ('1', 0, '2022-07-25 23:03:26', 'Theme: Nature, Water Resistant, Framencluded, W x H: 10 inch x 14 inch,
Type: Digital Reprint', 'https://rukminim1.flixcart.com/image/416/416/kri3xjk0/painting/o/z/j/10-8346-pf-9x12frame-pnf-original-imag59tyv6ydyway.jpeg?q=70', 'Waterfall Photo Frame', 80.00, 0, 30, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('2', 0, '2022-07-25 23:03:26','Theme: Modern Art, Frame Included, W x H: 10 inch x 14 inch, Type: Ink', 'https://rukminim1.flixcart.com/image/416/416/knqd3m80/painting/d/e/w/35-fpr3amq262-ecraftindia-original-imag2ck4zxjnfwhd.jpeg?q=70', 'Quote Frame', 40.00, 0, 24, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('3', 0, '2022-07-25 23:03:26','Theme: Reprint, Frame Included, W x H: 14 inch x 20 inch, Type: Ink', 'https://rukminim1.flixcart.com/image/416/416/painting/c/e/f/saa3170-saf-original-imae8mauwhd7ejr4.jpeg?q=70', 'Butterfly Frame', 150.00, 0, 24, '2022-07-25 23:03:26');



INSERT INTO "public"."product_info" VALUES ('4', 1, '2022-07-25 23:03:26', 'wall hanging, Made of wooden, plastic, Color: Multicolor', 'https://rukminim1.flixcart.com/image/416/416/kjq1mkw0-0/showpiece-figurine/x/q/o/rhc-s22-brothers-creation-original-imafz8mjugdkbtap.jpeg?q=70', 'Handcrafted Bells', 35.00, 0, 20, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('6', 1, '2022-07-25 23:03:26', 'Suitable For: Living Room & Bedroom, Material: Wooden, No of Shelves: 3, Rust Proof', 'https://rukminim1.flixcart.com/image/416/416/jw2f6vk0/rack-shelf/y/2/e/scdr-899-decorhand-original-imafb8wpuyf4sxym.jpeg?q=70', 'Wooden Wall Shelf', 45.00, 0, 9, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('5', 1, '2022-07-25 23:03:26', 'Material: MDF (Medium Density Fiber), Width x Height: 41 inch x 26 inch,', 'https://rukminim1.flixcart.com/image/416/416/kirr24w0-0/wall-decoration/n/u/u/rafuf-wooden-intersecting-wall-shelves-set-of-8-red-black-8-original-imafyhgg9u2ufd2a.jpeg?q=70', 'Wall Shelves', 100.00, 0, 13, '2022-07-25 23:03:26');



INSERT INTO "public"."product_info" VALUES ('9', 2, '2022-07-25 23:03:26', 'Size: 34 cm x 36 cm, Frame Material: Plastic, Glass, Wooden, Clock Type: Analog', 'https://rukminim1.flixcart.com/image/416/416/kaijgy80/wall-clock/s/3/z/analoge-33-cm-x-33-cm-wall-clock-st-58745638-analog-ajanta-original-imafs2z3zgw6qduw.jpeg?q=70', 'Analog Wallclock', 50.00, 0, 45, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('7', 2, '2022-07-025 23:03:26', 'Size: 33 cm x 33 cm,  Mechanism: Quartz, Clock Type: Analog ', 'https://rukminim1.flixcart.com/image/416/416/kfr5le80/wall-clock/b/p/h/analog-wall-clock-33cm-x-33cm-oreva-2-pcock-black-analog-ajanta-original-imafw55nhjcyyxvc.jpeg?q=70', 'Analog Wallclock', 80.00, 0, 60, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('8', 2, '2022-07-025 23:03:26', 'Size: 32.5 cm x 32.5 cm, Mechanism: Silent Sweep, Frame Material: Plastic, Clock Type: Analog', 'https://rukminim1.flixcart.com/image/416/416/jy90eq80/wall-clock/v/7/y/wall-clock-w0013pa01-analog-titan-original-imafggf8vxd7y79x.jpeg?q=70', 'Titan Analog Clock', 80.00, 0, 60, '2022-07-25 23:03:26');


INSERT INTO "public"."product_info" VALUES ('10', 3, '2022-07-07 23:03:26', 'Color: Gold, Power Source: Electric, W x H: 25.5 cm x 41 cm, With Shade', 'https://rukminim1.flixcart.com/image/416/416/krf91u80/table-lamp/8/q/m/classic-designer-foziqtl-0033202193-foziq-original-imag58yure9ph2rh.jpeg?q=70', 'Night Lamp', 20.00, 0, 29, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('11', 3, '2022-07-07 23:03:26', 'Type: Uplight, Surface Mounted, Porch Lights', 'https://rukminim1.flixcart.com/image/416/416/k5y7tzk0/wall-lamp/d/k/e/wall-lamp-goldstar-original-imafzgv8cgrcfmh9.jpeg?q=70', 'Uplight Wall Lamp', 16.00, 0, 55, '2022-07-25 23:03:26');
INSERT INTO "public"."product_info" VALUES ('12', 3, '2022-07-07 23:03:26', 'Type: Uplight, Surface Mounted, Porch Lights', 'https://rukminim1.flixcart.com/image/416/416/k73nlow0/wall-lamp/2/z/h/flat-style-designer-led-sconce-wall-lamp-light-o79-afast-original-imafpe9wzgebvkdj.jpeg?q=70', 'Uplight Wall Lamp', 49.00, 0, 6, '2022-07-25 23:03:26');



------------------------------------------------------------------------------------------------------------------------

--Users

INSERT INTO "public"."users" VALUES (2147483645, true, 'Plot 2, ram Nagar, hydrabad', 'admin@eshop.com', 'Admin', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');

CREATE SEQUENCE IF NOT EXISTS public.hibernate_sequence
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.hibernate_sequence
    OWNER TO postgres