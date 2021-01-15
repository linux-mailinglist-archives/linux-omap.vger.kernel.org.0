Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FD02F80CB
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 17:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbhAOQ3D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 11:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbhAOQ3D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 11:29:03 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98E8C061757
        for <linux-omap@vger.kernel.org>; Fri, 15 Jan 2021 08:28:22 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id n4so19126232iow.12
        for <linux-omap@vger.kernel.org>; Fri, 15 Jan 2021 08:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2jxVYo4zAHYaGdflMlQ8Smwd2Xv1dBNrIL55vVJmP3M=;
        b=ry/vJOcVOisbsVL22Kg/8OXnuQHrU2rbk+3pSaTK2V1nnLAWc+q1z/BUpXVfNcdX5w
         QEZjBBNaRFtSzZ2g5gP4RcK2GxRYwqAnL4rQozgxB19DuyX32wXpRApeYUSYtJzhX2CF
         CYRYYZFGIeb8VubGqRe6f0ZZ5Shd1ZU0tHIqyq+kC39JJORN4PHS11DnTX8LfKWZrZyl
         Yd+3t6I9LwBGOROmOGf3zpTOtpfVgpVjYFlm6jSLWD0DfQqrinZqWFsZiw2t5pHk1+ZG
         MCNDFG0u9GCt0NaC/1dFFaCU4W7WgjAarOpJHty/vFIskPpESK6oBsA0so7Ykq72ll46
         W62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2jxVYo4zAHYaGdflMlQ8Smwd2Xv1dBNrIL55vVJmP3M=;
        b=aWJzsz2IvGty0tM1qXyPcGpkUnrrF0e3CF6ME7dCMZNqG20dUxjHXJrKWbk2h8owHa
         4IGn5+nv3p30JRzCxku+WgKQ6vGkhNzEChSC4Cd+Jr/SBdXkDs6EAqJCJ8nk67CRH7Of
         3pDYGepg4nS3WW4bA3fGnL1mbpsyNYkMcUP+GCqPYP3Urcz2WG+H2Sl4o2y9fp56u3cO
         J8Xy55WYdyYU1qToD4jma6ajNKYBvbEcbazDzihP39y22WY8pWlxmYdHAe/yqHbrOcXX
         t2jRlYJ7PNT+ZZmAUUkYHdtP57o2uOfPxKBJ5Yh9bV5KqFS/k95LeeZ2fqNTwz+3J756
         egGg==
X-Gm-Message-State: AOAM530lGDsE9q+b1UaL+B2rBo88Wf0vPO9OkzPqHdoNhu9eEZAj0oXy
        Owx2/22f+yAJmF1zA8fjlYkukZUvZEPNSIyiXog=
X-Google-Smtp-Source: ABdhPJzgSaf80Q0n/yhbIQua22aaHzHq1XbJrTsqiL5/eZFUHTz6MnpylKhjABudgitmda5Dhl0bty3mha7xBsP2XhQ=
X-Received: by 2002:a92:7d14:: with SMTP id y20mr11206842ilc.196.1610728101806;
 Fri, 15 Jan 2021 08:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com> <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
 <20210114164224.5d21c170@xps13> <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
 <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com> <20210115171736.1c837c29@xps13>
In-Reply-To: <20210115171736.1c837c29@xps13>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 15 Jan 2021 10:28:06 -0600
Message-ID: <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
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

On Fri, Jan 15, 2021 at 10:17 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Adam,
>
> Adam Ford <aford173@gmail.com> wrote on Fri, 15 Jan 2021 10:06:14 -0600:
>
> > On Fri, Jan 15, 2021 at 6:23 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Thu, Jan 14, 2021 at 9:42 AM Miquel Raynal <miquel.raynal@bootlin.=
com> wrote:
> > > >
> > > > Hi Adam,
> > > >
> > > > Adam Ford <aford173@gmail.com> wrote on Tue, 12 Jan 2021 11:20:24 -=
0600:
> > > >
> > > > > On Tue, Jan 12, 2021 at 10:01 AM Adam Ford <aford173@gmail.com> w=
rote:
> > > > > >
> > > > > > On Tue, Jan 12, 2021 at 8:35 AM Miquel Raynal <miquel.raynal@bo=
otlin.com> wrote:
> > > > > > >
> > > > > > > Hi Adam,
> > > > > > >
> > > > > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 11 Ja=
n 2021
> > > > > > > 11:20:27 +0100:
> > > > > > >
> > > > > > > > Hi Adam,
> > > > > > > >
> > > > > > > > Adam Ford <aford173@gmail.com> wrote on Sat, 9 Jan 2021 08:=
46:44 -0600:
> > > > > > > >
> > > > > > > > > On Tue, Sep 29, 2020 at 6:09 PM Miquel Raynal <miquel.ray=
nal@bootlin.com> wrote:
> > > > > > > > > >
> > > > > > > > > > The NAND BCH control structure has nothing to do outsid=
e of this
> > > > > > > > > > driver, all users of the nand_bch_init/free() functions=
 just save it
> > > > > > > > > > to chip->ecc.priv so do it in this driver directly and =
return a
> > > > > > > > > > regular error code instead.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com=
>
> > > > > > > > > > ---
> > > > > > > > >
> > > > > > > > > Starting with this commit:  3c0fe36abebe, the kernel eith=
er doesn't
> > > > > > > > > build or returns errors on some omap2plus devices with th=
e following
> > > > > > > > > error:
> > > > > > > > >
> > > > > > > > >     nand: device found, Manufacturer ID: 0x2c, Chip ID: 0=
xbc
> > > > > > > > >     nand: Micron MT29F4G16ABBDA3W
> > > > > > > > >     nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2=
048, OOB size: 64
> > > > > > > > >     nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > > > > > > > >     Invalid ECC layout
> > > > > > > > >     omap2-nand 30000000.nand: unable to use BCH library
> > > > > > > > >     omap2-nand: probe of 30000000.nand failed with error =
-22
> > > > > > > > >     8<--- cut here ---
> > > > > > > > >
> > > > > > > > > There are few commits using git bisect that have build er=
rors, so it
> > > > > > > > > wasn't possible for me to determine the exact commit that=
 broke the
> > > > > > > > > ECC.  If the build failed, I marked it as 'bad' to git bi=
sect.
> > > > > > > >
> > > > > > > > I am sorry to hear that, I regularly rebase with a make run=
 between each
> > > > > > > > pick and push my branches to a 0-day repository to have rob=
ots check
> > > > > > > > for such errors, but sometimes I fail.
> > > > > > > >
> > > > > > > > > Newer commits have remedied the build issue, but the Inva=
lid ECC
> > > > > > > > > layout error still exists as of 5.11-RC2.
> > > > > > > >
> > > > > > > > Ok so let's focus on these.
> > > > > > > >
> > > > > > > > > Do you have any suggestions on what I can do to remedy th=
is?  I am
> > > > > > > > > willing to try and test.
> > > > > > > >
> > > > > > > > Glad to hear that.
> > > > > > > >
> > > > > > > > Can you share the NAND controller DT node you are using?
> > > > > > > >
> > > > > > > > Also, can you please add a few printk's like below and give=
 me the
> > > > > > > > output?
> > > > > > >
> > > > > > > Will you have the time to check these soon? I am ready to hel=
p and
> > > > > > > would like to fix it asap.
> > > > > >
> > > > > > Sorry for the delay, I have to split my time with 3 different
> > > > > > projects.  I am hoping to get you data later today.
> > > > > >
> > > > > Miquel,
> > > > >
> > > > > Here is the dump from my boot sequence:
> > > > >
> > > > > [    2.629089] omap2-nand 30000000.nand: GPIO lookup for consumer=
 rb
> > > > > [    2.635253] omap2-nand 30000000.nand: using device tree for GP=
IO lookup
> > > > > [    2.642150] of_get_named_gpiod_flags: parsed 'rb-gpios' proper=
ty of node '/o)
> > > > > [    2.653900] gpio gpiochip6: Persistence not supported for GPIO=
 0
> > > > > [    2.660339] nand: device found, Manufacturer ID: 0x2c, Chip ID=
: 0xbc
> > > > > [    2.666900] nand: Micron MT29F4G16ABBDA3W
> > > > > [    2.670959] nand: 512 MiB, SLC, erase size: 128 KiB, page size=
: 2048, OOB si4
> > > > > [    2.678710] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > > > > [    2.684234] writesize 2048, step_size 512, nsteps 4
> > > > > [    2.689300] strength 8, step size 512, code_size 13
> > > >
> > > > Until here, everything looks fine.
> > > >
> > > > > [    2.696807] count eccbytes 0
> > > >
> > > > This is the cause of the error, the MTD OOB layout reports not ECC =
byte.
> > > >
> > > > Can you please check that we effectively call the large page helper=
s
> > > > (in particular nand_ooblayout_ecc_lp()) . I bet this function retur=
ns
> > > > -ERANGE on its first call, which reduces the eccbytes variable abov=
e to
> > > > zero.
> > >
> > > I will do what I can, but I am out of my element with this mtd and na=
nd stuff.
> > >
> > > I added a printk to the beginning of nand_ooblayout_ecc_lp() and it's
> > > not appearing, so I wonder if nand_ooblayout_ecc_lp() is not getting
> > > called.
> > >
> > > I also added some printk's to the drivers/mtd/nand/raw/omap2.c to see
> > > what's being defined for section and ecc.steps.
> > >
> > > [    2.621978] mtdoops: mtd device (mtddev=3Dname/number) must be sup=
plied
> > > [    2.629699] omap2-nand 30000000.nand: GPIO lookup for consumer rb
> > > [    2.635864] omap2-nand 30000000.nand: using device tree for GPIO l=
ookup
> > > [    2.642761] of_get_named_gpiod_flags: parsed 'rb-gpios' property o=
f
> > > node '/ocp@68000000/gpmc@6e000000/nand@0,0[0]' - status (0)
> > > [    2.654510] gpio gpiochip6: Persistence not supported for GPIO 0
> > > [    2.660949] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x=
bc
> > > [    2.667510] nand: Micron MT29F4G16ABBDA3W
> > > [    2.671569] nand: 512 MiB, SLC, erase size: 128 KiB, page size:
> > > 2048, OOB size: 64
> > > [    2.679321] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > > [    2.684844] writesize 2048, step_size 512, nsteps 4
> > > [    2.689910] strength 8, step size 512, code_size 13
> > > [    2.694824] nand->ecc.ctx.total =3D 52
> > > [    2.700988] omap_sw_ooblayout_ecc section 0, chip->ecc.steps 0
> > >
> > > omap_sw_ooblayout_ecc() returns -ERANGE if section =3D> chip->ecc.ste=
ps
> > > which appears to be the case here.
> > >
> > > Is it safe to assume that ecc.steps should be 4 if nsteps is 4?
> > >
> > > [    2.707031] count eccbytes 0
> > > [    2.709930] omap_sw_ooblayout_ecc section 0, chip->ecc.steps 0
> > > [    2.715820] Invalid ECC layout
> > > [    2.719055] omap2-nand 30000000.nand: unable to use BCH library
> > > [    2.725067] omap2-nand: probe of 30000000.nand failed with error -=
22
> > > [    2.738983] 8<--- cut here ---
> > >
> > > >
> > > > What is strange is that, the only reason this would happen (to my e=
yes)
> > > > is nand->ecc.ctx.total being 0. Can you please check its effective
> > > > value?
> > >
> > > [    2.694824] nand->ecc.ctx.total =3D 52
> > >
> > > >
> > > > I do not see the immediate reason because nand->ecc.ctx.total is se=
t to
> > > > nsteps (4) * code_size (13) right before calling
> > > > mtd_ooblayout_count_eccbytes().
> > > >
> > > > Can you please verify my sayings and perhaps tackle the root cause =
of
> > > > this issue? Please do not hesitate to ask questions, I'll do my bes=
t to
> > > > help because this is a critical section that is not only breaking
> > > > OMAP boards, unfortunately.
> >
> > I appear to have the NAND flash working with the following patch:
> >
> > @@ -247,11 +253,21 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device *=
nand)
> >         nand->ecc.ctx.priv =3D engine_conf;
> >         nand->ecc.ctx.total =3D nsteps * code_size;
> >
> > +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> > +       chip->ecc.steps =3D nsteps;
> > +       chip->ecc.size =3D  conf->step_size;
> >
> > I am guessing it's not exactly what you want, but appears that the
> > ecc.steps and ecc.size wasn't getting propagated to the mtd layer, so
> > when omap_sw_ooblayout_ecc() was called, those fields were blank.
> >
> > If you have a suggestion on how you want this implemented, I can push a=
 patch.
>
> Great, I'll check more deeply why is this happening and get back to you
> early next week.

Sounds great.

FYI,  with my hack, this is my boot log:

[    2.622100] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
[    2.629821] omap2-nand 30000000.nand: GPIO lookup for consumer rb
[    2.635986] omap2-nand 30000000.nand: using device tree for GPIO lookup
[    2.642883] of_get_named_gpiod_flags: parsed 'rb-gpios' property of
node '/ocp@68000000/gpmc@6e000000/nand@0,0[0]' - status (0)
[    2.654632] gpio gpiochip6: Persistence not supported for GPIO 0
[    2.661071] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
[    2.667633] nand: Micron MT29F4G16ABBDA3W
[    2.671691] nand: 512 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    2.679443] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
[    2.684967] writesize 2048, step_size 512, nsteps 4
[    2.690032] strength 8, step size 512, code_size 13
[    2.700775] nand->ecc.ctx.total =3D 52
[    2.712646] count eccbytes 52
[    2.715698] mtd->ecc_step_size =3D 512
[    2.719482] nand_base: steps =3D 4, ecc->bytes =3D 13, ecc->total =3D 52
[    2.725769] 6 cmdlinepart partitions found on MTD device omap2-nand.0
[    2.732391] Creating 6 MTD partitions on "omap2-nand.0":
...

I have not verified being able to read/write and or check data
integrity, but with my hack, it no longer causes a panic on boot.

adam

>
> Thanks,
> Miqu=C3=A8l
