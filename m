Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A70B1C5A8E
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 17:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730052AbgEEPIF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 11:08:05 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:47293 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729571AbgEEPIF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 May 2020 11:08:05 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MPXta-1jjp3o3yQk-00Mbmc; Tue, 05 May 2020 17:08:03 +0200
Received: by mail-qk1-f172.google.com with SMTP id b6so2556130qkh.11;
        Tue, 05 May 2020 08:08:02 -0700 (PDT)
X-Gm-Message-State: AGi0PuaHRj7c61J2D3gee3do4LzrNLt4GBcAIWegL+1BigBEQUl2due+
        GcqPt9fFRM4+CimTZRfxik9eBUWm6dA7l1nVNeE=
X-Google-Smtp-Source: APiQypLiOT+7IwI9rxENX6COgKMKWkszRH1A8ioRyBipPnDvFINtZDeTAFba6U/nOjaK75OsthpNiD3Px61PZ644fKk=
X-Received: by 2002:a37:b543:: with SMTP id e64mr3963064qkf.394.1588691281639;
 Tue, 05 May 2020 08:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140407.373983-1-arnd@arndb.de> <CANpmjNNw6M9Gqj6WGTHH4Cegu8roTVu5x6Vqs_tCBxX3gPwL4A@mail.gmail.com>
In-Reply-To: <CANpmjNNw6M9Gqj6WGTHH4Cegu8roTVu5x6Vqs_tCBxX3gPwL4A@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 5 May 2020 17:07:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a01jV71_EzaCkaZgG51vnJ+x1c192dZ9efEKTawF6noDQ@mail.gmail.com>
Message-ID: <CAK8P3a01jV71_EzaCkaZgG51vnJ+x1c192dZ9efEKTawF6noDQ@mail.gmail.com>
Subject: Re: [PATCH] omapfb: don't annotate dss_conv_list as __initdata
To:     Marco Elver <elver@google.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RIhLFUld2n1YiAdQx3NtguCuLNbWfAjWzdULgSVJ5EkvYCX0P0A
 /ydrh3vQeelhJZMTtC0rRnKepQFiX/3yetcgIw3mylemQxxnxGs6EhQ5o23zoW97Slg2EAr
 K+EGgiaOZUFbitGLUwyqlRMF5aLRmO6pmBduK+3XlRdMjgQjlF6QFXlVvGnMjoe1TgT6X84
 Vn5UtkRkeJm6QqfHhlwOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fkGi9xr/u8Y=:vfZhLEmKFMMmAFrPB+I6BB
 hO5W1PdOmgFomDohsdIyUp7MlshNUx+No36igSz3cUPnZkS0mOp89nxBzEjfmLnXc7oawsAKW
 N0CIr4iU8y1LBYE4KsSsctE4VcevKg+fPK3hnhljuD+22Dvl1v6B8Arf8cuiYAT8KcoMATF9j
 OW5flkXe3q8joTEfWZ4AWLZz5xJ0f/62iOAspK1vtj8MrtF8rMOflyWXHuplaLhmGbNJgayPz
 4R/CaPH65UQ1f39v0FTuQOB3hu/pjBNmkjS7CeeCqXLbuG7J7q+TAZZU1VJvXPDYdCwNIQ7E0
 gnI72b/39dNkD1XSavInHhF4zYYBQJUJ/Lve0cYc7pZcPDIbXvCTZAAaG2GOpQnJg0dH9s3CL
 vHzD2nY2LrC/ySYdVQ0coeSwtbIgMBQ7bw2L0AJu0+41iDrHHO/Wh70oIE9muRovBw+lk6+N9
 Sf/6BalDyGQcu8cjFbI9EF3KZXh7mRBilbg+p+TZi9C5YvYKqd6kkQVXDFJPskbCmvndSr8gc
 qK9XKTqcr494J2wOGb+fyS1AtP3PgXffOYA/AAZJ4AliaHaeYRhlZ7G2RYMjM2fqAAYJTD/ca
 QGZownEJr5wVS89TNCY9yiiNgcr3YZZB74qpEdVXKtoDmEmWnb/rzMujPb5h/aIDwAyAwCwNY
 rIgqgiFoDZwijX99bFgwimOR6KR8mBzZ7A63SHqOK+QaftQr9eEsJCXVzJTPEuz87CqmN1H46
 GcXp/aZvM7y7EzLV4MUgj3TEFokGCz+7ahLqDo2MD2E5QiXAxPtsKIMPG9m7oc6PCS/qTyTAA
 zRhoczbjmaS0uNhRilGBbH96Lf2xIBFzboBLNr0/sBm6h7B6g8=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 5, 2020 at 4:12 PM 'Marco Elver' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
> On Tue, 5 May 2020 at 16:04, Arnd Bergmann <arnd@arndb.de> wrote:
> > With the kcsan changes, __read_once_size() is not inlined, but
> > clang can decide to emit a version that hardcodes the address, which
> > in turn triggers a warning for dss_conv_list being __initdata but
> > __read_once_size() not being __init:
> >
> > WARNING: modpost: vmlinux.o(.text+0x6e4d7a): Section mismatch in
> > reference from the function __read_once_size() to the variable
> > .init.data:dss_conv_list
> > The function __read_once_size() references
> > the variable __initdata dss_conv_list.
> > This is often because __read_once_size lacks a __initdata
> > annotation or the annotation of dss_conv_list is wrong.
> >
> > This is clearly a false positive warning, but it's hard to tell
> > who is to blame for it. Work around it by removing the __initdata
> > annotation, wasting the space of two pointers in return for getting
> > rid of the warning.
> >
> > Fixes: dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> [+Cc Will]
>
> I think Will is working on a series that completely overhauls
> READ_ONCE/WRITE_ONCE, also getting rid of __read_once_size() in the
> process, which would make this patch redundant. If we can live with
> this warning until the new READ_ONCE/WRITE_ONCE gets merged, we can
> probably keep things as-is for now.

Ok, let's drop this one for now.

        Arnd
