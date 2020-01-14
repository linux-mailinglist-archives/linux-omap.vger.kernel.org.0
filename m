Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEFC13A992
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 13:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgANMoz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 07:44:55 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38851 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgANMoz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jan 2020 07:44:55 -0500
Received: by mail-lj1-f194.google.com with SMTP id w1so14186122ljh.5
        for <linux-omap@vger.kernel.org>; Tue, 14 Jan 2020 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zIB15tFU30hx10Qk6h82Ry1jFuFvffmmVBEasMAi5ec=;
        b=rNHQF9Y9CnYv9TpY3gEfF7qE20yHf11EmXqDQJPq+HttV1xwvsacJRRz7rmF2ruVKg
         mmlU1ATKUZaM9/wBPUNEGDRXiHOmk0uMx6VdB+eaTEl+qAVzO5xeidnRMQg+kE4Hxrf0
         2ViyGAGV61lOBo1L6Yr+QIeiFaIAeGu8XO/5S7ED8dXKClB8+zciwfKoi6JGiYdavA0m
         827FOwC6rnwkcl1gYFls9SNwcizoLevtfWz0wBA7M5aME2ub9V3zZAf6jEpFQWQXhViP
         tnThbPtNUhlN4hNngB8nvhGSb062gOhdTG4MvuJthA1Bp2+yZUSNv9onSizbEK4e58+a
         ZHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zIB15tFU30hx10Qk6h82Ry1jFuFvffmmVBEasMAi5ec=;
        b=oHvzp5Di4p9xVPFohcWLmoNYMqFBZW9Uun0rdqot5d+n2vq8uvTA/OCbGOqsteMM0v
         DbbOdxkjYYiIfiOkQhDCtIniSRM2H9FpYxyaoa8zawwrAJWQPeVIPWRZsTSgt21HJL9S
         JQiMHSONhDkpbaaDIvAklgIJVnVjQOFY25OIxvxjzD5VjzbNGrXcBCxdDgf86g/OGbA5
         8vBPQ0J1Qgx5LKGBaRV9Beg126UtfaPTmaRVAMmDBvGZ1IKJj/Wi48dy0i4myBnwgT8k
         920IMdRlDWLUrlAx+yXNke2N50A20u21ZnBKXz6uoDMJVQbOocId9TtjhRoXBOUKyucS
         6BjQ==
X-Gm-Message-State: APjAAAV1zku0P2JIjFZ5sKp3saWRIX9uAGa8HsAiHpvLYjOkXZUPIuB4
        3jAq24BOk6m9x2p3RbuMv72D/gqQcHPpz5dMFuuSSg==
X-Google-Smtp-Source: APXvYqx/v5TjwjEAT3OBWjpEWGtN7RH1wXywstRupYf7HOZFbNYEa8xZ0NknGREDP0epDDYfn94YFrGxihvmI7pj1b0=
X-Received: by 2002:a2e:9687:: with SMTP id q7mr13565617lji.232.1579005893241;
 Tue, 14 Jan 2020 04:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20191211193954.747745-1-jean.pihet@newoldbits.com>
 <20191211193954.747745-3-jean.pihet@newoldbits.com> <20191220130830.GH4790@sirena.org.uk>
In-Reply-To: <20191220130830.GH4790@sirena.org.uk>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Tue, 14 Jan 2020 13:44:42 +0100
Message-ID: <CAORVsuUdLgZWfKdk+VBhYBbxaQbmkgvmqdsR_YcK9WtiERsesA@mail.gmail.com>
Subject: Re: [PATCH 2/3] spi: spi-ti-qspi: support large flash devices
To:     Mark Brown <broonie@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, linux-spi@vger.kernel.org,
        Ryan Barnett <ryan.barnett@rockwellcollins.com>,
        Conrad Ratschan <conrad.ratschan@rockwellcollins.com>,
        Arnout Vandecappelle <arnout.vandecappelle@essensium.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mark,

On Fri, Dec 20, 2019 at 2:08 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Dec 11, 2019 at 08:39:53PM +0100, Jean Pihet wrote:
>
> > +                     if (op->addr.val + op->data.nbytes > qspi->mmap_s=
ize) {
> > +                             max_len =3D qspi->mmap_size - op->addr.va=
l;
> > +                             op->data.nbytes =3D min(op->data.nbytes, =
max_len);
> > +                     }
>
> This introduces a massive warning splat for me (just one warning but
> it's very verbose):
>
>   CC      drivers/spi/spi-ti-qspi.o
> In file included from drivers/spi/spi-ti-qspi.c:9:
> drivers/spi/spi-ti-qspi.c: In function =E2=80=98ti_qspi_adjust_op_size=E2=
=80=99:
> ./include/linux/kernel.h:844:29: warning: comparison of distinct pointer =
types lacks a cast
>    (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
>                              ^~
> ./include/linux/kernel.h:858:4: note: in expansion of macro =E2=80=98__ty=
pecheck=E2=80=99
>    (__typecheck(x, y) && __no_side_effects(x, y))
>     ^~~~~~~~~~~
> ./include/linux/kernel.h:868:24: note: in expansion of macro =E2=80=98__s=
afe_cmp=E2=80=99
>   __builtin_choose_expr(__safe_cmp(x, y), \
>                         ^~~~~~~~~~
> ./include/linux/kernel.h:877:19: note: in expansion of macro =E2=80=98__c=
areful_cmp=E2=80=99
>  #define min(x, y) __careful_cmp(x, y, <)
>                    ^~~~~~~~~~~~~
> drivers/spi/spi-ti-qspi.c:535:23: note: in expansion of macro =E2=80=98mi=
n=E2=80=99
>      op->data.nbytes =3D min(op->data.nbytes, max_len);
>                        ^~~
> ./include/linux/kernel.h:844:29: warning: comparison of distinct pointer =
types lacks a cast
>    (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
>                              ^~
> ./include/linux/kernel.h:858:4: note: in expansion of macro =E2=80=98__ty=
pecheck=E2=80=99
>    (__typecheck(x, y) && __no_side_effects(x, y))
>     ^~~~~~~~~~~
> ./include/linux/kernel.h:868:24: note: in expansion of macro =E2=80=98__s=
afe_cmp=E2=80=99
>   __builtin_choose_expr(__safe_cmp(x, y), \
>                         ^~~~~~~~~~
> ./include/linux/kernel.h:877:19: note: in expansion of macro =E2=80=98__c=
areful_cmp=E2=80=99
>  #define min(x, y) __careful_cmp(x, y, <)
>                    ^~~~~~~~~~~~~
> drivers/spi/spi-ti-qspi.c:545:22: note: in expansion of macro =E2=80=98mi=
n=E2=80=99
>     op->data.nbytes =3D min(op->data.nbytes, max_len);
>                       ^~~
>
> Using compilers from Debian stable.

A new v3 release has been submitted, with the warnings fixed with
CONFIG_COMPILE_TEST enabled.

Thanks,
Jean
