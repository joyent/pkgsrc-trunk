# $NetBSD: mysql.buildlink3.mk,v 1.27 2020/05/23 07:35:56 adam Exp $
#
# This file is included by packages that require some version of the
# MySQL database client.
#
# User-settable variables:
#
# MYSQL_VERSION_DEFAULT
#	The preferred MySQL version.
#
#	Possible: 80 57 56 73-cluster
#		  mariadb100 mariadb55
#		  percona80 percona57 percona56
#		  percona80-cluster percona57-cluster percona56-cluster
#	Default: 57
#
# Package-settable variables:
#
# MYSQL_VERSIONS_ACCEPTED
#	The list of MySQL versions that the package accepts.
#
#	Possible: (see MYSQL_VERSION_DEFAULT)
#	Default: (all)
#
# === Variables defined by this file ===
#
# MYSQL_VERSION
#	The MySQL version that is actually used.
#
#	Possible: (see MYSQL_VERSION_DEFAULT)
#
# MYSQL_PKG_PREFIX
# 	The package name prefix for the selected version.
#
# 	Possible: mysql80 mysql57 mysql56 mysql73-cluster
# 		  percona80 percona57 percona56
# 		  percona80-cluster percona57-cluster percona56-cluster
#

.if !defined(MYSQL_VERSION_MK)
MYSQL_VERSION_MK=	# defined

BUILD_DEFS+=		MYSQL_VERSION_DEFAULT
BUILD_DEFS_EFFECTS+=	MYSQL_PKGSRCDIR

_VARGROUPS+=		mysql
_USER_VARS.mysql=	MYSQL_VERSION_DEFAULT
_PKG_VARS.mysql=	MYSQL_VERSIONS_ACCEPTED
_SYS_VARS.mysql=	MYSQL_VERSION MYSQL_PKG_PREFIX

.include "bsd.fast.prefs.mk"

MYSQL_VERSION_DEFAULT?=		57
BUILD_DEFS+=			MYSQL_VERSION_DEFAULT
BUILD_DEFS_EFFECTS+=		MYSQL_VERSION MYSQL_PKG_PREFIX

# The available MySQL packages:
_PKG_MYSQLS=			80 57 56 mariadb100 mariadb55
_PKG_MYSQLS+=			57-cluster
_PKG_MYSQLS+=			percona80 percona57 percona56
_PKG_MYSQLS+=			percona80-cluster percona57-cluster percona56-cluster

# Package-settable variables.   XXX: 57 hardcoded duplicate to avoid pkglint errors
MYSQL_VERSIONS_ACCEPTED?=	57 ${_PKG_MYSQLS:N*55*}

_MYSQL_PKGBASE.57-cluster=	mysql-cluster-7.3.*
_MYSQL_PKGSRCDIR.57-cluster=	../../joyent/mysql73-cluster
_MYSQL_PKG_PREFIX.57-cluster=	mysql73-cluster

_MYSQL_PKGBASE.80=		mysql-client-8.0.*
_MYSQL_PKGSRCDIR.80=		../../databases/mysql80-client
_MYSQL_PKG_PREFIX.80=		mysql80

_MYSQL_PKGBASE.57=		mysql-client-5.7.*
_MYSQL_PKGSRCDIR.57=		../../databases/mysql57-client
_MYSQL_PKG_PREFIX.57=		mysql57

_MYSQL_PKGBASE.56=		mysql-client-5.6.*
_MYSQL_PKGSRCDIR.56=		../../databases/mysql56-client
_MYSQL_PKG_PREFIX.56=		mysql56

_MYSQL_PKGBASE.mariadb55=	mariadb-client-5.5.*
_MYSQL_PKGSRCDIR.mariadb55=	../../databases/mariadb55-client
_MYSQL_PKG_PREFIX.mariadb55=	mariadb55

_MYSQL_PKGBASE.mariadb100=	mariadb-client-10.0.*
_MYSQL_PKGSRCDIR.mariadb100=	../../joyent/mariadb100-client
_MYSQL_PKG_PREFIX.mariadb100=	mariadb100

_MYSQL_PKGBASE.percona80=	percona-client-8.0.*
_MYSQL_PKGSRCDIR.percona80=	../../joyent/percona80-client
_MYSQL_PKG_PREFIX.percona80=	percona80

_MYSQL_PKGBASE.percona57=	percona-client-5.7.*
_MYSQL_PKGSRCDIR.percona57=	../../joyent/percona57-client
_MYSQL_PKG_PREFIX.percona57=	percona57

_MYSQL_PKGBASE.percona56=	percona-client-5.6.*
_MYSQL_PKGSRCDIR.percona56=	../../joyent/percona56-client
_MYSQL_PKG_PREFIX.percona56=	percona56

_MYSQL_PKGBASE.percona56-cluster=	percona-cluster-5.6.*
_MYSQL_PKGSRCDIR.percona56-cluster=	../../joyent/percona56-cluster
_MYSQL_PKG_PREFIX.percona56-cluster=	percona56-cluster

_MYSQL_PKGBASE.percona57-cluster=	percona-cluster-5.7.*
_MYSQL_PKGSRCDIR.percona57-cluster=	../../joyent/percona57-cluster
_MYSQL_PKG_PREFIX.percona57-cluster=	percona57-cluster

_MYSQL_PKGBASE.percona80-cluster=	percona-cluster-8.0.*
_MYSQL_PKGSRCDIR.percona80-cluster=	../../joyent/percona80-cluster
_MYSQL_PKG_PREFIX.percona80-cluster=	percona80-cluster

#
# Sanity checks
#
.if empty(_PKG_MYSQLS:M${MYSQL_VERSION_DEFAULT})
PKG_FAIL_REASON+=	"[mysql.buildlink3.mk] Invalid mysql package \""${MYSQL_VERSION_DEFAULT:Q}"\" in MYSQL_VERSION_DEFAULT."
.endif

.for _myver_ in ${MYSQL_VERSIONS_ACCEPTED}
.  if empty(_PKG_MYSQLS:M${_myver_})
PKG_FAIL_REASON+=		"[mysql.buildlink3.mk] Invalid mysql package \""${_myver_:Q}"\" in MYSQL_VERSIONS_ACCEPTED."
MYSQL_VERSIONS_ACCEPTED=	# none
.  endif
.endfor

#
# Mark the acceptable versions and check which packages are installed.
#
.for _myver_ in ${MYSQL_VERSIONS_ACCEPTED}
_MYSQL_OK.${_myver_}=	yes
_MYSQL_INSTALLED.${_myver_}!=					\
	if ${PKG_INFO} -qe ${_MYSQL_PKGBASE.${_myver_}:Q}; then	\
		${ECHO} yes;					\
	else							\
		${ECHO} no;					\
	fi
.endfor
.for _myver_ in ${_PKG_MYSQLS}
_MYSQL_OK.${_myver_}?=	no
.endfor

# If a version is explicitely required, take it...
.if defined(MYSQL_VERSION_REQD)
MYSQL_VERSION=		${MYSQL_VERSION_REQD}
.endif

# ...otherwise use one of the installed MySQL packages...
.if !defined(MYSQL_VERSION)
.  for _myver_ in ${MYSQL_VERSIONS_ACCEPTED}
.    if ${_MYSQL_INSTALLED.${_myver_}} == "yes"
MYSQL_VERSION?=		${_myver_}
.    endif
.  endfor
.endif

# ...otherwise prefer the default one if it is accepted...
.if !defined(MYSQL_VERSION)
.  if defined(_MYSQL_OK.${MYSQL_VERSION_DEFAULT}) && \
    ${_MYSQL_OK.${MYSQL_VERSION_DEFAULT}} == "yes"
MYSQL_VERSION?=		${MYSQL_VERSION_DEFAULT}
.  endif
.endif

# ...otherwise just use the first default accepted.
.if !defined(MYSQL_VERSION)
.  for _myver_ in ${MYSQL_VERSIONS_ACCEPTED}
MYSQL_VERSION?=		${_myver_}
.  endfor
.endif

.if defined(MYSQL_VERSION)
.  include "${_MYSQL_PKGSRCDIR.${MYSQL_VERSION}}/buildlink3.mk"
.else
PKG_FAIL_REASON+=	"[mysql.buildlink3.mk] No acceptable mysql version found."
MYSQL_VERSION=		none
.endif

MYSQL_PKG_PREFIX=	${_MYSQL_PKG_PREFIX.${MYSQL_VERSION}}

# Variable assignment for multi-mysql packages
MULTI+=		MYSQL_VERSION=${MYSQL_VERSION}

.endif	# MYSQL_VERSION_MK
