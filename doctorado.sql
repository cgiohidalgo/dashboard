PGDMP     0                
    z         	   doctorado    12.12    15.0 #    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    16393 	   doctorado    DATABASE        CREATE DATABASE doctorado WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE doctorado;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            +           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6            �            1259    16412 
   algoritmos    TABLE     m   CREATE TABLE public.algoritmos (
    idalg integer NOT NULL,
    algoritmo character varying(60) NOT NULL
);
    DROP TABLE public.algoritmos;
       public         heap    postgres    false    6            �            1259    16410    algoritmos_idalg_seq    SEQUENCE     �   CREATE SEQUENCE public.algoritmos_idalg_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.algoritmos_idalg_seq;
       public          postgres    false    207    6            ,           0    0    algoritmos_idalg_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.algoritmos_idalg_seq OWNED BY public.algoritmos.idalg;
          public          postgres    false    206            �            1259    16404    analisis_histo    TABLE     �  CREATE TABLE public.analisis_histo (
    idana integer NOT NULL,
    usuario character varying(25) NOT NULL,
    variables character varying(255) NOT NULL,
    var_objetivo character varying(25) NOT NULL,
    idalg smallint NOT NULL,
    res_train double precision NOT NULL,
    res_test double precision NOT NULL,
    fecha timestamp without time zone NOT NULL,
    resultados text NOT NULL,
    archivo character varying(100) NOT NULL
);
 "   DROP TABLE public.analisis_histo;
       public         heap    postgres    false    6            �            1259    16402    analisis_realizados_idana_seq    SEQUENCE     �   CREATE SEQUENCE public.analisis_realizados_idana_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.analisis_realizados_idana_seq;
       public          postgres    false    6    205            -           0    0    analisis_realizados_idana_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public.analisis_realizados_idana_seq OWNED BY public.analisis_histo.idana;
          public          postgres    false    204            �            1259    16394    archivos    TABLE     �   CREATE TABLE public.archivos (
    idarch integer NOT NULL,
    usuario character varying(25) NOT NULL,
    archivo character varying(120) NOT NULL,
    fecha timestamp without time zone
);
    DROP TABLE public.archivos;
       public         heap    postgres    false    6            �            1259    16397    archivos_idarch_seq    SEQUENCE     |   CREATE SEQUENCE public.archivos_idarch_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.archivos_idarch_seq;
       public          postgres    false    202    6            .           0    0    archivos_idarch_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.archivos_idarch_seq OWNED BY public.archivos.idarch;
          public          postgres    false    203            �            1259    16508    predicciones_histo    TABLE     e  CREATE TABLE public.predicciones_histo (
    idprh integer NOT NULL,
    lugar character varying(50) NOT NULL,
    lat character varying(20) NOT NULL,
    lon character varying(20) NOT NULL,
    ann smallint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    usuario character varying(25) NOT NULL,
    archivo character varying(250) NOT NULL
);
 &   DROP TABLE public.predicciones_histo;
       public         heap    postgres    false    6            �            1259    16506    predicciones_histo_idprh_seq    SEQUENCE     �   CREATE SEQUENCE public.predicciones_histo_idprh_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.predicciones_histo_idprh_seq;
       public          postgres    false    209    6            /           0    0    predicciones_histo_idprh_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.predicciones_histo_idprh_seq OWNED BY public.predicciones_histo.idprh;
          public          postgres    false    208            �
           2604    16415    algoritmos idalg    DEFAULT     t   ALTER TABLE ONLY public.algoritmos ALTER COLUMN idalg SET DEFAULT nextval('public.algoritmos_idalg_seq'::regclass);
 ?   ALTER TABLE public.algoritmos ALTER COLUMN idalg DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    16407    analisis_histo idana    DEFAULT     �   ALTER TABLE ONLY public.analisis_histo ALTER COLUMN idana SET DEFAULT nextval('public.analisis_realizados_idana_seq'::regclass);
 C   ALTER TABLE public.analisis_histo ALTER COLUMN idana DROP DEFAULT;
       public          postgres    false    205    204    205            �
           2604    16399    archivos idarch    DEFAULT     r   ALTER TABLE ONLY public.archivos ALTER COLUMN idarch SET DEFAULT nextval('public.archivos_idarch_seq'::regclass);
 >   ALTER TABLE public.archivos ALTER COLUMN idarch DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    16511    predicciones_histo idprh    DEFAULT     �   ALTER TABLE ONLY public.predicciones_histo ALTER COLUMN idprh SET DEFAULT nextval('public.predicciones_histo_idprh_seq'::regclass);
 G   ALTER TABLE public.predicciones_histo ALTER COLUMN idprh DROP DEFAULT;
       public          postgres    false    209    208    209            "          0    16412 
   algoritmos 
   TABLE DATA           6   COPY public.algoritmos (idalg, algoritmo) FROM stdin;
    public          postgres    false    207   �(                  0    16404    analisis_histo 
   TABLE DATA           �   COPY public.analisis_histo (idana, usuario, variables, var_objetivo, idalg, res_train, res_test, fecha, resultados, archivo) FROM stdin;
    public          postgres    false    205   �)                 0    16394    archivos 
   TABLE DATA           C   COPY public.archivos (idarch, usuario, archivo, fecha) FROM stdin;
    public          postgres    false    202   p9       $          0    16508    predicciones_histo 
   TABLE DATA           b   COPY public.predicciones_histo (idprh, lugar, lat, lon, ann, fecha, usuario, archivo) FROM stdin;
    public          postgres    false    209   �:       0           0    0    algoritmos_idalg_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.algoritmos_idalg_seq', 102, true);
          public          postgres    false    206            1           0    0    analisis_realizados_idana_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.analisis_realizados_idana_seq', 581, true);
          public          postgres    false    204            2           0    0    archivos_idarch_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.archivos_idarch_seq', 156, true);
          public          postgres    false    203            3           0    0    predicciones_histo_idprh_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.predicciones_histo_idprh_seq', 4, true);
          public          postgres    false    208            �
           2606    16417    algoritmos algoritmos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.algoritmos
    ADD CONSTRAINT algoritmos_pkey PRIMARY KEY (idalg);
 D   ALTER TABLE ONLY public.algoritmos DROP CONSTRAINT algoritmos_pkey;
       public            postgres    false    207            �
           2606    16409 '   analisis_histo analisis_realizados_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.analisis_histo
    ADD CONSTRAINT analisis_realizados_pkey PRIMARY KEY (idana);
 Q   ALTER TABLE ONLY public.analisis_histo DROP CONSTRAINT analisis_realizados_pkey;
       public            postgres    false    205            �
           2606    16401    archivos archivos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT archivos_pkey PRIMARY KEY (idarch);
 @   ALTER TABLE ONLY public.archivos DROP CONSTRAINT archivos_pkey;
       public            postgres    false    202            �
           2606    16513 *   predicciones_histo predicciones_histo_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.predicciones_histo
    ADD CONSTRAINT predicciones_histo_pkey PRIMARY KEY (idprh);
 T   ALTER TABLE ONLY public.predicciones_histo DROP CONSTRAINT predicciones_histo_pkey;
       public            postgres    false    209            �
           2606    16425    analisis_histo idalg    FK CONSTRAINT     �   ALTER TABLE ONLY public.analisis_histo
    ADD CONSTRAINT idalg FOREIGN KEY (idalg) REFERENCES public.algoritmos(idalg) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.analisis_histo DROP CONSTRAINT idalg;
       public          postgres    false    2715    205    207            "   �   x�]��
�@�ۧ�R�-c���D�3YeἍ{���dg�3�`��7�]��Y)p���dO��|�ȅ#�5�F{��u�7�C��(`N����)d�1H!	�E����v��ahf��*�8�5���Uۨa+��aT%�j�������D#�8����Ir;	�Q���ڜ�G� �������8t �q�a�          �  x�u�Mn����)x v��Z�ٳ�cV�"��J�BW�)|1��˪l���ٯ++3222�K7���^n>?~��}x���������Ϗ�??=�|}�����m~����_�n���������/��~{������O���o7����s��3��xĸ����8?����l!�^������T��=��=f]�ø��ʸ3�q=��1~�������p�mܗҸ��q���B�-�cТ���X4��{�T�U�\&��Y�ՠ��t�E�~[��)2D���&��T��2����cӰ#f݈ݕO�)�Ƴ�#p�6�u�.�g�Q�]�$����=���Snq'��(Uh�x�:IN	e~���q@rO�c?Ev���w��ܫH��E1)�������T֔�����U��"=���8�P�dw�J""S�2G�����t\.�G��eTts	r�6(�j7�������f��'y���ڃ�B�Q|�ah�I�`�GO����E@$b��y�QL�y�"�C���ֳ���rZ�{ԓ�9ٔ͐��,'��v����Vl�*p��h�)�SdR�v�C�q�p��Ӯ��8;)�ـ�ܬ4U�(�d��T�8"ig��q`�W�Cr@i���7�g��H��$�����%��^�3��IO���]Zq�p��o�]n��q��a�NDD�UNc�m��!i|.�w\���uj�z~�|��Ji�K� g+t&+���t���<��6�N��P\ܢ�ғ���L�A�qA9 4������z��n--p�8�ݷ����HYG�'�&�]�X�7�L��j+c#4���1�$M�V!7�ڊ��`W1Y/��U�T^��׸B>�������<�J��>I`l����X����pR.�	��N���[���X!�AbVt��ٗ��a\)���<�-6ί�2���3��BBDz�H����
�=����B�$=z�&)�~�d����jX��!������N0Y	a���@հW�H��?�.y8�p:�S��@�PX��D!��;>��&�s������c8	�j�܍�H�%��x�2�;9>�1(ń�dչ�m���5�BM2����8>��fN��"�(_e���]�Ni#2�f�������H,��6�ڂu)���ɍ$X㓒7n�:	 �`^�b�;�;���3	���(r�Y `���8�D׵�
�P��+����"��<ū2���"������M	)wf�=�:�ą��*����E��IʷtN&� �cy,�P*7�=m��_*�O�!�a�8C��CY��׳�h�>��d�ُ��8~K�m�j�+���$�F��
��1�I|��u)��z�`�C��[��bi����G��D�"�F��^�� k�cͭZ5^��Je��^q�����A�5Z��;�4����r�ұ>�94�h��1旋�M�X����,+�Kj�'�'���� ��]4D�o��q)�iD��,��HZ��T	�p�� wS���
�fm�X]v=`�,����-y1�_bj��!�8���V	H�+_/D��7�)jÌ���Ќe`\�Y�*2�:�S�8H>
0�4ep*�C��!-���
`A�W�>q�L�Q�|�ݺݔǸc��@�ХP�i.�/zr��FXACGY��Wch��/T�kQ���4)	�����=8.�mH0�VT�� a�X�懟�?�~�����������??�_������o��|~�����Ӹ������w�?>���ǆ�ͱ��p�������b��c<?�˟ww��n�Y�i;��Y	ja���;�j��಺�,� �4�zA�Ry�	9Q��8S��U�L�\��u��b��L#v�41Y(h���:��=�zLPݢ@����~����Kj�F��'L?O��i�5>��ˏ�׊�� b�[�*:��7/"�����9ݭ��aI�r�a�W-YԆ ��R�Z�l��խ"#��}e
sg��Q3݂��{{�لQ�k�eMo��/s��0j�L+�M��ٮ]�FxÕo^� �!����'r�e�H����{�(?�B)�NˈƬ4._��4�ZB�L��`2mŕz#���GѮ�$m�3(�p����.�-�U4&Pج�W�&[��D��c"�r��rQ��vl���SAQ�>K����H��hZ3��0�>��3 �R҃�(������n�uD��� N� �#F���"n���"٘�Jު�W���8n`i�㧧�>��6�cv��2ѕ��E����x
��aB��"�V��.Vl1�����exa�Ͳ�m-��-���lXOxH{ {���%'p��TL����7PDsA(�J�@�C�PR��E��PXE�q,�	��o���f�gv�}� ��`�����S�0��̄D3&�J&8b�
���u͓����X)r
��B]R�1Mz�t��6-��Y+�v؂4�Z3=PP�O38	Ĥ�+F����TP��<��@U
 ���,^�L��h������5-�:�8����0)$��B��	%~���Y&+�9��vQ�9�a���ygb5"��C�=j�D� ]�9r��l؝k�JF��TQ��1�LEaW6��z5�Y�i��tv}̰�F�C����L�5(Y�+-.�12bpQ�&Qb}l�ރ�Xf�������v��D9J.u��ڄ��Wl�2����y��H���kk�Q��d�¾��I�bl�uPL��\r�B�K(]�>���N�|'SM��T��}2�&F�t΍e�. ��OK,��h�*S�uf��#�q��+�[Z�u�>��_Kq��*C�f��q�<%���Ia&|ԋ�ׄ���;�k��F(�	I���m�c�w�{KT��rhC�|<��wf#d׆����P���1:U+�A� &���r�H��r�c �t��Ew�\IC�Hx��X/-ʺU!`N�&�rα�O�p%S
��n9jJ�X8�:>�W!x�O����a���`+�QJ�fjm�!L�2� u�d���<3ynP�0R�;�Ʃ/ڐ�S��0, EP���]"5�e�ƺ���P4t\K�7��2�M+���!�w���� �>���1;��1 D����y`���ޏ!a��ځ*���MV0�d3zW�r���5��ew���'����o�8ѷ�S����8�&�a��׆��ߣ,h�˭�-���Z=�u�\�K�c��S8~�����%�ɦZD`h��F�08�'�����lX�����9�G�G���/��hÊ��*k��o}���=	5k2� �:Wp���42�o�k��_C����k��Ε���ޅc8?S�}�bob��N䰜�u@fW�4JJ-����JS�";�����}6�3-����F���N��R6��x�M	��ж
>jgnd�u�)�r��L�j��B�>K\���.����r'l�GD�y�W�lf��V�ގ:F%�=��-!��D7A��PqV������[��ς��7L�E����,a"�\`&B�an��>��R�� �i�NZ�}��q<�!���������*�,zLA�d-ZH��Ҋ�ٙ��	1T�-=��*9�lJ�v,_Fkس+�0#������$�.��V��X���)���6t4<F�1l��]�0K�����1�G��n�P&9��?b�O�^�Yy�+4���s'458F����Ka`�c���=Z
m<�N;J�2@j2~���hЅ�}#g�z)%��,��/9��m(f������i�1c�4�x,o��
;���2�Q�w�\�� ��UI*��1���a��Zo�P�6�k+T�fo)����!g���t򌆨��������>scku��_ξ�^^D��}�36����"MiR�Y���d��~[CBB n����6�El��8�5C�r� d8nǒ������?�~������q���e���������N��	����o������Ӫ�         1  x���Kn�@D�p
.0��͇Y&Yeo��DB��|��"K�ll�X� �Tկ�ȇc�/;�4L�s3�Ccv�7�C>��{C�d��WA@d�6r��8��L�KD�	��-vC��"b�^���7Ō�G�����ۼF�b�c-N�a��=}�`� HTt�vz�IB����l!��R��Db�#+Q\Z]�D0��VŲ���;Q��2v�������-H��Rr�d^-A�*�J��p���܎]r�ݤ�*���%�]��b��t��:���8���I��c7?_書^AU�b��|�eY��m�A      $   �   x���1�0�99pd;v�dC�te��T!�"��ñr1�SG��?��������`�mv�Ac��R�D��TB"R*IȤ8F��`"@�Q�*5ZH�9�k��2�C��w��Ͱ6�=��H8//l`�h5jP����N�{�-�E�     