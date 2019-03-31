/*==============================================================*/
/* Nom de SGBD :  Microsoft SQL Server 2008                     */
/* Date de création :  22/03/2019 17:19:50                      */
/*==============================================================*/


if exists (select 1
            from  sysindexes
           where  id    = object_id('AYANTDROIT')
            and   name  = 'CREATION_FK'
            and   indid > 0
            and   indid < 255)
   drop index AYANTDROIT.CREATION_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AYANTDROIT')
            and   name  = 'AVOIR_FK'
            and   indid > 0
            and   indid < 255)
   drop index AYANTDROIT.AVOIR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AYANTDROIT')
            and   type = 'U')
   drop table AYANTDROIT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BIENS')
            and   type = 'U')
   drop table BIENS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CAS')
            and   name  = 'CREER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CAS.CREER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CAS')
            and   name  = 'SOURCECAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index CAS.SOURCECAS_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CAS')
            and   name  = 'CASHERITIER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CAS.CASHERITIER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CAS')
            and   type = 'U')
   drop table CAS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETTE')
            and   type = 'U')
   drop table DETTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ECOLE')
            and   type = 'U')
   drop table ECOLE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HERITAGE')
            and   name  = 'INCLURE_FK'
            and   indid > 0
            and   indid < 255)
   drop index HERITAGE.INCLURE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HERITAGE')
            and   name  = 'APPARTENIR_FK'
            and   indid > 0
            and   indid < 255)
   drop index HERITAGE.APPARTENIR_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HERITAGE')
            and   name  = 'BASER_FK'
            and   indid > 0
            and   indid < 255)
   drop index HERITAGE.BASER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HERITAGE')
            and   type = 'U')
   drop table HERITAGE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HERITIER')
            and   type = 'U')
   drop table HERITIER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REGLE')
            and   name  = 'SOURCEREGLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index REGLE.SOURCEREGLE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REGLE')
            and   name  = 'APPLIQUER_FK'
            and   indid > 0
            and   indid < 255)
   drop index REGLE.APPLIQUER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REGLE')
            and   type = 'U')
   drop table REGLE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SOURCE')
            and   name  = 'RENSEIGNER_FK'
            and   indid > 0
            and   indid < 255)
   drop index SOURCE.RENSEIGNER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SOURCE')
            and   type = 'U')
   drop table SOURCE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TYPEUSER')
            and   name  = 'TYPEUSER2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TYPEUSER.TYPEUSER2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TYPEUSER')
            and   name  = 'TYPEUSER_FK'
            and   indid > 0
            and   indid < 255)
   drop index TYPEUSER.TYPEUSER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TYPEUSER')
            and   type = 'U')
   drop table TYPEUSER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TYPEUTILISATEUR')
            and   type = 'U')
   drop table TYPEUTILISATEUR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UTILISATEUR')
            and   type = 'U')
   drop table UTILISATEUR
go

/*==============================================================*/
/* Table : AYANTDROIT                                           */
/*==============================================================*/
create table AYANTDROIT (
   AYANTDROITID         int                  not null,
   TYPEHERITIERID       int                  not null,
   USERID               int                  not null,
   PRENOM               text                 null,
   DATENAISS            datetime             not null,
   IMAGEADR             image                null,
   DESIGNATION          text                 null,
   DESCRIPTION          text                 null,
   DATECREATION         datetime             null,
   constraint PK_AYANTDROIT primary key nonclustered (AYANTDROITID)
)
go

/*==============================================================*/
/* Index : AVOIR_FK                                             */
/*==============================================================*/
create index AVOIR_FK on AYANTDROIT (
TYPEHERITIERID ASC
)
go

/*==============================================================*/
/* Index : CREATION_FK                                          */
/*==============================================================*/
create index CREATION_FK on AYANTDROIT (
USERID ASC
)
go

/*==============================================================*/
/* Table : BIENS                                                */
/*==============================================================*/
create table BIENS (
   BIENID               int                  not null,
   DESCRIPTION          text                 not null,
   MONTANT              money                not null,
   constraint PK_BIENS primary key nonclustered (BIENID)
)
go

/*==============================================================*/
/* Table : CAS                                                  */
/*==============================================================*/
create table CAS (
   CASID                int                  not null,
   TYPEHERITIERID       int                  not null,
   SOURCEID             int                  not null,
   USERID               int                  not null,
   NOM                  text                 null,
   DESCRIPTION          text                 null,
   constraint PK_CAS primary key nonclustered (CASID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ceux sont les cas soumis ',
   'user', @CurrentUser, 'table', 'CAS'
go

/*==============================================================*/
/* Index : CASHERITIER_FK                                       */
/*==============================================================*/
create index CASHERITIER_FK on CAS (
TYPEHERITIERID ASC
)
go

/*==============================================================*/
/* Index : SOURCECAS_FK                                         */
/*==============================================================*/
create index SOURCECAS_FK on CAS (
SOURCEID ASC
)
go

/*==============================================================*/
/* Index : CREER_FK                                             */
/*==============================================================*/
create index CREER_FK on CAS (
USERID ASC
)
go

/*==============================================================*/
/* Table : DETTE                                                */
/*==============================================================*/
create table DETTE (
   DETTEID              int                  not null,
   TYPEDETTE            text                 null,
   MONTANT              money                null,
   constraint PK_DETTE primary key nonclustered (DETTEID)
)
go

/*==============================================================*/
/* Table : ECOLE                                                */
/*==============================================================*/
create table ECOLE (
   ECOLEID              int                  not null,
   NOM                  text                 not null,
   DESCRIPTION          text                 null,
   constraint PK_ECOLE primary key nonclustered (ECOLEID)
)
go

/*==============================================================*/
/* Table : HERITAGE                                             */
/*==============================================================*/
create table HERITAGE (
   HERITAGEID           int                  not null,
   ECOLEID              int                  null,
   BIENID               int                  not null,
   DETTEID              int                  null,
   DESCRIPTION          text                 null,
   DATEDECES            datetime             not null,
   DATEHERITAGE         datetime             not null,
   MONTANT              money                not null,
   constraint PK_HERITAGE primary key nonclustered (HERITAGEID)
)
go

/*==============================================================*/
/* Index : BASER_FK                                             */
/*==============================================================*/
create index BASER_FK on HERITAGE (
ECOLEID ASC
)
go

/*==============================================================*/
/* Index : APPARTENIR_FK                                        */
/*==============================================================*/
create index APPARTENIR_FK on HERITAGE (
BIENID ASC
)
go

/*==============================================================*/
/* Index : INCLURE_FK                                           */
/*==============================================================*/
create index INCLURE_FK on HERITAGE (
DETTEID ASC
)
go

/*==============================================================*/
/* Table : HERITIER                                             */
/*==============================================================*/
create table HERITIER (
   TYPEHERITIERID       int                  not null,
   DESCRIPTION          text                 null,
   CODE                 int                  null,
   ILLUSTRATION         ntext                null,
   constraint PK_HERITIER primary key nonclustered (TYPEHERITIERID)
)
go

/*==============================================================*/
/* Table : REGLE                                                */
/*==============================================================*/
create table REGLE (
   REGLEID              int                  not null,
   ECOLEID              int                  not null,
   SOURCEID             int                  not null,
   DESCRIPTION          text                 null,
   COMMENTAIRE          text                 null,
   constraint PK_REGLE primary key nonclustered (REGLEID)
)
go

/*==============================================================*/
/* Index : APPLIQUER_FK                                         */
/*==============================================================*/
create index APPLIQUER_FK on REGLE (
ECOLEID ASC
)
go

/*==============================================================*/
/* Index : SOURCEREGLE_FK                                       */
/*==============================================================*/
create index SOURCEREGLE_FK on REGLE (
SOURCEID ASC
)
go

/*==============================================================*/
/* Table : SOURCE                                               */
/*==============================================================*/
create table SOURCE (
   SOURCEID             int                  not null,
   USERID               int                  not null,
   DESIGNATION          text                 not null,
   HIERARCHIEID         text                 null,
   COMMENTAIRE          text                 null,
   constraint PK_SOURCE primary key nonclustered (SOURCEID)
)
go

/*==============================================================*/
/* Index : RENSEIGNER_FK                                        */
/*==============================================================*/
create index RENSEIGNER_FK on SOURCE (
USERID ASC
)
go

/*==============================================================*/
/* Table : TYPEUSER                                             */
/*==============================================================*/
create table TYPEUSER (
   TYPEUSERID           int                  not null,
   USERID               int                  not null,
   constraint PK_TYPEUSER primary key (TYPEUSERID, USERID)
)
go

/*==============================================================*/
/* Index : TYPEUSER_FK                                          */
/*==============================================================*/
create index TYPEUSER_FK on TYPEUSER (
TYPEUSERID ASC
)
go

/*==============================================================*/
/* Index : TYPEUSER2_FK                                         */
/*==============================================================*/
create index TYPEUSER2_FK on TYPEUSER (
USERID ASC
)
go

/*==============================================================*/
/* Table : TYPEUTILISATEUR                                      */
/*==============================================================*/
create table TYPEUTILISATEUR (
   TYPEUSERID           int                  not null,
   NAME                 text                 not null,
   constraint PK_TYPEUTILISATEUR primary key nonclustered (TYPEUSERID)
)
go

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR (
   USERID               int                  not null,
   DESIGNATION          text                 null,
   EMAIL                text                 not null,
   LOGIN                text                 not null,
   PASSWORD             text                 not null,
   constraint PK_UTILISATEUR primary key nonclustered (USERID)
)
go

