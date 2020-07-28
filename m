Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BF2230466
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 09:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgG1Hor (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 03:44:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45165 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgG1Hoq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 03:44:46 -0400
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MuUrM-1kqMgB0M9y-00rZ2o; Tue, 28 Jul 2020 09:44:45 +0200
Received: by mail-qv1-f41.google.com with SMTP id u8so8697857qvj.12;
        Tue, 28 Jul 2020 00:44:44 -0700 (PDT)
X-Gm-Message-State: AOAM531QMUYksb1Jpms5u1X61SjA+0TtCOc2hSbxyLspoxnjbu1K013s
        aL6Vn1Sa3WBITYkwsd13aVbfk2ozLJWPHbleig8=
X-Google-Smtp-Source: ABdhPJyqb+W6D9ojQk9hYiFoWW3udapSQhCnkKk1FdcjaRUGF+JKYubuRCNp33JOmzZiKTpab0xRuEfL2ic4waV8U+8=
X-Received: by 2002:ad4:4c09:: with SMTP id bz9mr24965836qvb.210.1595922283868;
 Tue, 28 Jul 2020 00:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200727211008.24225-1-s-anna@ti.com>
In-Reply-To: <20200727211008.24225-1-s-anna@ti.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 28 Jul 2020 09:44:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3_qu_rwWmxMz=H5DLSoZB3Jngjxqq14vir+NudfavmMg@mail.gmail.com>
Message-ID: <CAK8P3a3_qu_rwWmxMz=H5DLSoZB3Jngjxqq14vir+NudfavmMg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with regmap_config
To:     Suman Anna <s-anna@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jAhy5rjRa+cpDY5nTUuyZvjsC7XWem3etQoN+0yCSfQD5koLCli
 A7rYMRYQw75Dnk1lBqny5JZwnfiFzTSpWVTDn2/RipG6hBomhFch8NnINSzAMQycDhO8/tW
 JqU6wpq2YZ1ZqD67BJqYF1Hx24QVkh19LoY47C4MJvktpmrxvZkkdeZtNRFsvlAlizgxsBS
 1HgNAYe8hrsygjm7UCqgg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dhh6zboc/HI=:LUJpfqJdFdYHsEDTky7Hah
 1bp0oDkfRzbxyPENX6CktsoDRowknEQHYztIwDaesr53RcsgEAy4SrBs4TrPM24AbRjlxS/Gw
 PdXT9uK0h+DLNmUu4M/gQihisbj1ogfJYok1aJPHhKURAftO01bSyjy5Uw56OW62tX3Cvrsrn
 5hB4HF5+s3X5EzR0IJv3t5StgH6R0l5NXRaCOI4gTb5TGklBT3DkPx2czg8H4x2EF4laJnZUF
 qmSOTW/jR3tFAunIBC/7QeLjUnuK5RSQFM8QbcPLOcfu0hqNrwgtZOfq0uu13DaOJTsQmgukb
 r2Ta4Qb6WBNjVoD7s+8NGQiW6Z/CwNyGWkFq0YOR5l344pCRyXX8p06XDq1iz1zfrf5YxQ8fN
 Ll41iSdCyR5NEQUhBhfd6L0ikfCEajM1vvBaTC2NnwSxadYNZ4LOYXtQeYpO9bh/68qEQX7SY
 ETfWMC+CitzABFdyzLibP5hWEeIKSNtM8XJ8+XkhV+r2NuH9Qf+wugmY3xcoSgrM1T+WzUrsm
 wzNIEJIbhaKn8AyBAWEq87yOdgoDfiHL7aPbpiCorIMrg9a5aQbmAo2yVYAD3umcPOKIUyciI
 cOrfj/v2EyM0s7/sVrWQwqPM5ACtOGKgRpTPgeBuBFXOmMT+dl3GnOLMjjcmhqQD2rvv0rTmA
 zYXtcTxiRSMzaPBOxEm/+B5pSv/rZzFGw/n3h1xUri28SAamtU0pYHUvypQUL5wOqOwXqnx3f
 syAspd6+zeRgwodIcAD8oobg8Ht2FA86vneo3uaKFcJilKXlqzxhYJP7V25ZrQug4de7/kNsu
 guxvJBqUoe4KaGa9D0H8dJqQtla/G0eQVE112lVX6Rcv9kY6Fy46m5bXTuuHVNTV386U98ZHr
 ufbHfofxwM20dMUTI9TXx25l+/wqwSEkH+RiRx7mxsAkHOhYovr6o/R0oGRf92QVYXxgrBe/y
 qegkQ1t7jjaVgJsUUb/g0h3zOFcuWzTq+mvwSp6vkEJXpLJUBNLS1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jul 27, 2020 at 11:10 PM Suman Anna <s-anna@ti.com> wrote:
>
> The DT node full name is currently being used in regmap_config
> which in turn is used to create the regmap debugfs directories.
> This name however is not guaranteed to be unique and the regmap
> debugfs registration can fail in the cases where the syscon nodes
> have the same unit-address but are present in different DT node
> hierarchies. Replace this logic using the syscon reg resource
> address instead (inspired from logic used while creating platform
> devices) to ensure a unique name is given for each syscon.
>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Arnd,
> Lee is looking for your review on this patch. Can you please
> review and provide your comments.

Sorry for missing this earlier. I think this makes sense, and I don't
expect the name change to cause problems, so

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_clk)
>                 }
>         }
>
> -       syscon_config.name = of_node_full_name(np);
> +       syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
> +                                      (u64)res.start);

Note that you could avoid the cast by using "%pOFn@%pa", and
passing res.start by reference. Not important though, the result should
be similar, and you might not like the '0x' that this adds.

      Arnd
