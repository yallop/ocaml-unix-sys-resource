(*
 * Copyright (c) 2016 David Sheets <sheets@alum.mit.edu>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

module Resource : sig
  type t = CORE | CPU | DATA | FSIZE | NOFILE | STACK | AS

  type defns = {
    core   : int;
    cpu    : int;
    data   : int;
    fsize  : int;
    nofile : int;
    stack  : int;
    as_    : int;
  }

  module Host : sig
    type t

    val of_defns : defns -> t
    val to_defns : t -> defns
  end

  val to_string : t -> string

  val to_code : host:Host.t -> t -> int

  module Limit : sig
    type t = Limit of int | Infinity

    val min : t -> t -> t

    val to_string : t -> string
  end
end

module Host : sig
  type t = {
    resource : Resource.Host.t;
  }
end