PGDMP                     
    v            misakwam    10.5    10.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16399    misakwam    DATABASE     �   CREATE DATABASE misakwam WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE misakwam;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16412 	   contactos    TABLE     y   CREATE TABLE public.contactos (
    emisor bigint NOT NULL,
    receptor bigint NOT NULL,
    id_chat bigint NOT NULL
);
    DROP TABLE public.contactos;
       public         postgres    false    3            �            1259    16410    contactos_id_chat_seq    SEQUENCE     ~   CREATE SEQUENCE public.contactos_id_chat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.contactos_id_chat_seq;
       public       postgres    false    199    3                       0    0    contactos_id_chat_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.contactos_id_chat_seq OWNED BY public.contactos.id_chat;
            public       postgres    false    198            �            1259    16430    mensajes    TABLE     s   CREATE TABLE public.mensajes (
    id_chat bigint NOT NULL,
    mensaje text NOT NULL,
    via boolean NOT NULL
);
    DROP TABLE public.mensajes;
       public         postgres    false    3            �            1259    16402    usuarios    TABLE     @  CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    nombres character varying(100) NOT NULL,
    apellidos character varying(100) NOT NULL,
    celular character varying(20),
    correo character varying(100) NOT NULL,
    usuario character varying(100) NOT NULL,
    contrasena character varying(50) NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    false    3            �            1259    16400    usuarios_id_seq    SEQUENCE     x   CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public       postgres    false    3    197                       0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
            public       postgres    false    196            z
           2604    16415    contactos id_chat    DEFAULT     v   ALTER TABLE ONLY public.contactos ALTER COLUMN id_chat SET DEFAULT nextval('public.contactos_id_chat_seq'::regclass);
 @   ALTER TABLE public.contactos ALTER COLUMN id_chat DROP DEFAULT;
       public       postgres    false    199    198    199            y
           2604    16405    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197                      0    16412 	   contactos 
   TABLE DATA               >   COPY public.contactos (emisor, receptor, id_chat) FROM stdin;
    public       postgres    false    199                    0    16430    mensajes 
   TABLE DATA               9   COPY public.mensajes (id_chat, mensaje, via) FROM stdin;
    public       postgres    false    200   %       �
          0    16402    usuarios 
   TABLE DATA               `   COPY public.usuarios (id, nombres, apellidos, celular, correo, usuario, contrasena) FROM stdin;
    public       postgres    false    197   B                  0    0    contactos_id_chat_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.contactos_id_chat_seq', 1, false);
            public       postgres    false    198                       0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 33, true);
            public       postgres    false    196            �
           2606    16424 '   contactos contactos_emisor_receptor_key 
   CONSTRAINT     n   ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_emisor_receptor_key UNIQUE (emisor, receptor);
 Q   ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_emisor_receptor_key;
       public         postgres    false    199    199            �
           2606    16417    contactos contactos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id_chat);
 B   ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_pkey;
       public         postgres    false    199            |
           2606    16407    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    197            ~
           2606    16409    usuarios usuarios_usuario_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);
 G   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_usuario_key;
       public         postgres    false    197            �
           2606    16418    contactos contactos_emisor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_emisor_fkey FOREIGN KEY (emisor) REFERENCES public.usuarios(id);
 I   ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_emisor_fkey;
       public       postgres    false    197    2684    199            �
           2606    16425 !   contactos contactos_receptor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_receptor_fkey FOREIGN KEY (receptor) REFERENCES public.usuarios(id);
 K   ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_receptor_fkey;
       public       postgres    false    199    197    2684                  x������ � �            x������ � �      �
   �  x����n�0���Sx���H�[�ZF�v9ɴ̘��T4y�>C_�G�q�E� � |���ǣ�����e��þ�Z�4�T�T�)ﺀ�߶�?�`c!o�v��&;6!6QR�ua�a)�D*h[{%l�C�{=e?F�.���]"O�qhh6@V�T��
���[�MQx���gl�ch0-rL�������8F�G�J�C�U��|�K��;I�Yj�Ն��Q��G^���>����Ð�������m���(��fF����N�
��&:˪{���j]*�1�a㺅��s�u�Os���S|�������ѽ-`��f�ąɕA��B)p��p�(l��+w]�c���.�*�7{�8���=D����{Z=P���H��s�K;�F�����BUl�p�ާ�־�u��/�]:�G��V�F�&�     