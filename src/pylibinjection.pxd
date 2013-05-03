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


cdef extern from "sqlparse.h":
    ctypedef struct c_stoken_t "stoken_t":
       char _type
       char val[32]

    ctypedef struct c_sfilter "sfilter":
        const_char_ptr  s
        size_t          slen
        size_t          pos
        bint            in_comment

        c_stoken_t      syntax_current
        c_stoken_t      syntax_last
        c_stoken_t      syntax_comment

        c_stoken_t      fold_current
        c_stoken_t      fold_last
        int             fold_state

        c_stoken_t      tokenvec[5]
        char            pat[6]
        char            delim
        int             reason

    ctypedef bint (*ptr_fingerprints_fn)(const_char_ptr)

    bint is_sqli(c_sfilter *, const_char_ptr, size_t, ptr_fingerprints_fn)
