--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    likes integer NOT NULL,
    author_id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.articles OWNER TO root;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO root;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: articles_tags; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE articles_tags (
    id integer NOT NULL,
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.articles_tags OWNER TO root;

--
-- Name: articles_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE articles_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_tags_id_seq OWNER TO root;

--
-- Name: articles_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE articles_tags_id_seq OWNED BY articles_tags.id;


--
-- Name: articles_user; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE articles_user (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    article_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.articles_user OWNER TO root;

--
-- Name: articles_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE articles_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_user_id_seq OWNER TO root;

--
-- Name: articles_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE articles_user_id_seq OWNED BY articles_user.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    text text NOT NULL,
    date timestamp with time zone NOT NULL,
    article_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.comments OWNER TO root;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO root;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: customuser_customuser; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE customuser_customuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    avatar character varying(100),
    firstname character varying(40),
    lastname character varying(40),
    middlename character varying(40),
    date_of_birth date,
    register_date date NOT NULL,
    gender boolean,
    is_active boolean NOT NULL,
    is_admin boolean NOT NULL
);


ALTER TABLE public.customuser_customuser OWNER TO root;

--
-- Name: customuser_customuser_groups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE customuser_customuser_groups (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.customuser_customuser_groups OWNER TO root;

--
-- Name: customuser_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE customuser_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customuser_customuser_groups_id_seq OWNER TO root;

--
-- Name: customuser_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE customuser_customuser_groups_id_seq OWNED BY customuser_customuser_groups.id;


--
-- Name: customuser_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE customuser_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customuser_customuser_id_seq OWNER TO root;

--
-- Name: customuser_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE customuser_customuser_id_seq OWNED BY customuser_customuser.id;


--
-- Name: customuser_customuser_user_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE customuser_customuser_user_permissions (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.customuser_customuser_user_permissions OWNER TO root;

--
-- Name: customuser_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE customuser_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customuser_customuser_user_permissions_id_seq OWNER TO root;

--
-- Name: customuser_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE customuser_customuser_user_permissions_id_seq OWNED BY customuser_customuser_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO root;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO root;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO root;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO root;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO root;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO root;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    tag_name character varying(200) NOT NULL
);


ALTER TABLE public.tags OWNER TO root;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO root;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles_tags ALTER COLUMN id SET DEFAULT nextval('articles_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles_user ALTER COLUMN id SET DEFAULT nextval('articles_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY customuser_customuser ALTER COLUMN id SET DEFAULT nextval('customuser_customuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY customuser_customuser_groups ALTER COLUMN id SET DEFAULT nextval('customuser_customuser_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY customuser_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('customuser_customuser_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY articles (id, title, text, likes, author_id, date_created, date_updated) FROM stdin;
1	C++17	<h1>C++17</h1>\r\n\r\n<ul>\r\n\t<li><a href="https://habrahabr.ru/hub/compilers/" onclick="if (typeof ga === 'function') { ga('send', 'event', 'hub', 'post page', 'Компиляторы'); }" title="Вы подписаны на этот хаб">Компиляторы</a>,</li>\r\n\t<li><a href="https://habrahabr.ru/hub/cpp/" onclick="if (typeof ga === 'function') { ga('send', 'event', 'hub', 'post page', 'C++'); }" title="Вы подписаны на этот хаб">C++</a>,</li>\r\n\t<li><a href="https://habrahabr.ru/company/pvs-studio/" onclick="if (typeof ga === 'function') { ga('send', 'event', 'hub', 'post page', 'Блог компании PVS-Studio'); }" title="Вы не подписаны на этот хаб">Блог компании PVS-Studio</a></li>\r\n</ul>\r\n\r\n<p><img alt="Рисунок 2" src="https://habrastorage.org/getpro/habr/post_images/150/aca/98e/150aca98ef9de93d2b53062ab916e468.png" /></p>\r\n\r\n<p><br />\r\nЯзык C++ постоянно развивается, и нам как разработчикам статического анализатора важно следить за всеми изменениями, чтобы поддерживать все новые возможности языка. В этой обзорной статье я хотел бы поделиться с читателем наиболее интересными нововведениями, появившимися в C++17, а также продемонстрировать их на примерах.<br />\r\n<a name="habracut"></a><br />\r\nСейчас поддержка нового стандарта активно добавляется разработчиками компиляторов. Посмотреть, что поддерживается на текущий момент, можно по ссылкам:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li><a href="https://gcc.gnu.org/projects/cxx-status.html">GCC</a></li>\r\n\t<li><a href="https://clang.llvm.org/cxx_status.html">Clang</a></li>\r\n\t<li><a href="https://docs.microsoft.com/en-us/cpp/visual-cpp-language-conformance">Visual Studio</a></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Свертка параметров шаблона (Fold expressions)</h2>\r\n\r\n<p><br />\r\nДля начала несколько слов о том, что вообще такое свертка списка (также известна как fold, reduce или accumulate).<br />\r\n<br />\r\nСвертка &ndash; это функция, которая применяет заданную комбинирующую функцию к последовательным парам элементов в списке и возвращает результат. Простейшим примером может служить суммирование элементов списка при помощи свертки:<br />\r\n<br />\r\nПример из C++:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>std::vector&lt;int&gt; lst = { 1, 3, 5, 7 };\r\nint res = std::accumulate(lst.begin(), lst.end(), 0, \r\n  [](int a, int b)  { return a + b; });\r\nstd::cout &lt;&lt; res &lt;&lt; &#39;\\n&#39;; // 16</code></pre>\r\n\r\n<p><br />\r\nЕсли комбинирующая функция применяется к первому элементу списка и результату рекурсивной обработки хвоста списка, то свертка называется&nbsp;<strong>правоассоциативной.&nbsp;</strong>В нашем примере получим:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>1 + (3 + (5 + (7 + 0)))</code></pre>\r\n\r\n<p><br />\r\nЕсли комбинирующая функция применяется к результату рекурсивной обработки начала списка&nbsp;<em>(весь список без последнего элемента)</em>&nbsp;и последнему элементу, то свертка называется&nbsp;<strong>левоассоциативной</strong>. В нашем примере получим:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>(((0 + 1) + 3) + 5) + 7</code></pre>\r\n\r\n<p><br />\r\nТаким образом, тип свертки определяет порядок вычислений.<br />\r\n<br />\r\nВ C++17 появилась поддержка свертки для списка параметров шаблонов. Она имеет следующий синтаксис:</p>\r\n\r\n<table>\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>(pack op ...)</td>\r\n\t\t\t<td>Унарная правоассоциативная свертка</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>(&hellip; op pack)</td>\r\n\t\t\t<td>Унарная левоассоциативная свертка</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>(pack op&hellip; op init)</td>\r\n\t\t\t<td>Бинарная правоассоциативная свертка</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>(init op&hellip; op pack)</td>\r\n\t\t\t<td>Бинарная левоассоциативная свертка</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n\r\n<p><br />\r\n<em>op</em>&nbsp;&ndash; один из следующих бинарных операторов:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>+ - * / % ^ &amp; | ~ = &lt; &gt; &lt;&lt; &gt;&gt; += -= *= /= %=\r\n^= &amp;= |= &lt;&lt;= &gt;&gt;= == != &lt;= &gt;= &amp;&amp; || , .* -&gt;*</code></pre>\r\n\r\n<p><br />\r\n<em>pack</em>&nbsp;&ndash; выражение, содержащее нераскрытую группу параметров (parameter pack)<br />\r\n<br />\r\n<em>init</em>&nbsp;&ndash; начальное значение<br />\r\n<br />\r\nВот, например, шаблонная функция, принимающая переменное число параметров и вычисляющая их сумму:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++17\r\n#include &lt;iostream&gt;\r\n\r\ntemplate&lt;typename... Args&gt;\r\nauto Sum(Args... args)\r\n{\r\n  return (args + ...);\r\n}\r\n\r\nint main()\r\n{\r\n  std::cout &lt;&lt; Sum(1, 2, 3, 4, 5) &lt;&lt; &#39;\\n&#39;; // 15\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nПримечание: В данном примере функцию&nbsp;<em>Sum&nbsp;</em>можно было бы объявить как&nbsp;<em>constexpr</em>.<br />\r\n<br />\r\nЕсли мы хотим указать начальное значение, то используем бинарную свертку:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++17\r\n#include &lt;iostream&gt;\r\n\r\ntemplate&lt;typename... Args&gt;\r\nauto Func(Args... args)\r\n{\r\n  return (args + ... + 100);\r\n}\r\n\r\nint main()\r\n{\r\n  std::cout &lt;&lt; Func(1, 2, 3, 4, 5) &lt;&lt; &#39;\\n&#39;; //115\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nДо C++17 чтобы реализовать подобную функцию, пришлось бы явно указывать правила для рекурсии:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++14\r\n#include &lt;iostream&gt;\r\n\r\nauto Sum()\r\n{\r\n  return 0;\r\n}\r\n\r\ntemplate&lt;typename Arg, typename... Args&gt;\r\nauto Sum(Arg first, Args... rest)\r\n{\r\n  return first + Sum(rest...);\r\n}\r\n\r\nint main()\r\n{\r\n  std::cout &lt;&lt; Sum(1, 2, 3, 4); // 10\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nОтдельно хочется отметить оператор &#39;,&#39; (запятая), который раскроет&nbsp;<em>pack</em>&nbsp;в последовательность действий, перечисленных через запятую. Пример:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++17\r\n#include &lt;iostream&gt;\r\n\r\ntemplate&lt;typename T, typename... Args&gt;\r\nvoid PushToVector(std::vector&lt;T&gt;&amp; v, Args&amp;&amp;... args)\r\n{\r\n  (v.push_back(std::forward&lt;Args&gt;(args)), ...);\r\n\r\n  //Раскрывается в последовательность выражений через запятую вида:\r\n  //v.push_back(std::forward&lt;Args_1&gt;(arg1)),\r\n  //v.push_back(std::forward&lt;Args_2&gt;(arg2)),\r\n  //....\r\n}\r\n\r\nint main()\r\n{\r\n  std::vector&lt;int&gt; vct;\r\n  PushToVector(vct, 1, 4, 5, 8);\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nТаким образом, свертка сильно упрощает работу с variadic templates.<br />\r\n&nbsp;</p>\r\n\r\n<h2>template&lt;auto&gt;</h2>\r\n\r\n<p><br />\r\nТеперь в шаблонах можно писать auto для non-type template параметров. Например:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++17\r\ntemplate&lt;auto n&gt;\r\nvoid Func() { /* .... */ }\r\n\r\nint main()\r\n{\r\n  Func&lt;42&gt;(); // выведет тип int\r\n  Func&lt;&#39;c&#39;&gt;(); // выведет тип char\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nРанее единственным способом передать non-type template параметр с неизвестным типом была передача двух параметров &ndash; типа и значения. Другими словами, ранее этот пример выглядел бы следующим образом:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++14\r\ntemplate&lt;typename Type, Type n&gt;\r\nvoid Func() { /* .... */ }\r\n\r\nint main()\r\n{\r\n  Func&lt;int, 42&gt;();\r\n  Func&lt;char, &#39;c&#39;&gt;();\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Вывод типов шаблонных параметров для классов</h2>\r\n\r\n<p><br />\r\nДо C++17 вывод типов шаблонных параметров работал только для функций, из-за чего при конструировании шаблонного класса всегда было нужно в явном виде указывать шаблонные параметры:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++14\r\nauto p = std::pair&lt;int, char&gt;(10, &#39;c&#39;);</code></pre>\r\n\r\n<p><br />\r\nлибо использовать специализированные функции вроде&nbsp;<em>std::make_pair</em>, для неявного вывода типов:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++14\r\nauto p = std::make_pair(10, &#39;c&#39;);</code></pre>\r\n\r\n<p><br />\r\nСвязано это было с тем, что достаточно сложно осуществить такой вывод при наличии нескольких конструкторов в классе. В новом стандарте эта проблема была решена:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>#include &lt;tuple&gt;\r\n#include &lt;array&gt;\r\n\r\ntemplate&lt;typename T, typename U&gt;\r\nstruct S\r\n{\r\n  T m_first;\r\n  U m_second;\r\n  S(T first, U second) : m_first(first), m_second(second) {}\r\n};\r\n\r\nint main()\r\n{\r\n  // C++14\r\n  std::pair&lt;char, int&gt; p1 = { &#39;c&#39;, 42 };\r\n  std::tuple&lt;char, int, double&gt; t1 = { &#39;c&#39;, 42, 3.14 };\r\n  S&lt;int, char&gt; s1 = { 10, &#39;c&#39; };\r\n\r\n  // C++17\r\n  std::pair p2 = { &#39;c&#39;, 42 };\r\n  std::tuple t2 = { &#39;c&#39;, 42, 3.14 };\r\n  S s2 = { 10, &#39;c&#39; };\r\n\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nСтандартом было определено множество&nbsp;<a href="http://en.cppreference.com/w/cpp/language/class_template_argument_deduction">правил вывода типов</a>&nbsp;(<em>deduction guides</em>). Также предоставляется возможность самим писать эти правила, например:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++17\r\n#include &lt;iostream&gt;\r\n\r\ntemplate&lt;typename T, typename U&gt;\r\nstruct S\r\n{\r\n  T m_first;\r\n  U m_second;\r\n};\r\n\r\n// Мой deduction guide\r\ntemplate&lt;typename T, typename U&gt;\r\nS(const T &amp;first, const U &amp;second) -&gt; S&lt;T, U&gt;;\r\n\r\nint main()\r\n{\r\n  S s = { 42, &quot;hello&quot; };\r\n  std::cout &lt;&lt; s.m_first &lt;&lt; s.m_second &lt;&lt; &#39;\\n&#39;;\r\n\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nБольшинство стандартных контейнеров работают без необходимости вручную указывать&nbsp;<em>deduction guide</em>.<br />\r\n<br />\r\nПримечание: компилятор может вывести&nbsp;<em>deduction guide</em>&nbsp;автоматически из конструктора, но в данном примере у структуры&nbsp;<em>S&nbsp;</em>нет ни одного конструктора, поэтому и определяем&nbsp;<em>deduction guide вручную.</em><br />\r\n<br />\r\nТаким образом, вывод типов для классов позволяет значительно сократить код и забыть о таких функциях как&nbsp;<em>std::make_pair</em>,&nbsp;<em>std::make_tuple,</em>&nbsp;и использовать вместо них конструктор.<br />\r\n&nbsp;</p>\r\n\r\n<h2>Constexpr if</h2>\r\n\r\n<p><br />\r\nВ C++17 появилась возможность выполнять условные конструкции на этапе компиляции. Это очень мощный инструмент, особенно полезный в метапрограммировании. Приведу простой пример:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++17\r\n#include &lt;iostream&gt;\r\n#include &lt;type_traits&gt;\r\n\r\ntemplate &lt;typename T&gt;\r\nauto GetValue(T t)\r\n{\r\n  if constexpr (std::is_pointer&lt;T&gt;::value)\r\n  {\r\n    return *t;\r\n  }\r\n  else\r\n  {\r\n    return t;\r\n  }\r\n}\r\n\r\nint main()\r\n{\r\n  int v = 10;\r\n  std::cout &lt;&lt; GetValue(v) &lt;&lt; &#39;\\n&#39;; // 10\r\n  std::cout &lt;&lt; GetValue(&amp;v) &lt;&lt; &#39;\\n&#39;; // 10\r\n\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nДо C++17 нам пришлось бы использовать&nbsp;<a href="https://en.wikipedia.org/wiki/Substitution_failure_is_not_an_error">SFINAE</a>&nbsp;и&nbsp;<em>enable_if</em>:<br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<code>// C++14\r\ntemplate&lt;typename T&gt;\r\ntypename std::enable_if&lt;std::is_pointer&lt;T&gt;::value,\r\n  std::remove_pointer_t&lt;T&gt;&gt;::type\r\nGetValue(T t)\r\n{\r\n  return *t;\r\n}\r\n\r\ntemplate&lt;typename T&gt;\r\ntypename std::enable_if&lt;!std::is_pointer&lt;T&gt;::value, T&gt;::type\r\nGetValue(T t)\r\n{\r\n  return t;\r\n}\r\nint main()\r\n{\r\n  int v = 10;\r\n  std::cout &lt;&lt; GetValue(v) &lt;&lt; &#39;\\n&#39;; // 10\r\n  std::cout &lt;&lt; GetValue(&amp;v) &lt;&lt; &#39;\\n&#39;; // 10\r\n\r\n  return 0;\r\n}</code></pre>\r\n\r\n<p><br />\r\nНе трудно заметить, что код с&nbsp;<em>constexpr if</em>&nbsp;на порядок читабельнее.<br />\r\n&nbsp;</p>\r\n\r\n<h2>Constexpr лямбды</h2>\r\n\r\n<p><br />\r\nДо C++17 лямбды не были совместимы с&nbsp;<em>constexpr</em>. Теперь лямбды можно писать внутри&nbsp;<em>constexpr</em>выражений, а также можно объявлять сами лямбды как&nbsp;<em>constexpr</em>.<br />\r\n<br />\r\nПримечание: даже если спецификатор&nbsp;<em>constexpr</em>&nbsp;не указан, лямбда все равно будет&nbsp;<em>constexpr</em>, если это возможно.</p>	0	1	2017-10-14 12:23:04.057367+06	2017-10-14 12:23:04.057418+06
2	AMA. Avito. Backend	<p>Привет! Как и обещали, сегодня мы готовы отвечать на вопросы про бэкенд в Avito, разработку серверной части в целом и про высокие нагрузки в частности. Как работается с сайтом, на который ежемесячно заходит почти четверть населения России? Спросите у нас! Отвечать будем с 12 до 19 часов по московскому времени. Под катом я представляю шесть моих коллег, которые сегодня будут с вами на связи и напоминаю о возможных темах диалога.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>AMA!<br />\r\n<strong>UPD, 19:03 мск:&nbsp;</strong>Спасибо всем за вопросы!<br />\r\nОфициально мы завершаем АМА и прощаемся, но по возможности будем отвечать на комментарии.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src="https://habrastorage.org/webt/59/dd/db/59dddbcd7844d060947142.jpeg" /></p>\r\n\r\n<p><a name="habracut"></a></p>\r\n\r\n<p><img alt="image" src="https://habrastorage.org/webt/59/e0/86/59e086ad81258741165304.jpeg" style="float:left" /><strong>Виталий Леонов,&nbsp;<a href="https://habrahabr.ru/users/vleonov/">vleonov</a>&nbsp;</strong><br />\r\nРуководитель разработки серверной части.<br />\r\nВ Авито 5 лет, начинал бекенд-разработчиком, теперь отвечает за всю серверную разработку.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="image" src="https://habrastorage.org/webt/59/e0/86/59e086ad83619954674029.jpeg" style="float:left" /><strong>Виктор Диктор,&nbsp;<a href="https://habrahabr.ru/users/rpsl/">Rpsl</a>&nbsp;</strong><br />\r\nТехлид в юните монетизации. Более 10 лет опыта в разработке сайтов. В Авито отвечает за кроссплатформенную команду разработки в одном из юнитов монетизации.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="image" src="https://habrastorage.org/webt/59/e0/86/59e086adc636c286250701.jpeg" style="float:left" /><strong>Николай Балакирев,&nbsp;<a href="https://habrahabr.ru/users/madfaill/">madfaill</a>&nbsp;</strong><br />\r\nВедущий разработчик серверной части, техлид юнита Avito.Pro. Отвечает за сервисы Avito для профессионалов:&nbsp;<a href="https://actiagent.ru/landing.html">ActiAgent</a>,&nbsp;<a href="https://actidealer.ru/landing.html">ActiDealer</a>, Avito PRO. Ему можно адресовать также вопросы по сервису&nbsp;<a href="https://autoteka.ru/">Autoteka</a>.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="image" src="https://habrastorage.org/webt/59/e0/88/59e0881371a8c123609196.png" style="float:left" /><strong>Игорь Сомов,&nbsp;<a href="https://habrahabr.ru/users/cubist/">Cubist</a>&nbsp;</strong><br />\r\nВедущий разработчик серверной части. В Avito 2 года. Работает в юните модерации, занимается несколькими внутренними проектами.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="image" src="https://habrastorage.org/webt/59/e0/86/59e086ade4075416828385.jpeg" style="float:left" /><strong>Андрей Смирнов,&nbsp;<a href="https://habrahabr.ru/users/martovskiy/">martovskiy</a>&nbsp;</strong><br />\r\nВедущий разработчик серверной части. До Avito работал в Playfon и Sotmarket &mdash; везде были высокие нагрузки и большие требования к надежности систем. Занимался статистикой, поиском и деплоем. В Авито работает над поисковыми системами, чтобы они работали быстро, точно и безотказно.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="image" src="https://habrastorage.org/webt/59/e0/a7/59e0a7e6608d5088020021.jpeg" style="float:left" /><strong>Сергей Орлов,&nbsp;<a href="https://habrahabr.ru/users/marrrvin/">marrrvin</a>&nbsp;</strong><br />\r\nАрхитектор серверной части. Лидер юнита Архитектура. В Avito более двух лет. Занимается развитием архитектуры backend, сбором и внедрением лучших практик. Строит внутренний PAAS. Может ответить на вопросы, связанные с облачной инфраструктурой в целом и Kubernetes в частности, Continuous Integration, Delivery и Deployment, использованием микросервисного подхода в компании.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Возможные темы:</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>устройство наших внутренних проектов;</li>\r\n\t<li>истории успехов и провалов;</li>\r\n\t<li>высокие нагрузки и вот это всё;</li>\r\n\t<li>что мы пилим на PHP, а для чего используем Go и Python;</li>\r\n\t<li>как работает наш поиск на Sphinx;</li>\r\n\t<li>инфраструктура, Kubernetes, Continuous Integration, Delivery и Deployment;</li>\r\n\t<li>и так далее.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Немного цифр и ссылок</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ждём ваших вопросов, историй и уточнений. Если хотите получить гарантированный ответ &mdash; пишите запрос в комментарии первого уровня. Поехали!</p>	0	1	2017-10-14 12:24:04.902966+06	2017-10-14 12:24:04.903032+06
3	CRI-O — альтернатива Docker для запуска контейнеров в Kubernetes	<p>Многие DevOps-инженеры и системные администраторы, особенно успевшие поработать с Kubernetes, уже слышали про проект&nbsp;<a href="http://cri-o.io/">CRI-O</a>, озаглавленный как &laquo;легковесная исполняемая среда для контейнеров в Kubernetes&raquo;. Однако зачастую представления о его назначении, возможностях и статусе весьма размыты &mdash; из-за молодости проекта, отсутствия опыта практического применения и растущего числа изменений в области стандартов для контейнеров. Эта статья &mdash; ликбез о CRI-O, рассказывающая о появлении проекта, его особенностях и актуальном статусе.<a name="habracut"></a><br />\r\n&nbsp;</p>\r\n\r\n<h2>История появления</h2>\r\n\r\n<p><br />\r\nСледуя за растущей популярностью применения Linux-контейнеров, в середине 2015 года некоммерческая организация The Linux Foundation при содействии CoreOS, Docker, Red Hat и ряда других компаний&nbsp;<a href="https://www.nixp.ru/news/13486.html">представила</a>&nbsp;проект Open Container Project, который ныне известен как&nbsp;<a href="https://www.opencontainers.org/"><strong>Open Container Initiative (OCI)</strong></a>. Его цель &mdash; &laquo;создание открытых индустриальных стандартов для форматов и исполняемой среды контейнеров&raquo;.<br />\r\n<br />\r\n<img src="https://habrastorage.org/webt/59/e0/6a/59e06aff86db6866787732.png" /><br />\r\n<br />\r\nПредполагалось, что проект объединит базу конкурирующих продуктов для контейнеров, таких как runc от Docker и appc от CoreOS, в единые стандарты. Актуальным же итогом деятельности OCI стал&nbsp;<a href="https://www.nixp.ru/news/14118.html">выпуск</a>минувшим летом версии 1.0 для двух стандартов:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>для исполняемой среды контейнеров (<strong>Runtime Specification</strong>,&nbsp;<a href="https://github.com/opencontainers/runtime-spec/">runtime-spec</a>) &mdash; определяет, как запускается &laquo;комплект файловой системы&raquo; (filesystem bundle) с содержимым контейнера (эталонная реализация &mdash; тот самый runc);</li>\r\n\t<li>для формата образов контейнеров (<strong>Image Specification</strong>,&nbsp;<a href="https://github.com/opencontainers/image-spec">image-spec</a>) &mdash; определяет формат, из которого образ контейнера будет распакован в filesystem bundle (для дальнейшего запуска).</li>\r\n</ul>\r\n\r\n<p><br />\r\nВ то же самое время и независимо от Open Container Initiative, но &laquo;с акцентом на продвижение стандартов для контейнеров через OCI&raquo;, компания Red Hat занялась созданием&nbsp;<strong>OCID (Open Container Initiative Daemon)</strong>, поместив его в&nbsp;<a href="https://github.com/kubernetes-incubator/cri-o">инкубатор</a>&nbsp;проекта Kubernetes и&nbsp;<a href="https://www.redhat.com/en/blog/running-production-applications-containers-introducing-ocid">анонсировав</a>&nbsp;в сентябре 2016 года.<br />\r\n<br />\r\nВ рамках OCID инженеры Red Hat собирались развивать инновации в области контейнеров: исполняемой среды, распространения образов, хранилища, их подписи и т.п. При этом проект позиционировался как &laquo;не конкурирующий с Docker&raquo;, потому что &laquo;в действительности он использует ту же исполняемую среду OCI runc, что применяется в Docker Engine, тот же формат образов и позволяет использовать&nbsp;<code>docker build</code>&nbsp;и относящиеся к нему инструменты&raquo;.<br />\r\n<br />\r\nУже тогда OCID назывался &laquo;реализацией стандартного интерфейса для исполняемой среды для контейнеров в Kubernetes&raquo;, в котором следуют философии UNIX, когда одна утилита выполняет одну задачу. Поэтому функциональность OCID была сразу разбита по следующим компонентам:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>OCI Container Runtime Environment (runc);</li>\r\n\t<li><a href="https://github.com/opencontainers/runtime-tools">OCI Runtime Tools</a>&nbsp;<em>(развиваемый в OCI набор утилит для работы с runtime-spec)</em>;</li>\r\n\t<li><a href="https://github.com/containers/image">containers/image</a>&nbsp;<em>(набор библиотек на языке Go для работы с образами контейнеров и реестрами &mdash; эти возможности также доступны через консольную утилиту&nbsp;<a href="https://github.com/projectatomic/skopeo">skopeo</a>, созданную в Red Hat для Project Atomic)</em>;</li>\r\n\t<li><a href="https://github.com/containers/storage">containers/storage</a>&nbsp;<em>(библиотека на Go, предоставляющая методы для хранения слоёв файловой системы, образов контейнеров и самих контейнеров; включает в себя обёртку с консольным интерфейсом)</em>;</li>\r\n\t<li><a href="https://github.com/containernetworking/cni">CNI (Container Network Interface)</a>&nbsp;<em>(спецификация и библиотеки для управления сетевыми интерфейсами в контейнерах &mdash; подробнее о CNI мы писали в&nbsp;<a href="https://habrahabr.ru/company/flant/blog/329830/">этой статье</a>)</em>.</li>\r\n</ul>\r\n\r\n<p><br />\r\nОднако&nbsp;<em>название</em>&nbsp;&laquo;OCID&raquo;, напрямую ссылающееся на инициативу OCI, не получило одобрения в самой Open Container Initiative, поскольку к списку официальных проектов OCID не относился. И уже вскоре после первого анонса, по&nbsp;<a href="https://thenewstack.io/oci-distances-ocid-container-project-now-named-cri-o/">требованию OCI</a>, проект получил новое название &mdash;&nbsp;<a href="http://cri-o.io/"><strong>CRI-O</strong></a>&nbsp;(&laquo;CRI&raquo; расшифровывается как &laquo;Container Runtime Interface&raquo;).<br />\r\n<br />\r\nПо существу можно сделать вывод, что OCI стала необходимой предтечей для CRI-O, а в Red Hat воспользовались трендом стандартизации, способствуя ему с одной стороны и преследуя свои цели&nbsp;<em>(низкоуровневый стек для Project Atomic и OpenShift)</em>&nbsp;&mdash; с другой. Сообщество Linux и Open Source от этого скорее только выиграло, получив конкуренцию и разнообразие среди свободных продуктов, да и в OCI подчеркнули, что их недовольство было связано исключительно с названием проекта, но не самим его назначением:<br />\r\n&nbsp;</p>\r\n\r\n<p>&laquo;Open Container Initiative (OCI) сосредоточена на создании формальной спецификации для исполняемой среды и формата образов контейнеров, поскольку стандартизация в этих областях будет способствовать и другим инновациям. Любые другие проекты на данный момент выходят за рамки OCI, однако мы поощряем своих участников, продолжающих работу над спецификацией для исполняемой среды и формата образов, поскольку это полезно для всей индустрии. Инновации быстро происходят на уровне реализации, и мы намерены интегрировать все уместные улучшения в спецификации. Наша цель &mdash; поддерживать эффективный рост и здоровье технологии контейнеров и всего сообщества Open Source&raquo;.</p>\r\n\r\n<p><br />\r\nПо сей день Red Hat продолжает продвигать CRI-O в мире ИТ-специалистов, примером чему может служить недавняя&nbsp;<em>(июнь 2017 г.)</em>&nbsp;публикация &laquo;<a href="https://www.projectatomic.io/blog/2017/06/6-reasons-why-cri-o-is-the-best-runtime-for-kubernetes/">6 причин, почему CRI-O &mdash; лучшая исполняемая среда для Kubernetes</a>&raquo; в блоге Project Atomic. В качестве таких причин авторы называют:<br />\r\n&nbsp;</p>\r\n\r\n<ol>\r\n\t<li>Открытая схема управления проектом и его развитие в рамках сообщества &laquo;родительского&raquo; Kubernetes.</li>\r\n\t<li>&laquo;По-настоящему открытый проект&raquo;, что подтверждается приятным&nbsp;<a href="https://github.com/kubernetes-incubator/cri-o/issues/332#issuecomment-275256700">комментарием</a>&nbsp;от инженера из Intel:<br />\r\n\t<img src="https://habrastorage.org/webt/59/e0/58/59e058bee8122193631973.png" /><br />\r\n\t&hellip; а также активностью&nbsp;<a href="https://github.com/kubernetes-incubator/cri-o/graphs/contributors">контрибьюторов</a>, переносом некоторых улучшений в кодовую базу самого Kubernetes.</li>\r\n\t<li>Минимальная кодовая база (доступная для простого аудита и достаточно надёжная), остальные компоненты к которой подключаются от других проектов.</li>\r\n\t<li>Стабильность, достигаемая благодаря полной ориентированности на Kubernetes, использованию upstream-тестов из K8s (node-e2e и e2e) перед принятием патчей (если релиз CRI-O ломает что-то в K8s, он блокируется), а также своих интеграционных тестов.</li>\r\n\t<li>Безопасность, т.к. в нём доступны все необходимые для Kubernetes функции вроде SELinux, Apparmor, seccomp, capabilities.</li>\r\n\t<li>Использование стандартизированных компонентов, т.к. проект следует спецификациям OCI.</li>\r\n</ol>\r\n\r\n<p><br />\r\nДругой пример технологического евангелизма в этом направлении &mdash; совсем свежий&nbsp;<em>(сентябрь 2017 г.)</em>доклад &laquo;<a href="https://medium.com/cri-o/understanding-container-standards-1e1448cbb92c">Понимая стандарты для контейнеров</a>&raquo; (<a href="https://www.youtube.com/watch?v=rlj0UZlvGp0">видео</a>,&nbsp;<a href="https://docs.google.com/presentation/d/1OpsvPvA82HJjHN3Vm2oVrqca1FCfn0PAfxGZ2w_ZZgc/edit#slide=id.g26188a52c4_2_10">слайды</a>) в исполнении Scott McCarty из Red Hat:<br />\r\n<br />\r\n<img src="https://habrastorage.org/webt/59/e0/6a/59e06a21dc39f170228761.png" /><br />\r\n<br />\r\nНо вернёмся к технологической составляющей CRI-O. Как же устроен этот проект?<br />\r\n&nbsp;</p>\r\n\r\n<h2>Архитектура и особенности CRI-O</h2>\r\n\r\n<p><br />\r\nНа сегодня, благодаря усилиям Red Hat, Intel, SUSE, Hyper и IBM&nbsp;<em>(все они числятся среди основных компаний-разработчиков CRI-O)</em>, мы получили альтернативу Docker для Kubernetes, позволяющую запускать поды с использованием&nbsp;<strong>любой исполняемой среды</strong>&nbsp;для контейнеров, совместимой со спецификацией OCI. Официально при этом поддерживаются всем известная runc, а также&nbsp;<a href="https://clearlinux.org/documentation/clear-containers/clear-containers.html">Clear Containers</a>&nbsp;от Intel&nbsp;<em>(являются частью более глобального проекта&nbsp;<a href="https://clearlinux.org/">Clear Linux</a>; в прошлом месяце выпустили их&nbsp;<a href="https://www.nixp.ru/news/14173.html">версию 3.0</a>, переписанную на Go)</em>.<br />\r\n<br />\r\n<strong>Компоненты CRI-O</strong>&nbsp;практически не изменились со времён анонса OCID: помимо исполняемой среды (совместимой с OCI) это прежние OCI Runtime Tools, containers/storage, containers/image, CNI, а также новая небольшая утилита&nbsp;<a href="https://github.com/kubernetes-incubator/cri-o/tree/master/conmon">conmon</a>, предназначенная для мониторинга контейнеров (включая обнаружение ошибок нехватки памяти &mdash; OOM) и обработки журналирования из процесса контейнера.<br />\r\n<br />\r\nОбщая же&nbsp;<strong>архитектура CRI-O</strong>&nbsp;и его место в Kubernetes представляется следующим образом:<br />\r\n<br />\r\n<img src="https://habrastorage.org/webt/59/e0/56/59e0560fe8602563042772.png" /><br />\r\n<br />\r\n<strong>Принцип функционирования</strong>&nbsp;Kubernetes в связке с CRI-O сводится к следующей схеме:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Kubernetes обращается к&nbsp;<em>kubelet</em>&nbsp;для запуска пода, а&nbsp;<em>kubelet</em>&nbsp;перенаправляет этот запрос к демону CRI-O через интерфейс&nbsp;<a href="https://github.com/kubernetes/kubernetes/blob/242a97307b34076d5d8f5bbeb154fa4d97c9ef1d/docs/devel/container-runtime-interface.md">Kubernetes CRI</a>.</li>\r\n\t<li>CRI-O с помощью библиотеки containers/image забирает образ из реестра.</li>\r\n\t<li>CRI-O с помощью библиотеки containers/storage распаковывает загруженный образ в корневую файловую систему контейнера (хранимую в COW).</li>\r\n\t<li>Создав rootfs для контейнера, CRI-O с помощью утилиты&nbsp;<em>generate</em>&nbsp;из OCI Runtime Tools готовит JSON-файл, соответствующий спецификации OCI runtime и содержащий описание, как запустить контейнер.</li>\r\n\t<li>CRI-O запускает исполняемую среду (например, runc) с использованием созданной спецификации.</li>\r\n\t<li>Контейнер попадает в поле зрения мониторинга, осуществляемого с помощью утилиты conmon (отдельный процесс в системе), которая также обслуживает логирование для контейнера и записывает код завершения процесса контейнера.</li>\r\n\t<li>Сеть для пода настраивается с помощью любого из плагинов CNI.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Статус</h2>\r\n\r\n<p><br />\r\nПоследний публичный релиз CRI-O &mdash;&nbsp;<a href="https://medium.com/cri-o/we-just-released-cri-o-1-0-0-rc3-73da5a79e72c">1.0.0-rc3</a>, выпущенный на прошлой неделе. Среди его изменений выделяются поддержка Minikube (для запуска CRI-O с локальным кластером Kubernetes), лимиты для размера лога контейнера, поддержка квоты для overlay, возможность запуска на файловых системах на базе tmpfs. Его анонс завершается фразой, что &laquo;теперь мы&nbsp;<strong>близки к выпуску 1.0</strong>, как только количество багов уменьшится&raquo;.<br />\r\n<br />\r\nРелиз&nbsp;<a href="https://habrahabr.ru/company/flant/blog/338230/">Kubernetes 1.8</a>, который состоялся в конце сентября, &laquo;повысил&raquo;&nbsp;<strong>статус поддержки CRI-O до стабильного</strong>, поскольку были пройдены все тесты e2e.<br />\r\n<br />\r\nДля перевода вашей инсталляции Kubernetes с Docker на CRI-O потребуется:<br />\r\n&nbsp;</p>\r\n\r\n<ol>\r\n\t<li>Установить и настроить CRI-O (<code>/etc/crio/crio.conf</code>,&nbsp;<code>/etc/containers/policy.json</code>&nbsp;и т.п.; сам сервис запускается как системная служба &mdash; рекомендуется в связке с systemd) на каждом узле, где осуществляется миграция.</li>\r\n\t<li>Исправить требования службы&nbsp;<em>kubelet</em>&nbsp;в systemd (<code>/etc/systemd/system/kubelet.service</code>) и настроить её параметры (<code>/etc/kubernetes/kubelet.env</code>).</li>\r\n\t<li>Подготовить плагин CNI.</li>\r\n\t<li>Запустить сервис&nbsp;<em>crio</em>&nbsp;и перезапустить&nbsp;<em>kubelet</em>.</li>\r\n</ol>\r\n\r\n<p><br />\r\nБолее подробную инструкцию можно найти&nbsp;<a href="https://github.com/kubernetes-incubator/cri-o/blob/master/kubernetes.md">здесь</a>.<br />\r\n&nbsp;</p>\r\n\r\n<h2>cri-containerd</h2>\r\n\r\n<p><br />\r\nНапоследок, полезно будет упомянуть и параллельную активность со стороны&nbsp;<strong>компании Docker</strong>&nbsp;под названием&nbsp;<a href="https://github.com/kubernetes-incubator/cri-containerd"><strong>cri-containerd</strong></a>. Это ещё одна Open Source-реализация уже упомянутого интерфейса Kubernetes CRI для тех, кто выбрал containerd в качестве единственной исполняемой среды для контейнеров&nbsp;<em>(вместе с теми же runc и CNI для решения соответствующих задач)</em>. Имея&nbsp;<strong>статус альфа-версии</strong>, cri-containerd поддерживает Kubernetes 1.7+, прошёл все тесты на валидацию с CRI и все тесты node e2e.<br />\r\n<br />\r\nНа недавнем выступлении Liu Lantao (Google) и Abhinandan Prativadi (Docker) было объявлено, что бета-версию этого решения ожидают к концу года (<a href="https://www.slideshare.net/Docker/kubernetes-cri-containerd-integration-by-lantao-liu-google">слайды доклада</a>):<br />\r\n<br />\r\n<img src="https://habrastorage.org/webt/59/e0/66/59e0667a4a604168240289.png" /><br />\r\n&nbsp;</p>\r\n\r\n<h2>P.S.</h2>\r\n\r\n<p><br />\r\nА в завершении такой статьи не могу не привести замечательную&nbsp;<a href="https://twitter.com/kelseyhightower/status/914884130797633538">цитату</a>&nbsp;Kelsey Hightower&rlm;, хорошо известного в DevOps-сообществе как минимум благодаря &laquo;<a href="https://github.com/kelseyhightower/kubernetes-the-hard-way">Kubernetes The Hard Way</a>&raquo;:</p>	0	1	2017-10-14 12:25:02.898179+06	2017-10-14 12:25:02.898233+06
4	Существует ли идеальный планировщик личных задач? Разработка модульного планировщика	<p>Некоторое время назад, я, как активный пользователь планировщиков личных задач, открыл для себя один значительный недостаток &ndash; несмотря на их несчётное количество, невозможно найти &laquo;тот самый&raquo;, который удовлетворял бы тебя по всем пунктам.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Нет, само по себе это абсолютно нормально, так как программу разрабатывал один или несколько разработчиков, которые в итоге пришли к своему пониманию того, &ldquo;как пользователю будет лучше&rdquo;. Да и к тому же, невозможно в одной программе уместить всё, что теоретически может захотеть сферический пользователь в вакууме.&nbsp;<strong>Или возможно?</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src="https://habrastorage.org/webt/59/dc/d1/59dcd11cc82f5906101551.png" /></p>\r\n\r\n<p><br />\r\n<a name="habracut"></a></p>\r\n\r\n<h2>Почему 2 функции в 1 приложении лучше, чем 1 функция в 1 приложении</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Давайте на секунду отбросим все ограничения и представим что идеальный планировщик существует: он полностью соответствует вашим ожиданиям в плане интерфейса, предоставляет все необходимые вам функции и работает на всех ваших устройствах. Что это нам даёт? Ключевой особенностью такого приложения будет возможность использовать одни и те же данные для обеспечения работы всех функций приложения.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Смоделируем ситуацию &mdash; есть два пользователя, которые жить не могут без составления списка задач и использования техники&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%9F%D0%BE%D0%BC%D0%B8%D0%B4%D0%BE%D1%80_(%D0%BC%D0%B5%D1%82%D0%BE%D0%B4)">Pomdoro</a>. У обоих одинаковые потребности &mdash; разница лишь в том, какие приложения они используют для их удовлетворения:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Пользователь#1 использует 2 популярных приложения:&nbsp;<a href="https://play.google.com/store/apps/details?id=com.todoist">Todoist</a>&nbsp;(список дел) и&nbsp;<a href="https://play.google.com/store/apps/details?id=com.wlxd.pomochallenge">Productivity Challenge Timer</a>&nbsp;(Pomodoro)</li>\r\n\t<li>Пользователь#2 пользуется нашим гипотетическим &laquo;идеальным&raquo; приложением</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src="https://habrastorage.org/webt/59/df/9a/59df9abd22123114986687.png" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Пару слов о том, как происходит взаимодействие пользователя с программой в обоих случаях:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Пользователь#1: заполняет список задач в Todoist, заполняет список проектов в Productivity Challenge Timer</li>\r\n\t<li>Пользователь#2: заполняет список задач внутри своей программы</li>\r\n</ul>\r\n\r\n<p><br />\r\n<img src="https://habrastorage.org/webt/59/df/9a/59df9a2b8cb90680359192.png" /><br />\r\n&nbsp;</p>\r\n\r\n<p>Исходя из приведённой иллюстрации можно определить некоторые неприятные моменты, с которыми придётся столкнуться пользователю#1, в отличие от пользователя#2:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Необходимость ручной синхронизации списка проектов в обоих приложениях</li>\r\n\t<li>Невозможность запустить циклы Pomodoro для включённых в проект подзадач</li>\r\n\t<li>Отсутствие объединённой статистики по выполнению задач &mdash; она хранится в разных приложениях</li>\r\n</ul>\r\n\r\n<p><br />\r\nЕсли вас это не смущает, и вы считаете что можно обойтись и несколькими приложениями, то представьте что будет, если нужно обеспечить пользователя не двумя, а десятью функциями?<br />\r\n&nbsp;</p>\r\n\r\n<h2>Решение проблемы</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Хорошо, одно приложение в котором есть все нужные функции лучше, чем несколько приложений. Но нельзя же разрабатывать под все сочетания функций отдельную программу! Всё так и получается, если не использовать...<s>и зачем я ломаю комедию, в заголовке же написано было</s>&hellip; модульный подход!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Главный секрет &laquo;идеального&raquo; приложения в том, что не надо пытаться &laquo;предугадать&raquo; что же пользователь там захочет, а позволить ему самому&nbsp;<u>собрать</u>&nbsp;своё &laquo;личное&raquo; приложение, которое как раз и будет максимально полно отвечать его желаниям и потребностям. Процесс&nbsp;<u>сборки</u>&nbsp;такого приложения будет заключаться в отбирании желаемых функций приложения и аспектов пользовательского интерфейса, которые будут представлены соответствующими модулями.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>К тому же, очевидно, что если грамотно организовать процесс разработки подобного приложения, то общая трудоёмкость существенно сократится, так как реализованные функции никуда не исчезают &mdash; они лишь &laquo;запаковываются&raquo; в удобные для использования другими разработчиками модули.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Это не только теория</h2>\r\n\r\n<p><br />\r\nЧтобы эта статья не выглядела как бред спятившего на своей теории разработчика, я хотел бы показать как это всё работает на примере своего проекта. Я не буду пока описывать его в рамках данной статьи &mdash; сейчас лишь опишу саму идею. В общем, есть некое приложение X &mdash; на данный момент в нём можно подключать новые модули в систему, где каждый модуль может существенно изменить интерфейс и расширить доступные функции приложения.<br />\r\n&nbsp;</p>\r\n\r\n<p>Вот ситуация как в примере выше, когда модуль списка дел расширяется модулем Pomodoro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src="https://habrastorage.org/webt/59/df/9a/59df9a2ad32d0284902938.png" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>На данный момент приложение находится в стадии разработки, и не готово к предоставлению доступа пользователям. Ещё много чего предстоит реализовать, но кое-что уже есть &mdash; вот, например, список рабочих функций приложения:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n\t<li>Список задач &mdash; у задач есть следующие свойства: название, дата, выполненные Pomodoro, зарисовка</li>\r\n\t<li>Техника Pomodoro &mdash; запуск циклов Pomodoro для задач из списка задач</li>\r\n\t<li>Пользовательские зарисовки &mdash; создание зарисовок для сохранения в отдельной галерее или привязки к задачам из списка задач</li>\r\n</ol>\r\n\r\n<p><br />\r\nКаждая из описанных функций представлена группой модулей, каждый из которых можно удалить, не повлияв на работоспособность всей системы &mdash; удаление модуля лишь исключит из системы соответствующую функцию, за которую он отвечал.<br />\r\n&nbsp;</p>\r\n\r\n<h2>Перспективы</h2>\r\n\r\n<p><br />\r\nПод конец статьи я бы хотел поделиться с вами своими концептами по дальнейшему развитию и использованию этого проекта.<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Взаимодействие с умным домом</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Оптимальное планирование выполнения проектов с учётом стиля жизни пользователя</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Контроль выполнения физических упражнений</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В данной статье я не рассматривал особенности реализации, дабы не перегружать текст деталями. Я обязательно освещу сам процесс разработки, но в рамках следующей статьи. Если кому-то интересно, то можно ознакомиться с уже реализованными модулями:<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Реализованные на текущий момент модули</strong></p>\r\n\r\n<p><br />\r\nС исходным кодом можно ознакомиться по&nbsp;<a href="https://github.com/CurunirCingar/MASS">ссылке</a>.<br />\r\n<br />\r\nСпасибо за внимание.</p>	0	1	2017-10-14 12:25:41.166357+06	2017-10-14 12:25:41.16641+06
5	React, встроенные функции и производительность	<p><span style="color:#222222"><span style="background-color:#ffffff">В контексте React то, что называют встроенной функцией (inline function) &mdash; это функция, которая определяется в процессе рендеринга. В React есть два значения понятия &laquo;рендеринг&raquo;, которые часто путают. Первое относится к получению элементов React из компонентов (вызов методов&nbsp;</span></span><code>render</code><span style="color:#222222"><span style="background-color:#ffffff">компонентов) в процессе обновления. Второе &mdash; это реальное обновление фрагментов страницы путём модификации DOM. Когда я в этой статье говорю о &laquo;рендеринге&raquo;, то имею в виду именно первый вариант.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Вот несколько примеров встроенных функций:</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code><span style="color:#a626a4">class</span> <span style="color:#c18401">App</span> <span style="color:#a626a4">extends</span> <span style="color:#c18401">Component</span> {\r\n &nbsp;<span style="color:#a0a1a7"><em>// ...</em></span>\r\n &nbsp;render() {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">return</span> (\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<span style="color:#a0a1a7"><em>/* 1. встроенный обработчик событий &quot;компонента DOM&quot; */</em></span>}\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;button\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;onClick={() =&gt; {\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.setState({ clicked: <span style="color:#0184bb">true</span> })\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}}\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#986801">Click</span>!\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/button&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<span style="color:#a0a1a7"><em>/* 2. &quot;Кастомное событие&quot; или &quot;действие&quot; */</em></span>}\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;<span style="color:#986801">Sidebar</span> onToggle={(isOpen) =&gt; {\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.setState({ sidebarIsOpen: isOpen })\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}}/&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<span style="color:#a0a1a7"><em>/* 3. Коллбэк свойства render */</em></span>}\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;<span style="color:#986801">Route</span>\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;path=<span style="color:#50a14f">&quot;/topic/:id&quot;</span>\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;render={({ <span style="color:#a626a4">match</span> }) =&gt; (\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h1&gt;{<span style="color:#a626a4">match</span>.params.id}&lt;/h1&gt;}\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n &nbsp;&nbsp;&nbsp;)\r\n &nbsp;}\r\n}</code></span></span></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 style="font-style:normal"><span style="color:#3ac1ef">Преждевременная оптимизация &mdash; корень всех зол</span></h2>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Прежде чем продолжать, нам нужно поговорить о том, как оптимизировать программы. Спросите любого профессионала в области производительности, и он скажет вам, что преждевременная оптимизация &mdash; это зло. Это относится абсолютно ко всем программам. Любой, кто знает толк в оптимизации, может это подтвердить.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Помню выступление моего друга Ральфа Холзманна, посвящённое&nbsp;</span></span><code>gzip</code><span style="color:#222222"><span style="background-color:#ffffff">, которое по-настоящему упрочило во мне эту идею. Он говорил об эксперименте, который провёл с&nbsp;</span></span><code>LABjs</code><span style="color:#222222"><span style="background-color:#ffffff">, старой библиотекой для загрузки скриптов. Можете посмотреть это&nbsp;</span></span><a href="https://vimeo.com/34164210" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">выступление</a><span style="color:#222222"><span style="background-color:#ffffff">. То, о чём я тут говорю, происходит в течение примерно двух с половиной минут, начинаясь с 30-й минуты видео.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">В то время в&nbsp;</span></span><a href="https://github.com/getify/LABjs" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">LABjs</a><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;было сделано кое-что странное, направленное на оптимизацию размера готового кода. Вместо использования обычной объектной нотации (</span></span><code>obj.foo</code><span style="color:#222222"><span style="background-color:#ffffff">) там применялось хранение ключей в строках и использование квадратных скобок для доступа к содержимому объектов (</span></span><code>obj[stringForFoo]</code><span style="color:#222222"><span style="background-color:#ffffff">). Причиной подобного было то, что после минификации и сжатия кода с помощью&nbsp;</span></span><code>gzip</code>&nbsp;<a href="https://github.com/getify/LABjs/blob/b23ee3fcad12157cf8f6a291cb54fd7550ac7f3b/LAB.src.js#L7-L34" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">необычно написанный код</a><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;должен был бы стать меньше, чем код, который написан привычным способом.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Ральф сделал форк этого кода и убрал оптимизацию, переписав его привычным способом, не думая о том, как оптимизировать код для минификации и gzip-сжатия.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Оказалось, что избавление от &laquo;оптимизации&raquo; позволило сократить размер итогового файла на 5.3%! Очевидно, автор библиотеки писал её сразу в &laquo;оптимизированном&raquo; виде, не проверяя, даст ли это какие-то преимущества. Без измерений невозможно узнать, улучшает ли что-нибудь некая оптимизация. Кроме того, если оптимизация только ухудшает положение дел, вы об этом тоже не узнаете.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Преждевременная оптимизация не только может значительно увеличить время разработки, ухудшая чистоту кода, она может иметь негативные последствия и привести к проблемам, как это было с LABjs. Если бы автор библиотеки проводил замеры вместо того, чтобы воображать проблемы с производительностью, он сэкономил бы время на разработку, выпустил бы более чистый код, обладающий лучшими характеристиками.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Процитирую тут&nbsp;</span></span><a href="https://twitter.com/mjackson/status/909834812877283330?ref_src=twsrc%5Etfw&amp;ref_url=https%3A%2F%2Fcdb.reacttraining.com%2Fmedia%2Fdfe70e945f32c97d0a6cdd2f23b5e42f%3FpostId%3Dbdff784f5578" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">этот твит</a><span style="color:#222222"><span style="background-color:#ffffff">: &laquo;Меня раздражает, когда люди, развалившись в кресле, рассуждают о том, что некий код будет медленным для решения их задач, не проводя никаких замеров производительности&raquo;. Я эту точку зрения поддерживаю.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Итак, повторюсь &mdash; не занимайтесь преждевременной оптимизацией. А теперь &mdash; вернёмся к React.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h2 style="font-style:normal"><span style="color:#3ac1ef">Почему говорят, что встроенные функции ухудшают производительность?</span></h2>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Встроенные функции считают медленными по двум причинам. Во-первых &mdash; это связано с опасениями, касающимися потребления памяти и сборки мусора. Во вторых &mdash; из-за&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">. Разберём эти опасения.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h3 style="color:#222222; font-style:normal"><span style="color:#3ac1ef">▍Потребление памяти и сборка мусора</span></h3>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Для начала, программисты (и&nbsp;</span></span><a href="https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-no-bind.md" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">конфигурации estlint</a><span style="color:#222222"><span style="background-color:#ffffff">) обеспокоены потреблением памяти и нагрузкой на систему от сборки мусора при создании встроенных функций. Это &mdash; наследие тех дней, когда стрелочные функции в JS ещё не получили широкого распространения. Если в React-коде, во встроенных конструкциях, часто использовалась команда&nbsp;</span></span><code>bind</code><span style="color:#222222"><span style="background-color:#ffffff">, это, исторически, вело к плохой производительности. Например:</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code>&lt;<span style="color:#a626a4">div</span>&gt;\r\n &nbsp;{stuff.map(<span style="color:#a626a4">function</span>(<span style="color:#4078f2">thing</span>) {\r\n &nbsp;&nbsp;&nbsp;&lt;<span style="color:#a626a4">div</span>&gt;{thing.whatever}&lt;/<span style="color:#a626a4">div</span>&gt;\r\n &nbsp;}.bind(this)}\r\n&lt;/<span style="color:#a626a4">div</span>&gt;</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Проблемы с&nbsp;</span></span><code>Function.prototype.bind</code>&nbsp;<a href="http://benediktmeurer.de/2015/12/25/a-new-approach-to-function-prototype-bind/" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">были исправлены здесь</a><span style="color:#222222"><span style="background-color:#ffffff">, а стрелочные функции, либо применялись как встроенные возможности языка, либо транспилировались с помощью babel в обычные функции. И так и так мы можем считать, что медленными они не являются.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Помните о том, что не надо делать предположений о том, что некий код окажется медленным. Пишите код так, как делаете это всегда и замеряйте производительность. Если удаётся найти какие-то проблемы &mdash; исправляйте их. Вам не надо доказывать, что стрелочные функции работают быстро &mdash; пусть кто-нибудь другой докажет, что они медленны. Иначе это &mdash; преждевременная оптимизация.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Насколько я знаю, никто пока не привёл исследование своего приложения, указывающее на то, что встроенные функции приводят к проблемам с производительностью. До этого момента не стоит даже об этом говорить, однако, я, в любом случае, поделюсь тут ещё одной идеей.</span></span><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Если нагрузка на систему от создания встроенной функции достаточно высока для того, чтобы создавать специальное правило eslint для предотвращения этого, с чего бы нам стремиться перемещать эти тяжёлые операции в весьма важный с точки зрения воздействия на скорость работы системы блок инициализации?</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code><span style="color:#a626a4">class</span> <span style="color:#c18401">Dashboard</span> <span style="color:#a626a4">extends</span> <span style="color:#c18401">Component</span> {\r\n &nbsp;state = { handlingThings: <span style="color:#0184bb">false</span> }\r\n &nbsp;\r\n &nbsp;constructor(props) {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">super</span>(props)\r\n &nbsp;&nbsp;&nbsp;\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.handleThings = () =&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.setState({ handlingThings: <span style="color:#0184bb">true</span> })\r\n\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.handleStuff = () =&gt; { <span style="color:#a0a1a7"><em>/* ... */</em></span> }\r\n\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// ещё больше нагрузки на систему с bind</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.handleMoreStuff = <span style="color:#a626a4">this</span>.handleMoreStuff.bind(<span style="color:#a626a4">this</span>)\r\n &nbsp;}\r\n\r\n &nbsp;handleMoreStuff() { <span style="color:#a0a1a7"><em>/* ... */</em></span> }\r\n\r\n &nbsp;render() {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">return</span> (\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<span style="color:#a626a4">this</span>.state.handlingThings ? (\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;button onClick={<span style="color:#a626a4">this</span>.handleStuff}/&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;button onClick={<span style="color:#a626a4">this</span>.handleMoreStuff}/&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;) : (\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;button onClick={<span style="color:#a626a4">this</span>.handleThings}/&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)}\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n &nbsp;&nbsp;&nbsp;)\r\n &nbsp;}\r\n}</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Занимаясь предварительной оптимизацией, мы замедлили инициализацию компонента в три раза. Если бы все обработчики событий были встроенными функциями, первоначальному вызову&nbsp;</span></span><code>render</code><span style="color:#222222"><span style="background-color:#ffffff">надо было бы создать лишь одну функцию. Вместо этого мы создаём три. Причём, никаких замеров производительности не проводилось, поэтому у нас нет причины считать это проблемой.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Однако, опять же, не стоит увлекаться идеей переноса всего, что надо и не надо во встроенные функции. Если, вдохновившись вышеприведённой идеей, некто решит создать eslint-правило, которое будет требовать повсеместного использования встроенных функций для ускорения первоначального рендеринга, то перед нами окажется всё та же вредная преждевременная оптимизация.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h3 style="color:#222222; font-style:normal"><span style="color:#3ac1ef">▍PureComponent и shouldComponentUpdate</span></h3>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Настоящая суть проблемы кроется в&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;и&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">. Для того, чтобы осмысленно заниматься оптимизацией производительности, нужно понимать две вещи: особенности&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">, и то, как работает сравнение на строгое равенство в JavaScript. Не понимая этих концепций, можно, пытаясь сделать код быстрее, только всё ухудшить.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Когда вызывают&nbsp;</span></span><code>setState</code><span style="color:#222222"><span style="background-color:#ffffff">, React сравнивает старый элемент с новым (это называется&nbsp;</span></span><a href="https://reactjs.org/docs/reconciliation.html" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">согласованием</a><span style="color:#222222"><span style="background-color:#ffffff">), а затем использует полученную информацию для обновления элементов реального DOM. Иногда эта операция может происходить довольно медленно, если имеется слишком много элементов, которые надо проверять (что-то вроде большого SVG). В таких случаях React предоставляет обходной путь, который называется&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code><span style="color:#a626a4">class</span> <span style="color:#c18401">Avatar</span> <span style="color:#a626a4">extends</span> <span style="color:#c18401">Component</span> {\r\n &nbsp;shouldComponentUpdate(nextProps, nextState) {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">return</span> stuffChanged(<span style="color:#a626a4">this</span>, nextProps, nextState))\r\n &nbsp;}\r\n &nbsp;\r\n &nbsp;render() {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">return</span> <span style="color:#a0a1a7"><em>//...</em></span>\r\n &nbsp;}\r\n}</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Если у компонента задан&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">, прежде чем React сравнит старый и новый элементы, он обратится к&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;для того, чтобы узнать о том, изменилось ли что-нибудь. Если в ответ вернётся&nbsp;</span></span><code>false</code><span style="color:#222222"><span style="background-color:#ffffff">, React полностью пропустит операцию сравнения элементов, что сэкономит какое-то время. Если компонент достаточно велик, это может привести к заметному влиянию на производительность.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Самый распространённый способ оптимизации компонента &mdash; расширение&nbsp;</span></span><code>React.PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">вместо&nbsp;</span></span><code>React.Component</code><span style="color:#222222"><span style="background-color:#ffffff">.&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;будет сравнивать свойства и состояние в&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">, в результате, вам не придётся делать это самостоятельно.</span></span><br />\r\n<code>class Avatar extends React.PureComponent { ... }</code><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Класс&nbsp;</span></span><code>Avatar</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;теперь использует строгое сравнение на равенство при работе со свойствами и состоянием прежде чем запрашивать обновления. Можно ожидать, что это ускорит работу программы.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h3 style="color:#222222; font-style:normal"><span style="color:#3ac1ef">▍Сравнение на строгое равенство</span></h3>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">В JavaScript существует шесть примитивных типов:&nbsp;</span></span><code>string</code><span style="color:#222222"><span style="background-color:#ffffff">,&nbsp;</span></span><code>number</code><span style="color:#222222"><span style="background-color:#ffffff">,&nbsp;</span></span><code>boolean</code><span style="color:#222222"><span style="background-color:#ffffff">,&nbsp;</span></span><code>null</code><span style="color:#222222"><span style="background-color:#ffffff">,&nbsp;</span></span><code>undefined</code><span style="color:#222222"><span style="background-color:#ffffff">, и&nbsp;</span></span><code>symbol</code><span style="color:#222222"><span style="background-color:#ffffff">. Когда выполняют строгое сравнение двух переменных примитивных типов, которые хранят оно и то же значение, получается&nbsp;</span></span><code>true</code><span style="color:#222222"><span style="background-color:#ffffff">. Например:</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code><span style="color:#a626a4">const</span> <span style="color:#a626a4">one</span> = 1\r\n<span style="color:#a626a4">const</span> uno = 1\r\n<span style="color:#a626a4">one</span> === uno <span style="color:#a0a1a7"><em>// true</em></span></code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Когда&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;сравнивает свойства, он использует строгое сравнение. Это отлично работает для встроенных примитивных значений вроде&nbsp;</span></span><code>&lt;Toggler isOpen={true}/&gt;</code><span style="color:#222222"><span style="background-color:#ffffff">.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Проблема при сравнении свойств возникает для других типов, то есть, извините &mdash; единственного типа. Всё остальное в JS &mdash; это&nbsp;</span></span><code>Object</code><span style="color:#222222"><span style="background-color:#ffffff">. А как же функции и массивы? На самом деле всё это &mdash; объекты. Позволю себе процитировать выдержку из&nbsp;</span></span><a href="https://developer.mozilla.org/ru/docs/Web/JavaScript/Data_structures" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">документации MDN</a><span style="color:#222222"><span style="background-color:#ffffff">: &laquo;Функции &mdash; это обычные объекты, имеющие дополнительную возможность быть вызванными для исполнения&raquo;.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Ну что тут скажешь &mdash; JS это JS. В любом случае, строгое сравнение разных объектов, если даже они содержат одни и те же значения, вернёт&nbsp;</span></span><code>false</code><span style="color:#222222"><span style="background-color:#ffffff">.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code><span style="color:#a626a4">const</span> <span style="color:#a626a4">one</span> = { <span style="color:#a626a4">n</span>: 1 }\r\n<span style="color:#a626a4">const</span> uno = { <span style="color:#a626a4">n</span>: 1 }\r\n<span style="color:#a626a4">one</span> === uno <span style="color:#a0a1a7"><em>// false</em></span>\r\n<span style="color:#a626a4">one</span> === <span style="color:#a626a4">one</span> <span style="color:#a0a1a7"><em>// true</em></span></code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Итак, если вы встраиваете объект в JSX-код, адекватное сравнение свойств в&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;окажется невозможным, в результате чего будет произведено более трудоёмкое сравнение элементов React. Это сравнение выяснит лишь то, что компонент не изменился, как результат &mdash; потеря времени на двух сравнениях.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code>/<span style="color:#50a14f">/ первый рендер\r\n&lt;Avatar user={{ id: &lsquo;ryan&rsquo; }}/</span>&gt;\r\n\r\n<span style="color:#50a14f">//</span> следующий рендер\r\n&lt;Avatar user=<span style="color:#986801">{{ <span style="color:#4078f2">id:</span> &lsquo;ryan&rsquo; }}</span>/&gt;\r\n\r\n<span style="color:#50a14f">//</span> сравнение свойств полагает, что что-то изменилось, так как {} !== {}\r\n/<span style="color:#50a14f">/ сравнение элементов (согласование) выясняет, что ничего не изменилось</span></code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Так как функции &mdash; это объекты, и&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;выполняет строгую проверку на равенство свойств, сравнение встроенных функций при анализе свойств всегда оканчивается сообщением о том, что они разные, после чего будет осуществлён переход к сравнению элементов в ходе процедуры согласования.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Вы можете заметить, что относится это не только ко встроенным функциям. То же самое можно сказать и об обычных объектах, и о массивах.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Для того, чтобы&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;делал при сравнении одинаковых функций то, чего мы от него ожидаем, нужно сохранять ссылочную идентичность функций. Для опытных JS-разработчиков это &mdash; не такая уж и плохая новость. Но, если учесть то, что&nbsp;</span></span><a href="https://medium.com/@mjackson" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">Майкл</a><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;и я узнали после обучения примерно 3500 человек, имеющих различный уровень подготовки, можно отметить, что эта задача оказалась для наших учеников не такой уж и простой. Надо отметить, что и классы ES тут не помогают, поэтому в данной ситуации приходится пользоваться другими возможностями JS:</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code><span style="color:#a626a4">class</span> <span style="color:#c18401">Dashboard</span> <span style="color:#a626a4">extends</span> <span style="color:#c18401">Component</span> {\r\n &nbsp;constructor(props) {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">super</span>(props)\r\n &nbsp;&nbsp;&nbsp;\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// Используем bind? Это замедляет инициализацию и, если такое повторяется раз 20,</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// ужасно смотрится.</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// Кроме того, это увеличивает размер пакета.</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.handleStuff = <span style="color:#a626a4">this</span>.handleStuff.bind(<span style="color:#a626a4">this</span>)\r\n\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// _this - это дурной тон.</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">var</span> _this = <span style="color:#a626a4">this</span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.handleStuff = function() {\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_this.setState({})\r\n &nbsp;&nbsp;&nbsp;}\r\n &nbsp;&nbsp;&nbsp;\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// Если вам доступны классы ES, то, возможно, вы можете использовать и </em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// стрелочные функции (то есть, работаете с babel или с современным браузером).</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// Это не так уж и плохо, но перемещение всех обработчиков в конструктор - это уже</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>// не так уж и хорошо.</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.handleStuff = () =&gt; {\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.setState({})\r\n &nbsp;&nbsp;&nbsp;}\r\n &nbsp;}\r\n &nbsp;\r\n &nbsp;<span style="color:#a0a1a7"><em>// так куда лучше, но это пока за пределами JavaScript,</em></span>\r\n &nbsp;<span style="color:#a0a1a7"><em>// поэтому тут можно задаться вопросом о том, как работает комитет TC39 и</em></span>\r\n &nbsp;<span style="color:#a0a1a7"><em>// как он оценивает предложения по языку.</em></span>\r\n &nbsp;handleStuff = () =&gt; {}\r\n}</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Тут надо отметить, что изучение приёмов сохранения ссылочной идентичности функций ведёт к удивительно длинным беседам. У меня нет причин призывать к этому программистов, разве что им захочется выполнить требования их конфигурации eslint. Главное, что мне хотелось показать &mdash; это то, что встроенные функции не мешают оптимизации. А теперь поделюсь собственной историей оптимизации производительности.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h2 style="font-style:normal"><span style="color:#3ac1ef">Как я работал с PureComponent</span></h2>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Когда я впервые узнал о&nbsp;</span></span><code>PureRenderMixin</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;(это &mdash; конструкция из ранних версий React, которая позже превратилась в&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">), я использовал множество измерений и оценил производительность моего приложения. Затем я добавил&nbsp;</span></span><code>PureRenderMixin</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;ко всем компонентам. Когда я предпринял измерение производительности оптимизированной версии, то надеялся, что в результате всё будет так замечательно, что я смогу с гордостью всем об этом рассказывать.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Однако, к моему великому удивлению, приложение стало работать медленнее.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Почему? Подумаем об этом. Если у вас есть некий&nbsp;</span></span><code>Component</code><span style="color:#222222"><span style="background-color:#ffffff">, сколько операций сравнения приходится выполнять при работе с ним? А если речь идёт о&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">? Ответы, соответственно, заключаются в следующем: &laquo;только одно&raquo;, и &laquo;как минимум одно, а иногда &mdash; два&raquo;. Если обычно компонент при обновлении меняется, то&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;будет выполнять две операции сравнения вместо одной (свойства и состояние в&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">, а затем &mdash; обычное сравнение элементов). Это означает, что обычно&nbsp;</span></span><code>PureComponen</code><span style="color:#222222"><span style="background-color:#ffffff">t будет медленнее, но иногда &mdash; быстрее. Очевидно, большинство моих компонентов постоянно менялись, поэтому, в целом, приложение стало работать медленнее. Печально.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Универсального ответа на вопрос: &laquo;Как повысить производительность?&raquo; нет. Ответ можно найти только в замерах производительности конкретного приложения.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h2 style="font-style:normal"><span style="color:#3ac1ef">О трёх сценариях использования встроенных функций</span></h2>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">В начале материала я показал три типа встроенных функций. Теперь, когда подготовлена некоторая база, поговорим о каждом из них. Но, пожалуйста, помните о том, что&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;лучше попридержать до тех пор, пока у вас не будет измерений для того, чтобы оценить выгоды от использования этого механизма.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h3 style="color:#222222; font-style:normal"><span style="color:#3ac1ef">▍Обработчик событий компонента DOM</span></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code>&lt;<span style="color:#e45649">button</span>\r\n &nbsp;<span style="color:#986801">onClick</span>=<span style="color:#50a14f">{()</span> =&gt; this.setState(&hellip;)}\r\n&gt;click&lt;/<span style="color:#e45649">button</span>&gt;</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Обычно внутри обработчиков событий для кнопок, полей ввода и других компонентов DOM, не делается ничего кроме вызова&nbsp;</span></span><code>setState</code><span style="color:#222222"><span style="background-color:#ffffff">. Это обычно делает встроенные функции наиболее чистым подходом. Вместо того, чтобы прыгать по файлу в поисках обработчиков событий, их можно найти в коде описания элемента. Сообщество React обычно приветствует подобное.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Компонент&nbsp;</span></span><code>button</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;(и любой другой компонент DOM) даже не может быть&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">, поэтому тут не нужно беспокоиться о&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;и о ссылочной идентичности.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">В результате, это можно считать медленным только в том случае, если согласиться с тем, что простое определение функции &mdash; это достаточно большая нагрузка на систему, о которой стоит беспокоиться. Нет подтверждений того, что это так. Неоправданное избавление от встроенных обработчиков событий &mdash; это знакомая нам преждевременная оптимизация.&nbsp;</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h3 style="color:#222222; font-style:normal"><span style="color:#3ac1ef">▍&laquo;Кастомное событие&raquo; или &laquo;действие&raquo;</span></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code>&lt;Sidebar onToggle={(isOpen) =&gt; {\r\n &nbsp;this.setState({ sidebarIsOpen: isOpen })\r\n}}/&gt;</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Если&nbsp;</span></span><code>Sidebar &mdash;&nbsp;</code><span style="color:#222222"><span style="background-color:#ffffff">это&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">, мы не пройдём сравнение свойств. Опять же, так как обработчик прост, его встраивание может оказаться наилучшим выходом.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Теперь поговорим о событиях вроде вроде&nbsp;</span></span><code>onToggle</code><span style="color:#222222"><span style="background-color:#ffffff">, и о том, почему&nbsp;</span></span><code>Sidebar</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;занимается их сравнением. Есть лишь две причины поиска различий в свойствах в&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">:</span></span><br />\r\n&nbsp;</p>\r\n\r\n<ol style="margin-left:30px; margin-right:0px">\r\n\t<li>Свойство используют для рендеринга.</li>\r\n\t<li>Свойство используют ради достижения побочного эффекта в&nbsp;<code>componentWillReceiveProps</code>, в&nbsp;<code>componentDidUpdate</code>, или в&nbsp;<code>componentWillUpdate</code>.</li>\r\n</ol>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Большинство свойств вида&nbsp;</span></span><code>on&lt;whatever&gt;</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;не соответствуют этим требованиям. Таким образом, большинство вариантов использования&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;ведут к выполнению ненужных сравнений, что принуждает разработчиков поддерживать, без необходимости, ссылочную идентичность обработчиков.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Надо сравнивать только те свойства, которые могут меняться. Таким образом, обработчики могут находиться в коде описания элемента, и всё это будет работать быстро, а если уж нас беспокоит производительность, можно отметить, что при таком подходе надо будет меньше сравнений.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Для большинства компонентов я бы посоветовал создать класс&nbsp;</span></span><code>PureComponentMinusHandlers</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;и наследоваться от него, вместо того, чтобы наследоваться от&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">. Это поможет просто пропустить все проверки функций. Как раз то, что нужно. Ну &mdash; почти то, что нужно.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Если вы получите функцию и передадите эту функцию напрямую в другой компонент, он окажется устаревшим. Взгляните на это:</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code><span style="color:#a0a1a7"><em>// 1. Приложение передаст свойство форме.</em></span>\r\n<span style="color:#a0a1a7"><em>// 2. Форма собирается передать функцию кнопке,</em></span>\r\n<span style="color:#a0a1a7"><em>// которая перекрывает свойство, полученное от приложения.</em></span>\r\n<span style="color:#a0a1a7"><em>// 3. Приложение собирается выполнить setState после монтирования и передать</em></span>\r\n<span style="color:#a0a1a7"><em>// *новое* свойство форме.</em></span>\r\n<span style="color:#a0a1a7"><em>// 4. Форма передаёт новую функцию кнопке, перекрывая</em></span>\r\n<span style="color:#a0a1a7"><em>// новое свойство.</em></span>\r\n<span style="color:#a0a1a7"><em>// 5. Кнопка проигнорирует новую функцию и не сможет </em></span>\r\n<span style="color:#a0a1a7"><em>// обновить обработчик нажатия, её передача будет осуществлена </em></span>\r\n<span style="color:#a0a1a7"><em>// с устаревшими данными.</em></span>\r\n<span style="color:#a626a4">class</span> <span style="color:#c18401">App</span> <span style="color:#a626a4">extends</span> <span style="color:#c18401">React</span>.<span style="color:#c18401">Component</span> {\r\n &nbsp;state = { <span style="color:#a626a4">val</span>: <span style="color:#50a14f">&quot;one&quot;</span> }\r\n\r\n &nbsp;componentDidMount() {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">this</span>.setState({ <span style="color:#a626a4">val</span>: <span style="color:#50a14f">&quot;two&quot;</span> })\r\n &nbsp;}\r\n\r\n &nbsp;render() {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">return</span> &lt;<span style="color:#986801">Form</span> value={<span style="color:#a626a4">this</span>.state.<span style="color:#a626a4">val</span>} /&gt;\r\n &nbsp;}\r\n}\r\n\r\nconst <span style="color:#986801">Form</span> = props =&gt; (\r\n &nbsp;&lt;<span style="color:#986801">Button</span>\r\n &nbsp;&nbsp;&nbsp;onClick={() =&gt; {\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;submit(props.value)\r\n &nbsp;&nbsp;&nbsp;}}\r\n &nbsp;/&gt;\r\n)\r\n\r\n<span style="color:#a626a4">class</span> <span style="color:#c18401">Button</span> <span style="color:#a626a4">extends</span> <span style="color:#c18401">React</span>.<span style="color:#c18401">Component</span> {\r\n &nbsp;shouldComponentUpdate() {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a0a1a7"><em>//Давайте представим, будто мы сравнили всё, кроме функции.</em></span>\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">return</span> <span style="color:#0184bb">false</span>\r\n &nbsp;}\r\n\r\n &nbsp;handleClick = () =&gt; <span style="color:#a626a4">this</span>.props.onClick()\r\n\r\n &nbsp;render() {\r\n &nbsp;&nbsp;&nbsp;<span style="color:#a626a4">return</span> (\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;button onClick={<span style="color:#a626a4">this</span>.props.onClick}&gt;<span style="color:#986801">This</span> one is stale&lt;/button&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;button onClick={() =&gt; <span style="color:#a626a4">this</span>.props.onClick()}&gt;<span style="color:#986801">This</span> one works&lt;/button&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;button onClick={<span style="color:#a626a4">this</span>.handleClick}&gt;<span style="color:#986801">This</span> one works too&lt;/button&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n &nbsp;&nbsp;&nbsp;)\r\n &nbsp;}\r\n}</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">&rarr;&nbsp;</span></span><a href="https://codesandbox.io/s/v38y6zk8ml" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">Здесь</a><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;с этим кодом можно поэкспериментировать.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Итак, если вам нравится идея наследоваться от&nbsp;</span></span><code>PureRenderWithoutHandlers</code><span style="color:#222222"><span style="background-color:#ffffff">, не передавайте ваши обработчики, не участвующие в сравнении, напрямую другим компонентам &mdash; их надо каким-то способом обернуть.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Теперь нам либо надо поддерживать ссылочную идентичность, либо избегать ссылочной идентичности! Добро пожаловать в оптимизацию производительности. Как минимум, при таком подходе нагрузка ложится на оптимизированный компонент, а не на код, использующий его.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Должен честно сказать, что это приложение-пример &mdash; добавка к материалу, которую я сделал после публикации с подачи&nbsp;</span></span><a href="https://medium.com/@acdlite" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">Эндрю Кларка</a><span style="color:#222222"><span style="background-color:#ffffff">. Так может показаться, что я точно знаю, когда надо поддерживать ссылочную целостность, а когда &mdash; нет.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h3 style="color:#222222; font-style:normal"><span style="color:#3ac1ef">▍Свойство render</span></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code>&lt;<span style="color:#e45649">Route</span>\r\n &nbsp;<span style="color:#986801">path</span>=<span style="color:#50a14f">&quot;/topic/:id&quot;</span>\r\n &nbsp;<span style="color:#986801">render</span>=<span style="color:#986801">{({ match }</span>) =&gt; (\r\n &nbsp;&nbsp;&nbsp;&lt;<span style="color:#e45649">div</span>&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;<span style="color:#e45649">h1</span>&gt;<span style="color:#986801">{match.params.id}</span>&lt;/<span style="color:#e45649">h1</span>&gt;}\r\n &nbsp;&nbsp;&nbsp;&lt;/<span style="color:#e45649">div</span>&gt;\r\n &nbsp;)\r\n/&gt;</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Свойства&nbsp;</span></span><code>render &mdash;&nbsp;</code><span style="color:#222222"><span style="background-color:#ffffff">это шаблон, используемый для создания компонента, который существует для создания и поддержания разделяемого состояния (</span></span><a href="https://cdb.reacttraining.com/use-a-render-prop-50de598f11ce" style="box-sizing:inherit; background-color:#ffffff; color:#992298; text-decoration:none; font-family:-apple-system, BlinkMacSystemFont, Arial, sans-serif; font-size:16px; font-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:2; text-align:start; text-transform:none; white-space:normal; widows:2; word-spacing:0px; -webkit-text-stroke-width:0px">тут об этом можно почтить подробнее</a><span style="color:#222222"><span style="background-color:#ffffff">). Содержимое свойства&nbsp;</span></span><code>render</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;неизвестно компоненту. Например:</span></span><br />\r\n&nbsp;</p>\r\n\r\n<pre>\r\n<span style="color:#222222"><span style="background-color:#ffffff"><code>const App = (props) =&gt; (\r\n &nbsp;&lt;<span style="color:#e45649">div</span>&gt;\r\n &nbsp;&nbsp;&nbsp;&lt;<span style="color:#e45649">h1</span>&gt;Welcome, {props.name}&lt;/<span style="color:#e45649">h1</span>&gt;\r\n &nbsp;&nbsp;&nbsp;&lt;<span style="color:#e45649">Route</span> <span style="color:#986801">path</span>=<span style="color:#50a14f">&quot;/&quot;</span> <span style="color:#986801">render</span>=<span style="color:#50a14f">{()</span> =&gt; (\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;<span style="color:#e45649">div</span>&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{/*\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;props.name находится за пределами Route и оно не передаётся\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;как свойство, поэтому Route не соответствует\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;идеологии PureComponent, у него\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;нет сведений о том, что здесь появится после рендеринга.\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/}\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;<span style="color:#e45649">h1</span>&gt;Hey, {props.name}, let&rsquo;s get started!&lt;/<span style="color:#e45649">h1</span>&gt;\r\n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/<span style="color:#e45649">div</span>&gt;\r\n)}/&gt;\r\n &nbsp;&lt;/<span style="color:#e45649">div</span>&gt;\r\n)</code></span></span></pre>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Это означает, что встроенная функция свойства&nbsp;</span></span><code>render</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;не приведёт к проблемам с&nbsp;</span></span><code>shouldComponentUpdate</code><span style="color:#222222"><span style="background-color:#ffffff">. Компонент недостаточно информирован для того, чтобы его можно было бы преобразовать в&nbsp;</span></span><code>PureComponent</code><span style="color:#222222"><span style="background-color:#ffffff">.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Итак, опять же, доказательств медленности свойств&nbsp;</span></span><code>render</code><span style="color:#222222"><span style="background-color:#ffffff">&nbsp;у нас нет. Всё остальное &mdash; мысленные эксперименты, не имеющие отношения к реальности.</span></span><br />\r\n&nbsp;</p>\r\n\r\n<h2 style="font-style:normal"><span style="color:#3ac1ef">Итоги</span></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol style="margin-left:30px; margin-right:0px">\r\n\t<li>Пишите код так, как привыкли, реализуя в нём ваши идеи.</li>\r\n\t<li>Проводите замеры производительности для того, чтобы находить узкие места.&nbsp;<a href="https://reactjs.org/blog/2016/11/16/react-v15.4.0.html#profiling-components-with-chrome-timeline" style="box-sizing:inherit; color:#992298; text-decoration:none">Здесь</a>&nbsp;можно узнать о том, как это сделать.</li>\r\n\t<li>Используйте&nbsp;<code>PureComponent</code>&nbsp;и&nbsp;<code>shouldComponentUpdate</code>&nbsp;только при необходимости, пропуская функции, являющиеся свойствами компонента (только если они не используются в перехватчиках событий жизненного цикла для достижения побочных эффектов).</li>\r\n</ol>\r\n\r\n<p><br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">В заключение хочу сказать, что если вы относитесь к противникам преждевременной оптимизации, значит вам не нужно доказательств того, что встроенные функции ухудшают производительность. Вам, для того, чтобы задуматься об их оптимизации, нужны доказательства обратного.</span></span><br />\r\n<br />\r\n<span style="color:#222222"><span style="background-color:#ffffff">Уважаемые читатели! Как вы оптимизируете React-приложения?</span></span></p>	0	1	2017-10-14 12:26:36.204326+06	2017-10-14 12:26:36.204383+06
6	Использование преимуществ TypeScript в JavaScript разработке	<p>Язык программирования&nbsp;<a href="https://www.typescriptlang.org/">TypeScript</a>&nbsp;от Microsoft привносит многие преимущества статической типизации в JavaScript. Несмотря на то, что он не проверяет типы во время исполнения, он позволяет производить более точный статический анализ, повышает безопасность и открывает возможности для лучшей интеграции с IDE. Код на TypeScript обычно транспилируется в стандартный JavaScript, который выполняется в браузерах или Node.js. Учитывая привлекательность TypeScript, не удивительно, что его популярность&nbsp;<a href="https://thenewstack.io/typescript-getting-popular/">быстро растёт</a>.</p>\r\n\r\n<p><a name="habracut"></a></p>\r\n\r\n<p>Конечно, использование нестандартного диалекта языка не лишено объективных недостатков. Использование TypeScript в вашем проекте потребует дополнительного шага при сборке проекта, исключается возможность использования широкого набора инструментов, которые рассчитаны только на JavaScript. Так же, всем членам команды придется изучить нестандартные для JS функции. Так же, принимая во внимание скорость развития JavaScript, есть некоторый риск получить зависимость от нестандартного функционала. Разработчики TypeScript&nbsp;<a href="https://medium.com/@tomdale/glimmer-js-whats-the-deal-with-typescript-f666d1a3aad0">спроектировали</a>&nbsp;язык с учётом некоторых потенциальных проблем, но, тем не менее, это не &quot;ванильный&quot; JavaScript.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>К счастью, JavaScript разработчики могут получить некоторые из преимуществ используя привычный инструмент. В версии TypeScript 2.3, которая вышла в Апреле 2017 года, появилась поддержка анализа обычного JavaScript кода с указанием типов в комментариях. Вы можете использовать JSDoc подобный синтаксис для описания сигнатуры функций и добавления информации о типах. Инструменты TypeScript читают аннотации в комментариях и используют их практически так же как и в собственной системе типов.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>JavaScript код с аннотациями в комментариях более многословен чем TypeScript, но он работает везде, не требует транспайлинга и позволяет избирательно использовать типизацию там, где это необходимо. Пока что он не покрывает все возможности TypeScript, но уже достаточно функционален, чтоб быть полезным.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Рабочий пример</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Для того чтоб включить анализ JavaScript кода с помощью TypeScript просто добавьте комментарий с текстом&nbsp;<code>@ts-check</code>&nbsp;в начало файла. Потом вы можете добавить аннотации с указанием типов в пределах этого файла. Следующий пример показывает описание сигнатуры функции с двумя параметрами и определённым типом возвращаемого значения.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>// @ts-check\r\n\r\n/**\r\n * @param {number} a\r\n * @param {number} b\r\n * @return {number}\r\n */\r\nfunction example(a, b) {\r\n    return a + b;\r\n}</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Visual Studio Code, который поддерживает TypeScript из коробки, автоматически находит такие комментарии и включает режим проверки. Это не потребует абсолютно никакой настройки. Вам даже не надо создавать конфигурационный файл для TypeScript. Просто добавьте комментарии в любой JavaScript код. Если вы после этого попробуете вызвать функцию с неправильными аргументами, редактор покажет предупреждение.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src="https://habrastorage.org/webt/59/e0/96/59e096eeadb7b544378198.png" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Редактор так же будет использовать аннотации чтоб улучшить другие функции, такие как автодополнение. Кроме того, информация о типах успешно используется между файлами благодаря тому, что TypeScript понимает ES6 импорты и&nbsp;<code>require</code>&nbsp;в Node.js.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Вы так же можете использовать аннотации для указания структуры обычного объекта. Это может оказаться полезным когда вы хотите получить автодополнение свойств объекта и проверку их наличия для JSON данных полученных от какого-либо API. Следующий пример показывает как вы можете описать структуру объекта используя аннотации.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>/**\r\n * @typedef {Object} Issue\r\n * @property {string} url\r\n * @property {string} repository_url\r\n * @property {id} number\r\n * @property {string} title\r\n * @property {string} state\r\n * @property {bool} open\r\n */\r\n\r\nconst url = &quot;https://api.github.com/repos/microsoft/typescript/issues&quot;;\r\n\r\n(async () =&gt; {\r\n  let response = await got(url, {json: true});\r\n\r\n  /** @type {Issue[]} */\r\n  let issues = response.body;\r\n  for (let issue of issues)\r\n    console.log(issue.title);\r\n})();</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В этом примере используется специальная аннотация&nbsp;<code>@typedef</code>&nbsp;для определения типа объекта&nbsp;<code>Issue</code>. Далее в функции получения данных, мы указываем с помощью&nbsp;<code>@type</code>&nbsp;что полученный ответ представляет собой массив объектов&nbsp;<code>Issue</code>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Вы можете найти больше&nbsp;<a href="https://github.com/Microsoft/TypeScript/wiki/JSDoc-support-in-JavaScript">примеров</a>&nbsp;использования аннотаций в TypeScript wiki.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Поддержка библиотек</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>TypeScript уже имеет указания типов для стандартной библиотеки Node.js, так что вы можете пользоваться проверками и дополнением практически всех её функций из коробки. Некоторые сторонние библиотеки также имеют файл с указанием типов(как правило &mdash; это файл с расширением&nbsp;<code>d.ts</code>) в своих npm пакетах. Добавление&nbsp;<code>@ts-check</code>&nbsp;для вашего проекта будет так же учитывать типы импортированных из таких библиотек функций и объектов.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src="https://habrastorage.org/webt/59/e0/96/59e096f26f9f6808620873.png" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Заключение</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Весь прошлый год я старался упростить свои инструменты JavaScript разработки и уйти от нарастающей сложности и избыточности, поражающей современную веб разработку. Использование аннотаций в комментариях неплохо позволяет придерживаться этой стратегии. Я получаю преимущества TypeScript не добавляя лишний шаг при сборке проекта во время разработки. Это похоже на использование TypeScript в качестве умного линтера, а не языка программирования. Мне даже не надо добавлять его в зависимости своего проекта. Я просто включаю проверку типов как простую функцию редактора и это позволяет мне лучше писать код.</p>	0	1	2017-10-14 12:27:13.765938+06	2017-10-14 12:27:13.765978+06
7	Server side rendering на Vue.js	<h1>&nbsp;</h1>\r\n\r\n<p>Сравнительно недавно Vue.js обзавёлся полноценной поддержкой серверного рендеринга. В интернете довольно мало информации о том, как его правильно готовить, так что я решил подробно описать процесс создания необходимой среды для разработки приложения с SSR на Vue.js.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Всё, о чём пойдёт речь, реализовано в&nbsp;<a href="https://github.com/mrTimofey/vue-ssr-starter">репозитории на github</a>. Я буду часто ссылаться на его исходники и, собственно, попытаюсь объяснить, что происходит и зачем это нужно :)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В статье будут описаны достаточно общие для SSR подходы (<em>если вам просто нужно что-то готовое для использования, то вы можете посмотреть в сторону&nbsp;<a href="https://nuxtjs.org/">Nuxt.js</a></em>), так что вполне вероятно, что сказанное ниже можно будет частично или полностью применить и к другим фреймворкам/библиотекам типа Angular и React.</p>\r\n\r\n<p><a name="habracut"></a></p>\r\n\r\n<p><em>Я не ставил цель сделать вольный пересказ&nbsp;<a href="https://ssr.vuejs.org/">официальной документации</a>, поэтому для полного понимания процесса лучше хотя бы поверхностно с ней ознакомиться.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Ведение</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Основная идея любого приложения с SSR в том, что оно должно генерировать одинаковую HTML-разметку при выполнении на сервере и на клиенте.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Данные, которые подставляются в HTML, должны быть вытянуты по API, расположенному на том же или на другом сервере/домене. Настройка и разработка API-сервера выходит за рамки этой статьи, а вот в качестве клиента для него можно взять&nbsp;<a href="https://github.com/axios/axios">axios</a>&nbsp;или любой другой изоморфный http-клиент.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Также нужно помнить о том, что на сервере нет DOM, так что все манипуляции с document, window и прочими navigator либо вообще не должны использоваться, либо должны быть запущены только на клиенте, то есть в хуках beforeMount, mounted и т.п.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Ниже будет много букв, где я пытаюсь разъяснить, что происходит в коде. Поэтому, если буквы покажутся вам сложно читаемыми, рекомендую сразу смотреть в код :) Ссылки на соответствующие части репозитория будут даны в каждом разделе.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Конфигурация Webpack</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://github.com/mrTimofey/vue-ssr-starter/tree/master/build/webpack">Код</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Сборка делится на 3 основных конфигурации webpack &mdash; общая, сборка для сервера и сборка для клиента. После сборки мы должны получать 2 независимых бандла с набором файлов для клиента и лишь одним js файлом для сервера.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Для каждого бандла, очевидно, нужно будет создать отдельные entry, но об этом чуть позже.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Общая сборка (base.js)</strong>&nbsp;включает в себя загрузчики для всей статики, шаблонов, исходников JavaScript и vue-компонентов. Стили сюда включить теоретически тоже можно, но на сервере по очевидным причинам они не нужны, поэтому они будут прописаны только для клиента.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Клиентская сборка (client.js)</strong>&nbsp;добавляет к общей то, что необходимо нам в браузере. В rules прописываются загрузчики для css, stylus, sass, postcss и т.п.<br />\r\nТакже сюда можно добавить output для разделения бандла на несколько файлов, extract css, uglify и т.д. В общем, всё как обычно :)<br />\r\nСюда же добавляем генерацию общего HTML шаблона с помощью html-webpack-plugin. На нём я отдельно остановлюсь чуть ниже.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Сборка для SSR (server.js)</strong>&nbsp;должна создавать единственный js-файл для отработки на сервере. Нас не заботит размер файла, так как его никто не будет загружать по http, поэтому всё, что обычно прописывается в конфигах для оптимизации, здесь не имеет смысла.<br />\r\nНужно также указать&nbsp;<code>target: node</code>, null-loader для стилей и externals. В externals указываются все пакеты из package.json, чтобы webpack не включал установленные пакеты в сборку, так как на сервере они будут подключены из node_modules.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>{\r\n    target: &#39;node&#39;,\r\n    externals: Object.keys(require(&#39;../../package.json&#39;).dependencies)\r\n}</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Общий шаблон приложения</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://github.com/mrTimofey/vue-ssr-starter/blob/master/src/layout.pug">Код</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Общий шаблон &mdash; это просто общая HTML-разметка, в которую будет вставлен отрендеренный код Vue приложения. Тут важно понимать, что сервер без специально обученных библиотек ничего не знает о DOM. Поэтому в шаблон нужно вписать некую строку, которая будет простой заменой подстроки заменена на разметку приложения. В примере это просто&nbsp;<code>&lt;!--APP--&gt;</code>&nbsp;(или&nbsp;<code>//APP</code>&nbsp;в pug), но она может быть любой другой.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Со скриптами, стилями и тегами в head немного проще &mdash; их мы с помощью той же замены будем вставлять перед&nbsp;<code>&lt;/body&gt;</code>/<code>&lt;/head&gt;</code>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Сборка и сервер</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Для работы SSR необходим сервер (express в примере) на Node.js, который также будет заниматься сборкой проекта на лету во время разработки. Тут много кода, так что будет проще посмотреть примеры&nbsp;<a href="https://github.com/mrTimofey/vue-ssr-starter/blob/master/index.js">точки запуска сервера</a>&nbsp;и&nbsp;<a href="https://github.com/mrTimofey/vue-ssr-starter/blob/master/build/setup-dev-server.js">конфигурации сервера для разработки</a>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Несколько тонкостей:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Нужно подготовить общий шаблон таким образом, чтобы плагин vue-meta на клиенте понял, что разметка уже готова и не продублировал meta теги. Для этого нужно просто вставить специальный атрибут&nbsp;<code>data-vue-meta-server-rendered</code>&nbsp;без значения в тег&nbsp;<code>&lt;html&gt;</code>. Название атрибута&nbsp;<a href="https://github.com/declandewet/vue-meta#options">настраивается</a>, так что в вашем проекте оно может быть другим (я, например, решил заменить его на&nbsp;<code>data-meta-ssr</code>, так как это короче).</li>\r\n\t<li>Также в шаблон нужно подставить всё необходимое из плагина vue-meta: атрибуты для html и body, мета-теги, link, noscript и т.д&hellip; В простейшем варианте это происходит&nbsp;<a href="https://github.com/declandewet/vue-meta#step-22-populating-the-document-meta-info-with-inject">примерно так</a>:</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>// ...\r\nconst {\r\n  title, htmlAttrs, bodyAttrs, link, style, script, noscript, meta\r\n} = context.meta.inject()\r\nres.write(`\r\n  &lt;!doctype html&gt;\r\n  &lt;html data-vue-meta-server-rendered ${htmlAttrs.text()}&gt;\r\n    &lt;head&gt;\r\n      ${meta.text()}\r\n      ${title.text()}\r\n      ${link.text()}\r\n      ${style.text()}\r\n      ${script.text()}\r\n      ${noscript.text()}\r\n    &lt;/head&gt;\r\n    &lt;body ${bodyAttrs.text()}&gt;\r\n    ...\r\n`)\r\n// ...</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Для корректной обработки серверного бандла (который был предварительно собран с помощью webpack&#39;а) нужно использовать vue-server-renderer, которому нужно указать файл с бандлом и его кодировку.&nbsp;<a href="https://ssr.vuejs.org/en/api.html">Подробнее</a>&nbsp;о параметрах можно почитать в официальной документации. Там есть как минимум один интересный параметр runInNewContext, который позволит довольно неплохо оптимизировать рендеринг, но при соблюдении определённых правил (о чём речь пойдёт ниже, в разделе про точки входа).</li>\r\n\t<li>Так как все данные из API загружаются во время рендеринга, то нет необходимости загружать их повторно на клиенте. Но клиент, очевидно, не может просто вынуть их из разметки, поэтому необходимо передать ему данные&nbsp;<em>вместе</em>&nbsp;с разметкой. Решается эта задача максимально просто: в разметку добавляется script, где все нужные данные записываются в переменные. Сами данные обрабатываются&nbsp;<code>JSON.stringify</code>&nbsp;или, ещё лучше, с помощью&nbsp;<a href="https://github.com/yahoo/serialize-javascript">serialize-javascript</a>.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>const serialize = require(&#39;serialize-javascript&#39;)\r\n\r\n// ...\r\n\r\nres.write(`&lt;script&gt;\r\n    window.__INITIAL_VUEX_STATE__=${serialize(context.initialVuexState)}\r\n&lt;/script&gt;`);\r\n\r\nres.write(`&lt;script&gt;\r\n    window.__INITIAL_COMP_STATE__=${serialize(context.initialComponentStates)}\r\n&lt;/script&gt;`);</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Режим разработки</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В случае запуска сервера в режиме разработки сам сервер будет работать примерно так же. Отличаются лишь 2 момента &mdash; по-другому обрабатываются ошибки, возникшие при рендеринге, а так же подменяется renderer и разметка общего шаблона на новые при изменении кода приложения.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Помимо самого сервера нужно запустить&nbsp;<code>webpack(clientConfig).watch</code>&nbsp;для генерации сборки на лету при изменении исходников. Перед этим инициализируется webpack со всеми нужными для разработки плагинами типа HotModuleReplacementPlugin.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Также нужно сообщать клиенту о новых сборках бандла. Для этого понадобятся webpack-dev-middleware и webpack-hot-middleware. Они отвечают за доставку изменившегося кода клиенту при появлении новых сборок (то есть каждый раз, когда изменяется исходный код приложения).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Отдельно запускается&nbsp;<code>webpack(serverConfig).watch</code>&nbsp;и подменяется серверный бандл на новый при его изменении. В моём случае сообщаем о том, что он изменился, с помощью простого коллбэка (строка 50 в&nbsp;<code>build/setup-dev-server.js</code>, строка 73 в&nbsp;<code>index.js</code>).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Точки входа для приложения</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://github.com/mrTimofey/vue-ssr-starter/tree/master/src/entry">Код</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Как я упоминал выше, необходимо создать 2 отдельные входные точки (entry в webpack) приложения для SSR и для клиента. Собственно, здесь так же, как и в конфигах webpack &mdash; 3 файла с общим, серверным и клиентским кодом.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Общий код (app.js)</strong>&nbsp;включает общую инициализацию приложения, то есть подключает Vue-плагины, создаёт vuex store, router и новый root-компонент. Также здесь регистрируются глобальные компоненты, фильтры и директивы.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Здесь же root-компоненту нужно подмешать vue-файл с шаблоном и логикой уже самого приложения, чтобы главный компонент приложения и root-компонент стали одним целым.<br />\r\nВажно, что для vue-server-renderer есть опция runInNewContext, которую можно отключить, получив при этом неплохой прирост производительности. Но для его использования необходимо каждый раз снова инициализировать приложение, поэтому в app.js я возвращаю функцию, производящую инициализацию, а не готовый объект Vue-компонента. Код же, исполняемый непосредственно в этом файле, будет выполнен только один раз при запуске сервера, о чём необходимо помнить. Здесь можно регистрировать общие моменты, не зависящие от данных, получаемых в рантайме &mdash; регистрировать компоненты, фильтры, директивы, извлекать переменные окружения и т.д. и т.п.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Точка входа для клиента (client.js)</strong>. Здесь создаётся приложение с помощью функции из app.js, затем грузится и выполняется всё необходимое для корректной работы в браузере.<br />\r\nЗдесь же производится замена объекта data для компонента, который должен быть показан на данной странице и состояния vuex store.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>if (window.__INITIAL_VUEX_STATE__) {\r\n    // полностью заменяем state на возвращённый сервером\r\n    app.$store.replaceState(window.__INITIAL_VUEX_STATE__);\r\n    delete window.__INITIAL_VUEX_STATE__;\r\n}\r\n\r\nif (window.__INITIAL_COMP_STATE__) {\r\n    app.$router.onReady(() =&gt; {\r\n            // берём все компоненты, которые показываются на данной странице \r\n            // (почти всегда это единственный компонент, но мало ли)...\r\n        const comps = app.$router.getMatchedComponents()\r\n            // ...забираем только те, у которых есть данные для предзагрузки\r\n            .filter(comp =&gt; typeof comp.prefetch === &#39;function&#39;);\r\n        for (let i in comps)\r\n            if (window.__INITIAL_COMP_STATE__[i])\r\n                // собственно, записываем данные для data\r\n                // (сама подмена $data будет происходить в специальном миксине, о нём речь пойдёт ниже)\r\n                comps[i].prefetchedData = window.__INITIAL_COMP_STATE__[i];\r\n        delete window.__INITIAL_COMP_STATE__;\r\n    });\r\n}</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Завершаем код тем, что берём root-компонент и вызываем у него&nbsp;<code>$mount</code>&nbsp;в корневой элемент приложения. Этому элементу будет автоматически дан атрибут&nbsp;<code>data-server-rendered</code>, поэтому можно сделать так:&nbsp;<code>app.$mount(document.body.querySelector(&#39;[data-server-rendered]&#39;))</code>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Точка входа для SSR (server.js)</strong>. Здесь просто создаётся функция, которая будет принимать контекст запроса (то есть объект request из express) и инициализировать приложение. Функция должна вернуть promise, который будет выполнен в тот момент, когда все необходимые данные загружены из API, а приложение будет готово к отправке клиенту.<br />\r\nПорядок действий в этой функций может быть таким (<a href="https://github.com/mrTimofey/vue-ssr-starter/blob/master/src/entry/server.js">код</a>):</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n\t<li>Создаём приложение из app.js.</li>\r\n\t<li>Настраиваем baseUrl в axios таким образом, чтобы он мог обратиться к серверу API локально (при необходимости). Здесь просто нужно помнить, что браузера нет, а значит и нет объекта location, из которого можно хотя бы взять домен и протокол, так что это нужно будет прописать вручную.</li>\r\n\t<li>Задаём обработчик для vue-router ready (<code>app.$router.onReady(...)</code>), который будет выполнен при нахождении соответствия компонентов и URL:\r\n\t<ol>\r\n\t\t<li>Берём все асинхронные компоненты для данной страницы и выполняем их функции для вытягивания асинхронных данных. Собираем возращённые промисы в массив.</li>\r\n\t\t<li>Ждём выполнения всех промисов в&nbsp;<code>Promise.all</code>.</li>\r\n\t\t<li>Резолвим, добавляя к контексту информацию из vue-meta, vuex state, а так же записываем в компоненты и в контекст данные, полученные в результате выполнения асинхронных операций.</li>\r\n\t</ol>\r\n\t</li>\r\n\t<li>Говорим роутеру, что пришло время обработать URL из контекста (<code>app.$router.push(context.url)</code>).</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Далее все полученные данные будут обработаны http-сервером, компоненты отдадут свою разметку, данные с разметкой будут записаны в шаблон, получившийся HTML отправится клиенту.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Компоненты и роутинг</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://github.com/mrTimofey/vue-ssr-starter/blob/master/src/router.js">Код</a>&nbsp;для регистрации роутера и компонентов для него.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Для разработки приложения с SSR нужно исходить из того, что&nbsp;<strong>только</strong>&nbsp;root-компонент или компоненты, которые привязаны к роутам, имеют возможность асинхронно загрузить данные перед рендерингом. Для этих компонентов специальным образом нужно обрабатывать изменения роута и записывать данные, которые вернул сервер после рендеринга. Для этих целей хорошим решением будет создать mixin, который автоматически подключается к каждому компоненту при инициализации роутера.&nbsp;<a href="https://github.com/mrTimofey/vue-ssr-starter/blob/master/src/mixins/prefetch.js">Пример кода</a>&nbsp;подобного mixin&#39;а.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В prefetch-mixin нужно добавить примерно следующее:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>created-хук, который будет брать поле prefetchData (при инициализации приложения в это поле пишется data компонента, пришедшая с сервера после рендеринга или просто записанная напрямую во время рендеринга на сервере) и полностью заменять значения полей&nbsp;<code>this.$data</code>&nbsp;на значения из&nbsp;<code>this.constructor.extendOptions.prefetchData</code>, но только&nbsp;<strong>до того</strong>, как приложение уже полностью инициализировано, что мы можем выяснить из поля&nbsp;<code>this.$root._isMounted</code>.</li>\r\n\t<li>beforeMount-хук будет вызывать prefetch только на клиенте уже после загрузки страницы в том случае, если произошёл переход на другой роут.</li>\r\n\t<li>beforeRouteUpdate-хук будет вызывать prefetch только на клиенте при изменении параметров роута.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>function update(vm, next, route) {\r\n    if (!route) route = vm.$route;\r\n    const promise = vm.$options.prefetch({\r\n        store: vm.$store,\r\n        props: route.params,\r\n        route\r\n    });\r\n    if (!promise) return next ? next() : undefined;\r\n    promise\r\n        .then(data =&gt; {\r\n            Object.assign(vm.$data, data);\r\n            if (next) next();\r\n        })\r\n        .catch(err =&gt; next &amp;&amp; next(err));\r\n}\r\n\r\nconst mixin = {\r\n    // подмешиваем данные компонента при первичной загрузке страницы\r\n    created() {\r\n        if (this.$root._isMounted || !this.constructor.extendOptions.prefetchedData) return;\r\n        Object.assign(this.$data, this.constructor.extendOptions.prefetchedData);\r\n    },\r\n    // вызываем prefetch при загрузке компонента (но не делаем ничего, если данные уже подмешаны в created)\r\n    beforeMount() {\r\n        if (this.$root._isMounted &amp;&amp; this.$options.prefetch) update(this);\r\n    }\r\n    // вызываем prefetch, если изменился параметр роута\r\n    // в этом случае компонент не будет проинициализирован заново, так что beforeMount вызван не будет\r\n    beforeRouteUpdate(to, from, next) {\r\n        if (this.$options.prefetch &amp;&amp; to.path !== from.path) update(this, next, to);\r\n        else next();\r\n    },\r\n};</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Дальнейшая разработка</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>SSR не накладывает почти никаких ограничений на разработку приложений. Достаточно просто помнить о том, что нельзя использовать браузерное API там, где код выполняется на сервере, в остальных же случаях выносить код в клиентские хуки beforeMount/mounted.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Также приложение, созданное для работы с SSR, будет корректно работать и без SSR, так что подобный подход можно использовать для обычных SPA, чтобы при внезапном появлении требований к SEO не ломать голову и не писать костыли для оптимизации ваших сайтов.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Могут быть проблемы с директивами, роль которых часто сводится к манипуляции с DOM, но их легко решить, отдавая альтернативную реализацию (пустую?) вместо самой директивы на сервере (<a href="https://github.com/vuejs/vue-ssr-docs/blob/master/en/universal.md#custom-directives">docs</a>).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В общем и целом это всё, что необходимо учесть перед началом разработки самого приложения. Дальше вы просто создаёте компоненты, подключаете компоненты-страницы к соответствующим роутам и, если всё сделано правильно, будете получать срендеренную страницу с сервера и корректно работающее приложение на клиенте.</p>	0	1	2017-10-14 12:28:28.857927+06	2017-10-14 12:28:28.857969+06
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('articles_id_seq', 7, true);


--
-- Data for Name: articles_tags; Type: TABLE DATA; Schema: public; Owner: root
--

COPY articles_tags (id, article_id, tag_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	2	5
6	3	6
7	3	7
8	4	8
9	4	3
10	5	9
11	5	10
12	5	3
13	6	3
14	6	9
15	6	11
16	7	9
17	7	3
18	7	12
19	7	13
\.


--
-- Name: articles_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('articles_tags_id_seq', 19, true);


--
-- Data for Name: articles_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY articles_user (id, date, article_id, user_id) FROM stdin;
\.


--
-- Name: articles_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('articles_user_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add source	6	add_source
17	Can change source	6	change_source
18	Can delete source	6	delete_source
19	Can add thumbnail dimensions	7	add_thumbnaildimensions
20	Can change thumbnail dimensions	7	change_thumbnaildimensions
21	Can delete thumbnail dimensions	7	delete_thumbnaildimensions
22	Can add thumbnail	8	add_thumbnail
23	Can change thumbnail	8	change_thumbnail
24	Can delete thumbnail	8	delete_thumbnail
25	Can add like user	9	add_likeuser
26	Can change like user	9	change_likeuser
27	Can delete like user	9	delete_likeuser
28	Can add Статья	10	add_article
29	Can change Статья	10	change_article
30	Can delete Статья	10	delete_article
31	Can add Комментарий	11	add_comment
32	Can change Комментарий	11	change_comment
33	Can delete Комментарий	11	delete_comment
34	Can add Тег	12	add_tag
35	Can change Тег	12	change_tag
36	Can delete Тег	12	delete_tag
37	Can add Пользователь	13	add_customuser
38	Can change Пользователь	13	change_customuser
39	Can delete Пользователь	13	delete_customuser
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY comments (id, text, date, article_id, user_id) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: customuser_customuser; Type: TABLE DATA; Schema: public; Owner: root
--

COPY customuser_customuser (id, password, last_login, is_superuser, email, avatar, firstname, lastname, middlename, date_of_birth, register_date, gender, is_active, is_admin) FROM stdin;
1	pbkdf2_sha256$30000$g9MCvQvNTe1X$6anyJAyfq0Xv7vA8uiobfEt90fV3p2pmEM98oRbeeNs=	2017-10-14 12:20:28.335124+06	t	admin@gmail.com	userprofile/avatars/admin@gmail.com/None-None.png	Admin	A		1995-01-01	2017-10-14	t	t	t
2	pbkdf2_sha256$30000$Ee5jaeBngwvS$LXT47PFSeyXBcMLMnaz0hScLUQL2SLzUVVPAHYCoP1w=	2017-10-14 12:31:50.560678+06	f	chloe@gmail.com	userprofile/avatars/chloe@gmail.com/Chloe-Moretz.jpg	Chloe	Moretz		1997-02-10	2017-10-14	f	t	f
3	pbkdf2_sha256$30000$B96iuU64Zlms$dDyam9YsisKF0sKYGW4Z9RPpiRxQw8ik8I+qOuvOgpc=	2017-10-14 12:33:24.201826+06	f	jack-sparrow@gmail.com	userprofile/avatars/jack-sparrow@gmail.com/Jack-Sparrow.jpg	Jack	Sparrow		1995-07-01	2017-10-14	t	t	f
\.


--
-- Data for Name: customuser_customuser_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY customuser_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Name: customuser_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('customuser_customuser_groups_id_seq', 1, false);


--
-- Name: customuser_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('customuser_customuser_id_seq', 3, true);


--
-- Data for Name: customuser_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY customuser_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Name: customuser_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('customuser_customuser_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-10-14 12:22:51.447761+06	1	компиляторы	1	[{"added": {}}]	12	1
2	2017-10-14 12:22:57.672428+06	2	c++	1	[{"added": {}}]	12	1
3	2017-10-14 12:23:04.187699+06	1	C++17	1	[{"added": {}}]	10	1
4	2017-10-14 12:23:52.259862+06	3	Разработка	1	[{"added": {}}]	12	1
5	2017-10-14 12:23:58.374492+06	4	python	1	[{"added": {}}]	12	1
6	2017-10-14 12:24:01.845526+06	5	go	1	[{"added": {}}]	12	1
7	2017-10-14 12:24:04.958292+06	2	AMA. Avito. Backend	1	[{"added": {}}]	10	1
8	2017-10-14 12:24:56.911514+06	6	kubernetes	1	[{"added": {}}]	12	1
9	2017-10-14 12:25:00.303028+06	7	docker	1	[{"added": {}}]	12	1
10	2017-10-14 12:25:02.908492+06	3	CRI-O — альтернатива Docker для запуска контейнеров в Kubernetes	1	[{"added": {}}]	10	1
11	2017-10-14 12:25:35.383029+06	8	архитектура	1	[{"added": {}}]	12	1
12	2017-10-14 12:25:41.176752+06	4	Существует ли идеальный планировщик личных задач? Разработка модульного планировщика	1	[{"added": {}}]	10	1
13	2017-10-14 12:26:27.865852+06	9	javascript	1	[{"added": {}}]	12	1
14	2017-10-14 12:26:32.541442+06	10	react	1	[{"added": {}}]	12	1
15	2017-10-14 12:26:36.250869+06	5	React, встроенные функции и производительность	1	[{"added": {}}]	10	1
16	2017-10-14 12:27:09.093822+06	11	typescript	1	[{"added": {}}]	12	1
17	2017-10-14 12:27:13.775927+06	6	Использование преимуществ TypeScript в JavaScript разработке	1	[{"added": {}}]	10	1
18	2017-10-14 12:28:20.42227+06	12	nodejs	1	[{"added": {}}]	12	1
19	2017-10-14 12:28:25.409544+06	13	vue.js	1	[{"added": {}}]	12	1
20	2017-10-14 12:28:28.868082+06	7	Server side rendering на Vue.js	1	[{"added": {}}]	10	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 20, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	easy_thumbnails	source
7	easy_thumbnails	thumbnaildimensions
8	easy_thumbnails	thumbnail
9	article	likeuser
10	article	article
11	article	comment
12	article	tag
13	customuser	customuser
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-10-14 12:09:40.733589+06
2	contenttypes	0002_remove_content_type_name	2017-10-14 12:09:40.767312+06
3	auth	0001_initial	2017-10-14 12:09:41.408804+06
4	auth	0002_alter_permission_name_max_length	2017-10-14 12:09:41.441513+06
5	auth	0003_alter_user_email_max_length	2017-10-14 12:09:41.466056+06
6	auth	0004_alter_user_username_opts	2017-10-14 12:09:41.483381+06
7	auth	0005_alter_user_last_login_null	2017-10-14 12:09:41.508009+06
8	auth	0006_require_contenttypes_0002	2017-10-14 12:09:41.51813+06
9	auth	0007_alter_validators_add_error_messages	2017-10-14 12:09:41.537781+06
10	auth	0008_alter_user_username_max_length	2017-10-14 12:09:41.56137+06
11	customuser	0001_initial	2017-10-14 12:09:42.19191+06
12	admin	0001_initial	2017-10-14 12:09:42.445513+06
13	admin	0002_logentry_remove_auto_add	2017-10-14 12:09:42.488855+06
14	article	0001_initial	2017-10-14 12:09:42.942391+06
15	article	0002_auto_20160911_1320	2017-10-14 12:09:43.499918+06
16	article	0003_article_author	2017-10-14 12:09:43.689562+06
17	article	0004_auto_20160913_1545	2017-10-14 12:09:43.738265+06
18	article	0005_auto_20160915_1430	2017-10-14 12:09:44.24095+06
19	easy_thumbnails	0001_initial	2017-10-14 12:09:44.95624+06
20	easy_thumbnails	0002_thumbnaildimensions	2017-10-14 12:09:45.088563+06
21	sessions	0001_initial	2017-10-14 12:09:45.297889+06
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_migrations_id_seq', 21, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: root
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	userprofile/avatars/admin@gmail.com/None-None.png	2017-10-14 12:30:40.306701+06
2	f9bde26a1556cd667f742bd34ec7c55e	userprofile/avatars/chloe@gmail.com/Chloe-Moretz.jpg	2017-10-14 12:32:34.541937+06
3	f9bde26a1556cd667f742bd34ec7c55e	userprofile/avatars/jack-sparrow@gmail.com/Jack-Sparrow.jpg	2017-10-14 12:34:10.725911+06
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 3, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: root
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	d26becbf46ac48eda79c7a39a13a02dd	userprofile/avatars/admin@gmail.com/None-None.png.22x22_q85_crop.png	2017-10-14 12:30:40.249866+06	1
2	d26becbf46ac48eda79c7a39a13a02dd	userprofile/avatars/admin@gmail.com/None-None.png.300x300_q85_crop.png	2017-10-14 12:30:40.315832+06	1
3	d26becbf46ac48eda79c7a39a13a02dd	userprofile/avatars/chloe@gmail.com/Chloe-Moretz.jpg.22x22_q85_crop.jpg	2017-10-14 12:32:34.491627+06	2
4	d26becbf46ac48eda79c7a39a13a02dd	userprofile/avatars/chloe@gmail.com/Chloe-Moretz.jpg.300x300_q85_crop.jpg	2017-10-14 12:32:34.557658+06	2
5	d26becbf46ac48eda79c7a39a13a02dd	userprofile/avatars/jack-sparrow@gmail.com/Jack-Sparrow.jpg.22x22_q85_crop.jpg	2017-10-14 12:34:10.58612+06	3
6	d26becbf46ac48eda79c7a39a13a02dd	userprofile/avatars/jack-sparrow@gmail.com/Jack-Sparrow.jpg.300x300_q85_crop.jpg	2017-10-14 12:34:10.740193+06	3
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 6, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: root
--

COPY tags (id, tag_name) FROM stdin;
1	компиляторы
2	c++
3	Разработка
4	python
5	go
6	kubernetes
7	docker
8	архитектура
9	javascript
10	react
11	typescript
12	nodejs
13	vue.js
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('tags_id_seq', 13, true);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: articles_tags_article_id_38ed5cdf_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY articles_tags
    ADD CONSTRAINT articles_tags_article_id_38ed5cdf_uniq UNIQUE (article_id, tag_id);


--
-- Name: articles_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY articles_tags
    ADD CONSTRAINT articles_tags_pkey PRIMARY KEY (id);


--
-- Name: articles_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY articles_user
    ADD CONSTRAINT articles_user_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: customuser_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY customuser_customuser
    ADD CONSTRAINT customuser_customuser_email_key UNIQUE (email);


--
-- Name: customuser_customuser_groups_customuser_id_7ec7129f_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY customuser_customuser_groups
    ADD CONSTRAINT customuser_customuser_groups_customuser_id_7ec7129f_uniq UNIQUE (customuser_id, group_id);


--
-- Name: customuser_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY customuser_customuser_groups
    ADD CONSTRAINT customuser_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: customuser_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY customuser_customuser
    ADD CONSTRAINT customuser_customuser_pkey PRIMARY KEY (id);


--
-- Name: customuser_customuser_user_permissi_customuser_id_0e00e604_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY customuser_customuser_user_permissions
    ADD CONSTRAINT customuser_customuser_user_permissi_customuser_id_0e00e604_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: customuser_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY customuser_customuser_user_permissions
    ADD CONSTRAINT customuser_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: articles_4f331e2f; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX articles_4f331e2f ON articles USING btree (author_id);


--
-- Name: articles_tags_76f094bc; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX articles_tags_76f094bc ON articles_tags USING btree (tag_id);


--
-- Name: articles_tags_a00c1b00; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX articles_tags_a00c1b00 ON articles_tags USING btree (article_id);


--
-- Name: articles_user_a00c1b00; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX articles_user_a00c1b00 ON articles_user USING btree (article_id);


--
-- Name: articles_user_e8701ad4; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX articles_user_e8701ad4 ON articles_user USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: comments_a00c1b00; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX comments_a00c1b00 ON comments USING btree (article_id);


--
-- Name: comments_e8701ad4; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX comments_e8701ad4 ON comments USING btree (user_id);


--
-- Name: customuser_customuser_email_b6d92bd7_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX customuser_customuser_email_b6d92bd7_like ON customuser_customuser USING btree (email varchar_pattern_ops);


--
-- Name: customuser_customuser_groups_0e939a4f; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX customuser_customuser_groups_0e939a4f ON customuser_customuser_groups USING btree (group_id);


--
-- Name: customuser_customuser_groups_721e74b0; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX customuser_customuser_groups_721e74b0 ON customuser_customuser_groups USING btree (customuser_id);


--
-- Name: customuser_customuser_user_permissions_721e74b0; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX customuser_customuser_user_permissions_721e74b0 ON customuser_customuser_user_permissions USING btree (customuser_id);


--
-- Name: customuser_customuser_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX customuser_customuser_user_permissions_8373b171 ON customuser_customuser_user_permissions USING btree (permission_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: articles_author_id_e11be98a_fk_customuser_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_author_id_e11be98a_fk_customuser_customuser_id FOREIGN KEY (author_id) REFERENCES customuser_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_tags_article_id_159c6e09_fk_articles_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles_tags
    ADD CONSTRAINT articles_tags_article_id_159c6e09_fk_articles_id FOREIGN KEY (article_id) REFERENCES articles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_tags_tag_id_5bc358e6_fk_tags_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles_tags
    ADD CONSTRAINT articles_tags_tag_id_5bc358e6_fk_tags_id FOREIGN KEY (tag_id) REFERENCES tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_user_article_id_e546086e_fk_articles_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles_user
    ADD CONSTRAINT articles_user_article_id_e546086e_fk_articles_id FOREIGN KEY (article_id) REFERENCES articles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_user_user_id_1ca91205_fk_customuser_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY articles_user
    ADD CONSTRAINT articles_user_user_id_1ca91205_fk_customuser_customuser_id FOREIGN KEY (user_id) REFERENCES customuser_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comments_article_id_6bd701a2_fk_articles_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_article_id_6bd701a2_fk_articles_id FOREIGN KEY (article_id) REFERENCES articles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comments_user_id_b8fd0b64_fk_customuser_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_user_id_b8fd0b64_fk_customuser_customuser_id FOREIGN KEY (user_id) REFERENCES customuser_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_c_customuser_id_01c8f09a_fk_customuser_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customuser_customuser_user_permissions
    ADD CONSTRAINT customuser_c_customuser_id_01c8f09a_fk_customuser_customuser_id FOREIGN KEY (customuser_id) REFERENCES customuser_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_c_customuser_id_d6d8651b_fk_customuser_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customuser_customuser_groups
    ADD CONSTRAINT customuser_c_customuser_id_d6d8651b_fk_customuser_customuser_id FOREIGN KEY (customuser_id) REFERENCES customuser_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_customu_permission_id_8466901b_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customuser_customuser_user_permissions
    ADD CONSTRAINT customuser_customu_permission_id_8466901b_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_customuser_groups_group_id_8b5a141f_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customuser_customuser_groups
    ADD CONSTRAINT customuser_customuser_groups_group_id_8b5a141f_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_customuser_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_customuser_customuser_id FOREIGN KEY (user_id) REFERENCES customuser_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

