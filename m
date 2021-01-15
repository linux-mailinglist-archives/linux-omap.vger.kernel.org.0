Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCFC2F78D7
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 13:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbhAOMYS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 07:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbhAOMYS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 07:24:18 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC70C061795
        for <linux-omap@vger.kernel.org>; Fri, 15 Jan 2021 04:23:37 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id n4so17629941iow.12
        for <linux-omap@vger.kernel.org>; Fri, 15 Jan 2021 04:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BRYH2QepjWk+/6saC51z70tJrAO34xax2iNPNZqOCdk=;
        b=tRHg3iTVEqWbwX+77DDJNDkr0OakNNDhiPolpuAOieqnP5F+NnRTpOnxE9xLrqfOvt
         CM5T5gThRPiem3qLKlOpUx0dzouZGIYcr344tygMQO1e/KHtLvDklXWlMLUSummBpzGK
         oHTZeT+JyH7nMAFgGnlEy0LsJOv4hlfGCmMZJtj9Hvf+2SMEppLUqLCDOkxW2yO+bqf/
         P1WOfX0b0TfjFCFqUxfNXRLeF0uR8rMW05ldqCHu1HeNjO13GWo2Is86cUtXoaLKWg6D
         fTWJ5sFeiVQwkHYqdME0xgKswB3GtjfcvJIDzDSHhDuqTfaP5HRWqTY9eFZpqvIb81Aj
         q9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BRYH2QepjWk+/6saC51z70tJrAO34xax2iNPNZqOCdk=;
        b=SlV5h79BhUgjQ9fVX0ZintXIQgBfp1aFewoj09dBl8n2mHpOExvEM47O4+Q0yhixIC
         qgXPaLqKWQjqxltw92WgBkDQpxfpwzqEaDNB/yjbe8Xj6H8tpoQpJ2T7WVoVkpVtTqzL
         1JsB6zoJ/nWzhi5nz8c5P9k0n4FghmDxgV7uGfz291eOdqmZlDI0hAq6Lrwg6jt9szWb
         bRbfR/EcnoHSApOu34fA8tKzB+bBB5FLsT2opZCsRiI/mk2VdNE6bsz8pQX1vPsEtriq
         sJ77flMF2lGCKXW1FJ7oj+OLrnvTuIK5LiEgHFMHKrR1996AyxabuL9G0nP44rb0lYco
         uDBA==
X-Gm-Message-State: AOAM533FG8d21RGfvBHEdPBFT6S9PlHprmxfQfih6xo/txf5PDcx1dvd
        dH7DvqYSPsmJ9oOX/DBDeERy/QaxEalySC5TnCH2Xc1r/HafmA==
X-Google-Smtp-Source: ABdhPJxF019HqEt/P0Yj3hNhBC+HTSPAjKYYtToSdgk+Yg9Q7lLCMemN8peFONELaGGp0oA6HZi9ChLKp25tVkF1sa8=
X-Received: by 2002:a92:c26f:: with SMTP id h15mr10747092ild.65.1610713417107;
 Fri, 15 Jan 2021 04:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com> <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com> <20210114164224.5d21c170@xps13>
In-Reply-To: <20210114164224.5d21c170@xps13>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 15 Jan 2021 06:23:22 -0600
Message-ID: <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
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

On Thu, Jan 14, 2021 at 9:42 AM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Adam,
>
> Adam Ford <aford173@gmail.com> wrote on Tue, 12 Jan 2021 11:20:24 -0600:
>
> > On Tue, Jan 12, 2021 at 10:01 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Tue, Jan 12, 2021 at 8:35 AM Miquel Raynal <miquel.raynal@bootlin.=
com> wrote:
> > > >
> > > > Hi Adam,
> > > >
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 11 Jan 2021
> > > > 11:20:27 +0100:
> > > >
> > > > > Hi Adam,
> > > > >
> > > > > Adam Ford <aford173@gmail.com> wrote on Sat, 9 Jan 2021 08:46:44 =
-0600:
> > > > >
> > > > > > On Tue, Sep 29, 2020 at 6:09 PM Miquel Raynal <miquel.raynal@bo=
otlin.com> wrote:
> > > > > > >
> > > > > > > The NAND BCH control structure has nothing to do outside of t=
his
> > > > > > > driver, all users of the nand_bch_init/free() functions just =
save it
> > > > > > > to chip->ecc.priv so do it in this driver directly and return=
 a
> > > > > > > regular error code instead.
> > > > > > >
> > > > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > > > ---
> > > > > >
> > > > > > Starting with this commit:  3c0fe36abebe, the kernel either doe=
sn't
> > > > > > build or returns errors on some omap2plus devices with the foll=
owing
> > > > > > error:
> > > > > >
> > > > > >     nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > > > > >     nand: Micron MT29F4G16ABBDA3W
> > > > > >     nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, O=
OB size: 64
> > > > > >     nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > > > > >     Invalid ECC layout
> > > > > >     omap2-nand 30000000.nand: unable to use BCH library
> > > > > >     omap2-nand: probe of 30000000.nand failed with error -22
> > > > > >     8<--- cut here ---
> > > > > >
> > > > > > There are few commits using git bisect that have build errors, =
so it
> > > > > > wasn't possible for me to determine the exact commit that broke=
 the
> > > > > > ECC.  If the build failed, I marked it as 'bad' to git bisect.
> > > > >
> > > > > I am sorry to hear that, I regularly rebase with a make run betwe=
en each
> > > > > pick and push my branches to a 0-day repository to have robots ch=
eck
> > > > > for such errors, but sometimes I fail.
> > > > >
> > > > > > Newer commits have remedied the build issue, but the Invalid EC=
C
> > > > > > layout error still exists as of 5.11-RC2.
> > > > >
> > > > > Ok so let's focus on these.
> > > > >
> > > > > > Do you have any suggestions on what I can do to remedy this?  I=
 am
> > > > > > willing to try and test.
> > > > >
> > > > > Glad to hear that.
> > > > >
> > > > > Can you share the NAND controller DT node you are using?
> > > > >
> > > > > Also, can you please add a few printk's like below and give me th=
e
> > > > > output?
> > > >
> > > > Will you have the time to check these soon? I am ready to help and
> > > > would like to fix it asap.
> > >
> > > Sorry for the delay, I have to split my time with 3 different
> > > projects.  I am hoping to get you data later today.
> > >
> > Miquel,
> >
> > Here is the dump from my boot sequence:
> >
> > [    2.629089] omap2-nand 30000000.nand: GPIO lookup for consumer rb
> > [    2.635253] omap2-nand 30000000.nand: using device tree for GPIO loo=
kup
> > [    2.642150] of_get_named_gpiod_flags: parsed 'rb-gpios' property of =
node '/o)
> > [    2.653900] gpio gpiochip6: Persistence not supported for GPIO 0
> > [    2.660339] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > [    2.666900] nand: Micron MT29F4G16ABBDA3W
> > [    2.670959] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048=
, OOB si4
> > [    2.678710] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > [    2.684234] writesize 2048, step_size 512, nsteps 4
> > [    2.689300] strength 8, step size 512, code_size 13
>
> Until here, everything looks fine.
>
> > [    2.696807] count eccbytes 0
>
> This is the cause of the error, the MTD OOB layout reports not ECC byte.
>
> Can you please check that we effectively call the large page helpers
> (in particular nand_ooblayout_ecc_lp()) . I bet this function returns
> -ERANGE on its first call, which reduces the eccbytes variable above to
> zero.

I will do what I can, but I am out of my element with this mtd and nand stu=
ff.

I added a printk to the beginning of nand_ooblayout_ecc_lp() and it's
not appearing, so I wonder if nand_ooblayout_ecc_lp() is not getting
called.

I also added some printk's to the drivers/mtd/nand/raw/omap2.c to see
what's being defined for section and ecc.steps.

[    2.621978] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
[    2.629699] omap2-nand 30000000.nand: GPIO lookup for consumer rb
[    2.635864] omap2-nand 30000000.nand: using device tree for GPIO lookup
[    2.642761] of_get_named_gpiod_flags: parsed 'rb-gpios' property of
node '/ocp@68000000/gpmc@6e000000/nand@0,0[0]' - status (0)
[    2.654510] gpio gpiochip6: Persistence not supported for GPIO 0
[    2.660949] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
[    2.667510] nand: Micron MT29F4G16ABBDA3W
[    2.671569] nand: 512 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    2.679321] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
[    2.684844] writesize 2048, step_size 512, nsteps 4
[    2.689910] strength 8, step size 512, code_size 13
[    2.694824] nand->ecc.ctx.total =3D 52
[    2.700988] omap_sw_ooblayout_ecc section 0, chip->ecc.steps 0

omap_sw_ooblayout_ecc() returns -ERANGE if section =3D> chip->ecc.steps
which appears to be the case here.

Is it safe to assume that ecc.steps should be 4 if nsteps is 4?

[    2.707031] count eccbytes 0
[    2.709930] omap_sw_ooblayout_ecc section 0, chip->ecc.steps 0
[    2.715820] Invalid ECC layout
[    2.719055] omap2-nand 30000000.nand: unable to use BCH library
[    2.725067] omap2-nand: probe of 30000000.nand failed with error -22
[    2.738983] 8<--- cut here ---

>
> What is strange is that, the only reason this would happen (to my eyes)
> is nand->ecc.ctx.total being 0. Can you please check its effective
> value?

[    2.694824] nand->ecc.ctx.total =3D 52

>
> I do not see the immediate reason because nand->ecc.ctx.total is set to
> nsteps (4) * code_size (13) right before calling
> mtd_ooblayout_count_eccbytes().
>
> Can you please verify my sayings and perhaps tackle the root cause of
> this issue? Please do not hesitate to ask questions, I'll do my best to
> help because this is a critical section that is not only breaking
> OMAP boards, unfortunately.
>
> Thanks,
> Miqu=C3=A8l
