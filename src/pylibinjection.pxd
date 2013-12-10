# pylibinjection.pxd
#
# Copyright(c) 2013 Angelo Dell'Aera <buffer@antifork.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA  02111-1307  USA


from libc.stdint cimport int16_t, int32_t, uint8_t, uint16_t, uint32_t
cimport cpython


cdef extern from *:
    ctypedef char* const_char_ptr "const char*"


cdef extern from "stdarg.h":
    ctypedef struct va_list:
        pass

    ctypedef struct fake_type:
        pass

    void  va_start(va_list, void *arg)
    void* va_arg(va_list, fake_type)
    void  va_end(va_list)

    fake_type void_ptr_type "void *"
    fake_type char_ptr_type "char *"
    fake_type int_type "int"


cdef extern from "stdlib.h":
    void free(void* )
    void *malloc(size_t)


cdef extern from "libinjection.h":
    ctypedef struct c_stoken_t "stoken_t":
        char    _type
        char    str_open
        char    str_close
        size_t  pos
        size_t  len
        int     count
        char    val[32]

    ctypedef struct c_sfilter "sfilter":
        const_char_ptr  s
        size_t          slen

        #ptr_lookup_fn  lookup
        #void*          userdata

        int             flags
        size_t          pos

        c_stoken_t      tokenvec[6]
        c_stoken_t      current
        char            fingerprint[6]

        int             reason
        int             stats_comment_ddw
        int             stats_comment_ddx
        int             stats_comment_c
        int             stats_comment_hash
        int             stats_folds
        int             stats_tokens

    ctypedef bint (*ptr_fingerprints_fn)(const_char_ptr)

    void libinjection_sqli_init(c_sfilter *,
                                const_char_ptr,
                                size_t,
                                int,
    )

    bint libinjection_is_sqli(c_sfilter *,
                              #const_char_ptr,
                              #size_t,
    )
    char libinjection_sqli_fingerprint(c_sfilter *,
                                       const_char_ptr,
                                       size_t,
                                       char,
                                       int
    )


cdef extern from "libinjection_sqli.h":
    bint libinjection_sqli_check_fingerprint(c_sfilter *)
