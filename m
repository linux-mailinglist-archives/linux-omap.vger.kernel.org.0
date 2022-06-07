Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2FEA53FCE1
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jun 2022 13:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239246AbiFGLIS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jun 2022 07:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242518AbiFGLID (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jun 2022 07:08:03 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05C01053E6
        for <linux-omap@vger.kernel.org>; Tue,  7 Jun 2022 04:04:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so27747783lfc.2
        for <linux-omap@vger.kernel.org>; Tue, 07 Jun 2022 04:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aO/lSvFaLajkL7Ac/IqTCOTSOPQr+6oNuobROU/TF8k=;
        b=plZ0JtxWk2Nc24B6pQU1IdzZ7fMFVakDlxjXm1dhZfOhbMC11ALQejl6bnQ4uXxFQq
         CiRvRizUUB6Q6XOYtz7/pBHYG3DyAdJKKaej8Ki2oFk96Vg4LC8B5NRrQbwIGp50BvQq
         PCPkamJ/f1O0MGhS4o5loFLInz8co4ctI11OggzRThUimjtNATTeEVur3srhTyvR5aNE
         UkIncS+2ZcyEDZIzLq6wIxUJfD2flK51qsJ0r3PzGh7yV5Z8nN7KJJePQsOOybCwmYLW
         GsUb+yluSCn1dtqSGUZvDycBaNNTBCK3iNAg6a5K1Vnz4JR2nK3FrJo1qP6RE2P0bOpK
         w+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aO/lSvFaLajkL7Ac/IqTCOTSOPQr+6oNuobROU/TF8k=;
        b=0/OWLk3/rr7BLO/lCJKMmXHm2n8OB0dOEGMeQyATbsN3bdmuS4Wx/2aHTxVEEgb17J
         RLSXPhD1QOpL9Lu6h0ivemVvwVRxcN6YNC1LW3re9eNIqJ556uMx6hGY3fdHRy2sBA8g
         5WimFV5I70ZDoRr1dFKFuq/bDUhmINkU6+5n8fg28D7qJWTDO8jqr1F5Fjb5nuAnCIAP
         Ji+LsuxSkASTpEXFCU1Q2Lu+8pEeQiBg+z7ihcDeQs7P3nP1csZh3Kfo5HtmHpG7RDOO
         b1x7wYNcHaBihOBxmnyG1Rh/NR6Er2YSWe54bgW38gXUE1cg1SeE8+g0udpQz6eLyt64
         tptw==
X-Gm-Message-State: AOAM533fAMw/IUjxbdHgGYugYLym0Gj7gJdvNzMRjrJ3viXzLsgOHqZP
        psTmlK0w74XwMIcUmNjpqqUOzXOgJrHuUZ1+ULYidg==
X-Google-Smtp-Source: ABdhPJwD90lne0lHTxYJKzLqW7u3faS4ilXkDxuw9Uqee5o04CDWGrVYZ5DTYIRIF+JkxWbqPbdIMnggcfaJZleojrA=
X-Received: by 2002:a19:ac42:0:b0:478:593c:e6fe with SMTP id
 r2-20020a19ac42000000b00478593ce6femr17856420lfc.254.1654599847422; Tue, 07
 Jun 2022 04:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <55A0788B-03E8-457E-B093-40FD93F1B9F3@goldelico.com>
 <CAPDyKFrjH8c=2LYkzj81jm7t-sy-EBs3AMzAS7M=LEHsh9qCCA@mail.gmail.com> <FA636A4D-FA8F-48EE-80C4-EDDFD115FB25@goldelico.com>
In-Reply-To: <FA636A4D-FA8F-48EE-80C4-EDDFD115FB25@goldelico.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Jun 2022 13:03:30 +0200
Message-ID: <CAPDyKFoe5xYyiqNuOjLc4AnF-U_CwTujmNSjkjkW1E4O-8RKig@mail.gmail.com>
Subject: Re: BUG in mmc: core: Disable card detect during shutdown
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, aTc <atc@k-n-p.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 4 Jun 2022 at 12:16, H. Nikolaus Schaller <hns@goldelico.com> wrote=
:
>
> Hi,
>
> > Am 03.06.2022 um 12:46 schrieb Ulf Hansson <ulf.hansson@linaro.org>:
> >
> > On Mon, 30 May 2022 at 18:55, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
> >>
> >> Hi Ulf,
> >> users did report a strange issue that the OMAP5 based Pyra does not
> >> shutdown if a kernel 5.10.116 is used.
> >>
>
> ...
>
> >> mmc_stop_host() is not called but __mmc_stop_host() is called 4 times.
> >> There are 4 active MMC interfaces in the Pyra - 3 for (=C2=B5)SD slots
> >> and one for an SDIO WLAN module.
> >>
> >> Now it looks as if 3 of them are properly teared down (two of them
> >> seem to have host->slot.cd_irq >=3D 0) but on the fourth call
> >> cancel_delayed_work_sync(&host->detect); does not return. This is
> >> likely the location of the stall why we don't see a "reboot: Power dow=
n"
> >>
> >> Any ideas?
> >
> > I guess the call to cancel_delayed_work_sync() in __mmc_stop_host()
> > hangs for one of the mmc hosts. This shouldn't happen - and indicates
> > that there is something else being wrong.
>
> Yes, you were right...
>
> >
> > See more suggestions below.
> >
> >>
> >> BR and thanks,
> >> Nikolaus
> >>
> >> printk hack:
> >>
> >> void __mmc_stop_host(struct mmc_host *host)
> >> {
> >> printk("%s 1\n", __func__);
> >>        if (host->slot.cd_irq >=3D 0) {
> >> printk("%s 2\n", __func__);
> >>                mmc_gpio_set_cd_wake(host, false);
> >> printk("%s 3\n", __func__);
> >>                disable_irq(host->slot.cd_irq);
> >> printk("%s 4\n", __func__);
> >>        }
> >>
> >>        host->rescan_disable =3D 1;
> >> printk("%s 5\n", __func__);
> >
> > My guess is that it's the same mmc host that causes the hang. I
> > suggest you print the name of the host too, to verify that. Something
> > along the lines of the below.
> >
> > printk("%s: %s 5\n", mmc_hostname(host), __func__);
>
> To my surprise, this did report an mmc6 host port where the OMAP5 only ha=
s 4...
>
> Yes, we have a special driver for the txs02612 sdio switch and voltage tr=
anslator
> chip to make two ports out of the single mmc2 port of the OMAP5 SoC.
>
> This driver was begun ca. 7 years ago but never finished...
>
> The idea is to make a mmc port have several subports. For the Pyra handhe=
ld hardware
> we needed 5 mmc/sdio interfaces but the omap5 only has 4 of them availabl=
e to us.
>
> So the txs02612 drivers is sitting between the omap5 mmc2 host pins and s=
witches
> between an =C2=B5SD slot and an eMMC.
>
> Therefore, the driver is a mmc client driver (like e.g. the driver of som=
e WiFi chip
> connected to some SDIO port) and provides multiple mmc host interfaces.
>
> It should intercept data transfer requests to its multiple mmc hosts, syn=
chronize
> (or enqueue) them, control the switch gpio and forward requests to the pr=
ocessor's
> mmc host port so that they are processed (after switching).
>
> We never continued to make this work...

Well, I can imagine that it's just very difficult to make this work properl=
y.

Moreover, the mmc core and its block layer code isn't designed to
support this type of configuration. For example, the I/O scheduling
can't work with this setup.

>
> What remained is simple code to manually throw the switch through some /s=
ysfs
> control file after doing an eject and before a fresh partprobe.
>
> Still, the probe function of the txs02612 driver does two calls to mmc_ad=
d_host().
> These seem to make
>
> >
> >>        cancel_delayed_work_sync(&host->detect);
>
> get stuck. Most likely because the initialization is not complete for han=
dling
> card detection.
>
> >>
> >> --- here should be another __mmc_stop_host 6
> >> --- and reboot: Power down
> >
> > When/if you figured out that it's the same host that hangs, you could
> > try to disable that host through the DTS files (add status =3D
> > "disabled" in the device node, for example) - and see if that works.
>
> When not calling mmc_add_host() in our txs02612 driver fragment we can
> properly shut down the OMAP5. That is the solution with the least efforts=
.
> The other would be to make the txs02612 properly work...
>
> So in summary there is no bug upstream. It is in our tree.

Thanks for sharing the details.

>
> If you are interested in how our code fragment for the txs02612 looks lik=
e:
>
> https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/hea=
ds/letux/txs02612
>
> Maybe you have some suggestions to make it work?

Sorry, but I have lots of things to do at this point, maybe some other time=
.

Kind regards
Uffe
