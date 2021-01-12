Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398022F36F0
	for <lists+linux-omap@lfdr.de>; Tue, 12 Jan 2021 18:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391093AbhALRVR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Jan 2021 12:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728868AbhALRVQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Jan 2021 12:21:16 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DFDC061575
        for <linux-omap@vger.kernel.org>; Tue, 12 Jan 2021 09:20:36 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id y19so5689086iov.2
        for <linux-omap@vger.kernel.org>; Tue, 12 Jan 2021 09:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1gfzBScHK4ppxTYZQnMKSRmvMf71cdXIkGxKft+Zol4=;
        b=P2umRsPvNMdUor/dIFoZyAzStHTOJ81n4kC9nheUcW3KEvif+dazDiPM7NYVuLANn0
         tshXBYpDQldNOC6nPQ1iLsa5yHi5kOpKGevD6lRU+x8hlQc1gt7y2Ow3Hxi6gDeEEf5q
         eicuHazzI75eGxoz+fY31Tf+36Uz0IIg2h+IhdhzC13+40Nn1nsRLJxkVGePVd49v2cg
         BZFfR3ZF8THpxC59f3HnHu6/iktrp6oM+DepSLHMXMVH6f3LDbmTDrcRDVtTssUAzPAY
         GT8DsoAwoY6hZxA/RUxY8uH/pCGwCABqQWCxpKYQ7gKylkPenrqFIN2DL9B8Q4iOdzfW
         axUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1gfzBScHK4ppxTYZQnMKSRmvMf71cdXIkGxKft+Zol4=;
        b=P7WLCLNt9e2TZc4Sqo/9WwVlGm3x/sa20g1YetwFdL3Ur19/1NzHVg1WF8VXjJT8jh
         Vwr45uDfZch2NvcsOA70siMw+hC2o2Y58V3BMxpkvAm3l+yRCZrASpgmxtxqM7BJBW6+
         ZrG1EcU4L7Z73VHebS2sQCpZ38OGAtQ+IXg0Jp64nkVw/2X3UVcPr9KsnwADLqKlC8cl
         gfgd0da8EgFvQXCyuLMDzIhFQEra5zKsoadQj6c2E3efiMIwC4LBz2zxxnR1L5bX24N7
         sLUVR6V9jomFS9CogdBDwTCxd7ysSjI4vEFicGG2fL+PdlNpkOIMpp7WYrz0ptBA9ZfN
         V54Q==
X-Gm-Message-State: AOAM5335Yefli41g312i8LJ+2jYq4NgRFZjvoRyAwSXd8tSL/XZENAk7
        KSfz/Lkz44fwRME8r0ZYGl4qW7UnZhCIW0Cw2acc2pkcwUzMQA==
X-Google-Smtp-Source: ABdhPJwRcgFmXHfdTSfe7+1cuCCTbqMTJYQyLyBSLzbeJXsqM8wZ7Rvxax4UejPRb+IyoAoheFCjb5C9xLlpKm1Qz3c=
X-Received: by 2002:a5d:8483:: with SMTP id t3mr4132412iom.35.1610472035859;
 Tue, 12 Jan 2021 09:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com> <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13> <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
In-Reply-To: <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 12 Jan 2021 11:20:24 -0600
Message-ID: <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private structure
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
        ycllin@mxic.com.tw,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jan 12, 2021 at 10:01 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Jan 12, 2021 at 8:35 AM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> >
> > Hi Adam,
> >
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 11 Jan 2021
> > 11:20:27 +0100:
> >
> > > Hi Adam,
> > >
> > > Adam Ford <aford173@gmail.com> wrote on Sat, 9 Jan 2021 08:46:44 -060=
0:
> > >
> > > > On Tue, Sep 29, 2020 at 6:09 PM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
> > > > >
> > > > > The NAND BCH control structure has nothing to do outside of this
> > > > > driver, all users of the nand_bch_init/free() functions just save=
 it
> > > > > to chip->ecc.priv so do it in this driver directly and return a
> > > > > regular error code instead.
> > > > >
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > ---
> > > >
> > > > Starting with this commit:  3c0fe36abebe, the kernel either doesn't
> > > > build or returns errors on some omap2plus devices with the followin=
g
> > > > error:
> > > >
> > > >     nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > > >     nand: Micron MT29F4G16ABBDA3W
> > > >     nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB s=
ize: 64
> > > >     nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > > >     Invalid ECC layout
> > > >     omap2-nand 30000000.nand: unable to use BCH library
> > > >     omap2-nand: probe of 30000000.nand failed with error -22
> > > >     8<--- cut here ---
> > > >
> > > > There are few commits using git bisect that have build errors, so i=
t
> > > > wasn't possible for me to determine the exact commit that broke the
> > > > ECC.  If the build failed, I marked it as 'bad' to git bisect.
> > >
> > > I am sorry to hear that, I regularly rebase with a make run between e=
ach
> > > pick and push my branches to a 0-day repository to have robots check
> > > for such errors, but sometimes I fail.
> > >
> > > > Newer commits have remedied the build issue, but the Invalid ECC
> > > > layout error still exists as of 5.11-RC2.
> > >
> > > Ok so let's focus on these.
> > >
> > > > Do you have any suggestions on what I can do to remedy this?  I am
> > > > willing to try and test.
> > >
> > > Glad to hear that.
> > >
> > > Can you share the NAND controller DT node you are using?
> > >
> > > Also, can you please add a few printk's like below and give me the
> > > output?
> >
> > Will you have the time to check these soon? I am ready to help and
> > would like to fix it asap.
>
> Sorry for the delay, I have to split my time with 3 different
> projects.  I am hoping to get you data later today.
>
Miquel,

Here is the dump from my boot sequence:

[    2.629089] omap2-nand 30000000.nand: GPIO lookup for consumer rb
[    2.635253] omap2-nand 30000000.nand: using device tree for GPIO lookup
[    2.642150] of_get_named_gpiod_flags: parsed 'rb-gpios' property of node=
 '/o)
[    2.653900] gpio gpiochip6: Persistence not supported for GPIO 0
[    2.660339] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
[    2.666900] nand: Micron MT29F4G16ABBDA3W
[    2.670959] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OO=
B si4
[    2.678710] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
[    2.684234] writesize 2048, step_size 512, nsteps 4
[    2.689300] strength 8, step size 512, code_size 13
[    2.696807] count eccbytes 0
[    2.699707] Invalid ECC layout
[    2.702789] omap2-nand 30000000.nand: unable to use BCH library
[    2.709014] omap2-nand: probe of 30000000.nand failed with error -22
[    2.722656] 8<--- cut here ---

Let me know if/what else you want me to try.

adam

> adam
> >
> > Cheers,
> > Miqu=C3=A8l
