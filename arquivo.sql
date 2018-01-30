PGDMP     ,                     v           curso_spring    10.0    10.0 V    g           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            h           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            i           1262    45888    curso_spring    DATABASE     �   CREATE DATABASE curso_spring WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE curso_spring;
             mira    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            j           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            k           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    46670 	   categoria    TABLE     U   CREATE TABLE categoria (
    id integer NOT NULL,
    nome character varying(255)
);
    DROP TABLE public.categoria;
       public         mira    false    3            �            1259    46668    categoria_id_seq    SEQUENCE     �   CREATE SEQUENCE categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public       mira    false    3    197            l           0    0    categoria_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;
            public       mira    false    196            �            1259    46678    cidade    TABLE     i   CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer
);
    DROP TABLE public.cidade;
       public         mira    false    3            �            1259    46676    cidade_id_seq    SEQUENCE     ~   CREATE SEQUENCE cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.cidade_id_seq;
       public       mira    false    199    3            m           0    0    cidade_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;
            public       mira    false    198            �            1259    46686    cliente    TABLE     �   CREATE TABLE cliente (
    id integer NOT NULL,
    cpf_ou_cnpj character varying(255),
    email character varying(255),
    nome character varying(255),
    tipo integer
);
    DROP TABLE public.cliente;
       public         mira    false    3            �            1259    46684    cliente_id_seq    SEQUENCE        CREATE SEQUENCE cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public       mira    false    201    3            n           0    0    cliente_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;
            public       mira    false    200            �            1259    46697    endereco    TABLE       CREATE TABLE endereco (
    id integer NOT NULL,
    bairro character varying(255),
    cep character varying(255),
    complemento character varying(255),
    logradouro character varying(255),
    numero character varying(255),
    cidade_id integer,
    cliente_id integer
);
    DROP TABLE public.endereco;
       public         mira    false    3            �            1259    46695    endereco_id_seq    SEQUENCE     �   CREATE SEQUENCE endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.endereco_id_seq;
       public       mira    false    203    3            o           0    0    endereco_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE endereco_id_seq OWNED BY endereco.id;
            public       mira    false    202            �            1259    46708    estado    TABLE     R   CREATE TABLE estado (
    id integer NOT NULL,
    nome character varying(255)
);
    DROP TABLE public.estado;
       public         mira    false    3            �            1259    46706    estado_id_seq    SEQUENCE     ~   CREATE SEQUENCE estado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.estado_id_seq;
       public       mira    false    205    3            p           0    0    estado_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE estado_id_seq OWNED BY estado.id;
            public       mira    false    204            �            1259    46714    item_pedido    TABLE     �   CREATE TABLE item_pedido (
    desconto double precision,
    preco double precision,
    quantidade integer,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);
    DROP TABLE public.item_pedido;
       public         mira    false    3            �            1259    46719 	   pagamento    TABLE     O   CREATE TABLE pagamento (
    pedido_id integer NOT NULL,
    estado integer
);
    DROP TABLE public.pagamento;
       public         mira    false    3            �            1259    46724    pagamento_com_boleto    TABLE     �   CREATE TABLE pagamento_com_boleto (
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL
);
 (   DROP TABLE public.pagamento_com_boleto;
       public         mira    false    3            �            1259    46729    pagamento_com_cartao    TABLE     `   CREATE TABLE pagamento_com_cartao (
    num_parcelas integer,
    pedido_id integer NOT NULL
);
 (   DROP TABLE public.pagamento_com_cartao;
       public         mira    false    3            �            1259    46736    pedido    TABLE     �   CREATE TABLE pedido (
    id integer NOT NULL,
    instante timestamp without time zone,
    cliente_id integer,
    endereco_de_entrega_id integer
);
    DROP TABLE public.pedido;
       public         mira    false    3            �            1259    46734    pedido_id_seq    SEQUENCE     ~   CREATE SEQUENCE pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pedido_id_seq;
       public       mira    false    211    3            q           0    0    pedido_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE pedido_id_seq OWNED BY pedido.id;
            public       mira    false    210            �            1259    46744    produto    TABLE     o   CREATE TABLE produto (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision
);
    DROP TABLE public.produto;
       public         mira    false    3            �            1259    46750    produto_categoria    TABLE     g   CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);
 %   DROP TABLE public.produto_categoria;
       public         mira    false    3            �            1259    46742    produto_id_seq    SEQUENCE        CREATE SEQUENCE produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.produto_id_seq;
       public       mira    false    213    3            r           0    0    produto_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE produto_id_seq OWNED BY produto.id;
            public       mira    false    212            �            1259    46753    telefone    TABLE     a   CREATE TABLE telefone (
    cliente_id integer NOT NULL,
    telefones character varying(255)
);
    DROP TABLE public.telefone;
       public         mira    false    3            �
           2604    46673    categoria id    DEFAULT     ^   ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public       mira    false    196    197    197            �
           2604    46681 	   cidade id    DEFAULT     X   ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);
 8   ALTER TABLE public.cidade ALTER COLUMN id DROP DEFAULT;
       public       mira    false    198    199    199            �
           2604    46689 
   cliente id    DEFAULT     Z   ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public       mira    false    200    201    201            �
           2604    46700    endereco id    DEFAULT     \   ALTER TABLE ONLY endereco ALTER COLUMN id SET DEFAULT nextval('endereco_id_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public       mira    false    202    203    203            �
           2604    46711 	   estado id    DEFAULT     X   ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);
 8   ALTER TABLE public.estado ALTER COLUMN id DROP DEFAULT;
       public       mira    false    205    204    205            �
           2604    46739 	   pedido id    DEFAULT     X   ALTER TABLE ONLY pedido ALTER COLUMN id SET DEFAULT nextval('pedido_id_seq'::regclass);
 8   ALTER TABLE public.pedido ALTER COLUMN id DROP DEFAULT;
       public       mira    false    211    210    211            �
           2604    46747 
   produto id    DEFAULT     Z   ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);
 9   ALTER TABLE public.produto ALTER COLUMN id DROP DEFAULT;
       public       mira    false    212    213    213            R          0    46670 	   categoria 
   TABLE DATA               &   COPY categoria (id, nome) FROM stdin;
    public       mira    false    197   [[       T          0    46678    cidade 
   TABLE DATA               .   COPY cidade (id, nome, estado_id) FROM stdin;
    public       mira    false    199   �[       V          0    46686    cliente 
   TABLE DATA               >   COPY cliente (id, cpf_ou_cnpj, email, nome, tipo) FROM stdin;
    public       mira    false    201    \       X          0    46697    endereco 
   TABLE DATA               d   COPY endereco (id, bairro, cep, complemento, logradouro, numero, cidade_id, cliente_id) FROM stdin;
    public       mira    false    203   E\       Z          0    46708    estado 
   TABLE DATA               #   COPY estado (id, nome) FROM stdin;
    public       mira    false    205   �\       [          0    46714    item_pedido 
   TABLE DATA               R   COPY item_pedido (desconto, preco, quantidade, pedido_id, produto_id) FROM stdin;
    public       mira    false    206   �\       \          0    46719 	   pagamento 
   TABLE DATA               /   COPY pagamento (pedido_id, estado) FROM stdin;
    public       mira    false    207   3]       ]          0    46724    pagamento_com_boleto 
   TABLE DATA               S   COPY pagamento_com_boleto (data_pagamento, data_vencimento, pedido_id) FROM stdin;
    public       mira    false    208   X]       ^          0    46729    pagamento_com_cartao 
   TABLE DATA               @   COPY pagamento_com_cartao (num_parcelas, pedido_id) FROM stdin;
    public       mira    false    209   �]       `          0    46736    pedido 
   TABLE DATA               K   COPY pedido (id, instante, cliente_id, endereco_de_entrega_id) FROM stdin;
    public       mira    false    211   �]       b          0    46744    produto 
   TABLE DATA               +   COPY produto (id, nome, preco) FROM stdin;
    public       mira    false    213   �]       c          0    46750    produto_categoria 
   TABLE DATA               >   COPY produto_categoria (produto_id, categoria_id) FROM stdin;
    public       mira    false    214   �^       d          0    46753    telefone 
   TABLE DATA               2   COPY telefone (cliente_id, telefones) FROM stdin;
    public       mira    false    215   �^       s           0    0    categoria_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('categoria_id_seq', 7, true);
            public       mira    false    196            t           0    0    cidade_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('cidade_id_seq', 3, true);
            public       mira    false    198            u           0    0    cliente_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('cliente_id_seq', 1, true);
            public       mira    false    200            v           0    0    endereco_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('endereco_id_seq', 2, true);
            public       mira    false    202            w           0    0    estado_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('estado_id_seq', 2, true);
            public       mira    false    204            x           0    0    pedido_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('pedido_id_seq', 2, true);
            public       mira    false    210            y           0    0    produto_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('produto_id_seq', 11, true);
            public       mira    false    212            �
           2606    46675    categoria categoria_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public         mira    false    197            �
           2606    46683    cidade cidade_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cidade DROP CONSTRAINT cidade_pkey;
       public         mira    false    199            �
           2606    46694    cliente cliente_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public         mira    false    201            �
           2606    46705    endereco endereco_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public         mira    false    203            �
           2606    46713    estado estado_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public         mira    false    205            �
           2606    46718    item_pedido item_pedido_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (pedido_id, produto_id);
 F   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT item_pedido_pkey;
       public         mira    false    206    206            �
           2606    46728 .   pagamento_com_boleto pagamento_com_boleto_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT pagamento_com_boleto_pkey PRIMARY KEY (pedido_id);
 X   ALTER TABLE ONLY public.pagamento_com_boleto DROP CONSTRAINT pagamento_com_boleto_pkey;
       public         mira    false    208            �
           2606    46733 .   pagamento_com_cartao pagamento_com_cartao_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT pagamento_com_cartao_pkey PRIMARY KEY (pedido_id);
 X   ALTER TABLE ONLY public.pagamento_com_cartao DROP CONSTRAINT pagamento_com_cartao_pkey;
       public         mira    false    209            �
           2606    46723    pagamento pagamento_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id);
 B   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_pkey;
       public         mira    false    207            �
           2606    46741    pedido pedido_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public         mira    false    211            �
           2606    46749    produto produto_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public         mira    false    213            �
           2606    46757 $   cliente uk_cmxo70m08n43599l3h0h07cc6 
   CONSTRAINT     Y   ALTER TABLE ONLY cliente
    ADD CONSTRAINT uk_cmxo70m08n43599l3h0h07cc6 UNIQUE (email);
 N   ALTER TABLE ONLY public.cliente DROP CONSTRAINT uk_cmxo70m08n43599l3h0h07cc6;
       public         mira    false    201            �
           2606    46813 -   produto_categoria fk1c0y58d3n6x3m6euv2j3h64vt    FK CONSTRAINT     �   ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt FOREIGN KEY (produto_id) REFERENCES produto(id);
 W   ALTER TABLE ONLY public.produto_categoria DROP CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt;
       public       mira    false    213    214    2762            �
           2606    46803 "   pedido fk1fihyy2fnocpuwc74674qmfkv    FK CONSTRAINT     �   ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv FOREIGN KEY (endereco_de_entrega_id) REFERENCES endereco(id);
 L   ALTER TABLE ONLY public.pedido DROP CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv;
       public       mira    false    211    203    2748            �
           2606    46798 "   pedido fk30s8j2ktpay6of18lbyqn3632    FK CONSTRAINT     x   ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk30s8j2ktpay6of18lbyqn3632 FOREIGN KEY (cliente_id) REFERENCES cliente(id);
 L   ALTER TABLE ONLY public.pedido DROP CONSTRAINT fk30s8j2ktpay6of18lbyqn3632;
       public       mira    false    211    2744    201            �
           2606    46773 '   item_pedido fk60ym08cfoysa17wrn1swyiuda    FK CONSTRAINT     {   ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id) REFERENCES pedido(id);
 Q   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT fk60ym08cfoysa17wrn1swyiuda;
       public       mira    false    211    2760    206            �
           2606    46818 $   telefone fk8aafha0njkoyoe3kvrwsy3g8u    FK CONSTRAINT     z   ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u FOREIGN KEY (cliente_id) REFERENCES cliente(id);
 N   ALTER TABLE ONLY public.telefone DROP CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u;
       public       mira    false    215    201    2744            �
           2606    46763 $   endereco fk8b1kcb3wucapb8dejshyn5fsx    FK CONSTRAINT     x   ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx FOREIGN KEY (cidade_id) REFERENCES cidade(id);
 N   ALTER TABLE ONLY public.endereco DROP CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx;
       public       mira    false    2742    199    203            �
           2606    46768 $   endereco fk8s7ivtl4foyhrfam9xqom73n9    FK CONSTRAINT     z   ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id) REFERENCES cliente(id);
 N   ALTER TABLE ONLY public.endereco DROP CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9;
       public       mira    false    203    2744    201            �
           2606    46788 0   pagamento_com_boleto fkcr74vrxf8nfph0knq2bho8doo    FK CONSTRAINT     �   ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);
 Z   ALTER TABLE ONLY public.pagamento_com_boleto DROP CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo;
       public       mira    false    2754    208    207            �
           2606    46758 "   cidade fkkworrwk40xj58kevvh3evi500    FK CONSTRAINT     v   ALTER TABLE ONLY cidade
    ADD CONSTRAINT fkkworrwk40xj58kevvh3evi500 FOREIGN KEY (estado_id) REFERENCES estado(id);
 L   ALTER TABLE ONLY public.cidade DROP CONSTRAINT fkkworrwk40xj58kevvh3evi500;
       public       mira    false    205    2750    199            �
           2606    46808 -   produto_categoria fkq3g33tp7xk2juh53fbw6y4y57    FK CONSTRAINT     �   ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57 FOREIGN KEY (categoria_id) REFERENCES categoria(id);
 W   ALTER TABLE ONLY public.produto_categoria DROP CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57;
       public       mira    false    197    2740    214            �
           2606    46793 0   pagamento_com_cartao fkta3cdnuuxclwfh52t4qi432ow    FK CONSTRAINT     �   ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);
 Z   ALTER TABLE ONLY public.pagamento_com_cartao DROP CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow;
       public       mira    false    209    2754    207            �
           2606    46783 %   pagamento fkthad9tkw4188hb3qo1lm5ueb0    FK CONSTRAINT     y   ALTER TABLE ONLY pagamento
    ADD CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id) REFERENCES pedido(id);
 O   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0;
       public       mira    false    2760    207    211            �
           2606    46778 '   item_pedido fktk55mn6d6bvl5h0no5uagi3sf    FK CONSTRAINT     }   ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id) REFERENCES produto(id);
 Q   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf;
       public       mira    false    206    213    2762            R   W   x�3���K�/�=��$39�ˈӽ(1�2�HLI,�L�2��L/J�J�2��J,J���2��M-N�wJ����2�H-J+������� {j�      T   .   x�3�MJ-�I�K�L�4�2�>�8_! �4'�ӈ������ ��      V   5   x�3�4426153�55��M,�LtH�M���K������3s�9�b���� >8      X   j   x�˽
�0���S�	��$%�:.��r����ϯ��0��A�%��V�myo�)����Zj>�D`���,�+D�l5ϔ�_y_f�r�)B�0uι��      Z   )   x�3����K,VpO-J�,�2�>�8_! �4'�+F��� �{	�      [   +   x�3�4200�4A.NN# Ә�� �Iqq��qqq �      \      x�3�4�2�4����� ��      ]   "   x����4204�54�52P00�#N#�=... Z<      ^      x�3�4����� �#      `   7   x�3�4204�5��56P04�26�20�4�4�2�� ������)Dƈ+F��� 	q      b   �   x�-�=�@��7��fWD�4V$F����N�?g� ^�1�{y��I�5'�%`k��-��8F	�%ZɑU�-GWx.8�aLFA��
��ip���r�U��݋2�L�����U>o�y�#��%Y{u���%1�R��mp�*���cCD_�52�      c   8   x����0�jb�>(x�?��
BMک4M����b��>��Zĸ�|��3      d   #   x�3�434261�5131�2�]����� Y&\     