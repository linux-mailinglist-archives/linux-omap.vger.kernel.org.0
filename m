Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056962FBA8D
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 15:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732408AbhASOyx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Jan 2021 09:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389462AbhASOW5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Jan 2021 09:22:57 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBD5C061575
        for <linux-omap@vger.kernel.org>; Tue, 19 Jan 2021 06:21:45 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id y19so39829536iov.2
        for <linux-omap@vger.kernel.org>; Tue, 19 Jan 2021 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mJFDfw+g9OuT0wOlNFL2GBollo5UBJxkeDTl/x7M484=;
        b=AfmzuhGFzZ+mzDqvMjOjjVWCrq8X7Jw3OJMXlfmcfnZU9WcaagPTrzBzqvaj0t23Im
         hsPODsI1ge6xmb1dhix9m18eVPnYuAT5Z/Z+dtLOBWRTwwdaHV47OtiW9Qe9eYOG65K9
         CJ4vqO41KRKviVQG4e+OUkCx9JHcec47MP9DR/DMXFlGaYdtv5OjmkK9p9ZKgLpuMiMn
         tiR/Hi++XIQIwRPvSjhfIl529oci60/hX2FDgaT3pz/X6MhIQ0eIoRnDS564DO815Q8f
         ULJhavsh4sKjn4LppZQDkCBOXIhyynigL/OvyX88iKIdUZ8mxANxplybb27Kuj5xhrYe
         R0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mJFDfw+g9OuT0wOlNFL2GBollo5UBJxkeDTl/x7M484=;
        b=YrTuszatKlCdgHrmLfoZZX/BwdfblqR6g0jXaPbt+aQKV/VAwYv7w9UuQScyVraPWD
         309gMdaeMMno/vEt4/aOhMUxCbuAuxgh+ptG44QHFInoiOWtSdu+X3FlWoVkQBQp/gvf
         KiFss4uzndmR9etTL5771aIV4sRFLZptwyZ9NY8OY0gMgdwfis8NBmQ+2FE8lMYLLejp
         kHJdQHw/jr7Qx+ATUgSH/Lev8v7Av12Fk6LDOARQbUh4KJZ4THodwuW1i2zP/+QiyIFD
         CdlDHCK8KVqeYm6HbTDmAPYs51dSkmfTT73iGI+/p7FbzESMGd0WS3L7g21d8mG57SW2
         TV/g==
X-Gm-Message-State: AOAM532/Li3AgIxkGeGOcHJkDcl2/xUYNAg5J/ny4KJfbQ3arZW17ufE
        q7JVxEsMAlFu5ZNMyyW0PBzsjdo80B+AEZBUdapLIxw4dg8brQ==
X-Google-Smtp-Source: ABdhPJxj6y6/aZ07s3Vd4CR1quagDXGe4IxLc8ZgONl6A4fbWoB8PQKWpoBtNoYF+PhtxQ8KDEOs7V0MNtRr1KEV8xE=
X-Received: by 2002:a6b:7501:: with SMTP id l1mr3075039ioh.92.1611066104905;
 Tue, 19 Jan 2021 06:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com> <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
 <20210114164224.5d21c170@xps13> <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
 <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
 <20210115171736.1c837c29@xps13> <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
 <20210119125634.6d4c5c1e@xps13>
In-Reply-To: <20210119125634.6d4c5c1e@xps13>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 19 Jan 2021 08:21:33 -0600
Message-ID: <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
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

On Tue, Jan 19, 2021 at 5:56 AM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Adam,
>
> Thank you very much for troubleshooting this, here is my proposal.
>
> > > > I appear to have the NAND flash working with the following patch:
> > > >
> > > > @@ -247,11 +253,21 @@ int nand_ecc_sw_bch_init_ctx(struct nand_devi=
ce *nand)
> > > >         nand->ecc.ctx.priv =3D engine_conf;
> > > >         nand->ecc.ctx.total =3D nsteps * code_size;
> > > >
> > > > +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > > +       chip->ecc.steps =3D nsteps;
> > > > +       chip->ecc.size =3D  conf->step_size;
>
> I was fearing that many boards would be affected by this issue but it
> appears that the problem will only show up here because the OMAP driver
> makes a strange use of the BCH library: it initializes it itself
> because it only needs it for a single operation while usually, the core
> is in charge of doing that. During the initialization, the OOB layout
> is verified. Usually, the BCH driver is used with one of the generic OOB
> layouts, while here the OMAP driver uses its own, which reads raw NAND
> chip entries.
>
> I recently moved the BCH driver to only use "generic" NAND bits, which
> produced the bug because the entries derived by the layout helpers
> have not been updated yet.
>
> So using raw NAND bits in the BCH driver is not an option here.
> Instead, I think the best way to address this is to export the
> declaration of the BCH internal configuration structure to the OMAP
> driver and use the right values, recently derived by the driver:
>
> ---8<---
>
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
> Date:   Tue Jan 19 12:27:07 2021 +0100
>
>     wip: fix omap
>
>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
Thanks for fixing this.

I tested your patch, and I no longer get a Panic and the MTD device
appears to appear correctly:

mtdoops: mtd device (mtddev=3Dname/number) must be supplied
omap2-nand 30000000.nand: GPIO lookup for consumer rb
omap2-nand 30000000.nand: using device tree for GPIO lookup
of_get_named_gpiod_flags: parsed 'rb-gpios' property of node
'/ocp@68000000/gpmc@6e000000/nand@0,0[0]' - status (0)
gpio gpiochip6: Persistence not supported for GPIO 0
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
nand: Micron MT29F4G16ABBDA3W
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
6 cmdlinepart partitions found on MTD device omap2-nand.0
Creating 6 MTD partitions on "omap2-nand.0":
...

When you submit a formal patch, CC me on the patch, and I'll respond
with a 'tested-by'

adam

> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index fbb9955f2467..2c3e65cb68f3 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -15,6 +15,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/sched.h>
>  #include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand-ecc-sw-bch.h>
>  #include <linux/mtd/rawnand.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/omap-dma.h>
> @@ -1866,18 +1867,19 @@ static const struct mtd_ooblayout_ops omap_ooblay=
out_ops =3D {
>  static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
>                                  struct mtd_oob_region *oobregion)
>  {
> -       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       struct nand_device *nand =3D mtd_to_nanddev(mtd);
> +       const struct nand_ecc_sw_bch_conf *engine_conf =3D nand->ecc.ctx.=
priv;
>         int off =3D BADBLOCK_MARKER_LENGTH;
>
> -       if (section >=3D chip->ecc.steps)
> +       if (section >=3D engine_conf->nsteps)
>                 return -ERANGE;
>
>         /*
>          * When SW correction is employed, one OMAP specific marker byte =
is
>          * reserved after each ECC step.
>          */
> -       oobregion->offset =3D off + (section * (chip->ecc.bytes + 1));
> -       oobregion->length =3D chip->ecc.bytes;
> +       oobregion->offset =3D off + (section * (engine_conf->code_size + =
1));
> +       oobregion->length =3D engine_conf->code_size;
>
>         return 0;
>  }
> @@ -1885,7 +1887,8 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *m=
td, int section,
>  static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
>                                   struct mtd_oob_region *oobregion)
>  {
> -       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       struct nand_device *nand =3D mtd_to_nanddev(mtd);
> +       const struct nand_ecc_sw_bch_conf *engine_conf =3D nand->ecc.ctx.=
priv;
>         int off =3D BADBLOCK_MARKER_LENGTH;
>
>         if (section)
> @@ -1895,7 +1898,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *=
mtd, int section,
>          * When SW correction is employed, one OMAP specific marker byte =
is
>          * reserved after each ECC step.
>          */
> -       off +=3D ((chip->ecc.bytes + 1) * chip->ecc.steps);
> +       off +=3D ((engine_conf->code_size + 1) * engine_conf->nsteps);
>         if (off >=3D mtd->oobsize)
>                 return -ERANGE;
>
> --->8---
>
> Can you please try this patch and compare the values between your hack
> and mine of:
> - chip->ecc.bytes vs. engine_conf->code_size
> - chip->ecc.steps vs. engine_conf->nsteps
> The values should be the same, but I prefer to be sure.
>
> Thanks,
> Miqu=C3=A8l
