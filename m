Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E052F8071
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 17:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbhAOQSY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 15 Jan 2021 11:18:24 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:23175 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbhAOQSY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 11:18:24 -0500
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 828AA240014;
        Fri, 15 Jan 2021 16:17:38 +0000 (UTC)
Date:   Fri, 15 Jan 2021 17:17:36 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
        ycllin@mxic.com.tw,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
Message-ID: <20210115171736.1c837c29@xps13>
In-Reply-To: <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
        <20200929230124.31491-5-miquel.raynal@bootlin.com>
        <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
        <20210111112027.7cbda0ba@xps13>
        <20210112153534.5ba93cde@xps13>
        <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
        <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
        <20210114164224.5d21c170@xps13>
        <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
        <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

Adam Ford <aford173@gmail.com> wrote on Fri, 15 Jan 2021 10:06:14 -0600:

> On Fri, Jan 15, 2021 at 6:23 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Thu, Jan 14, 2021 at 9:42 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:  
> > >
> > > Hi Adam,
> > >
> > > Adam Ford <aford173@gmail.com> wrote on Tue, 12 Jan 2021 11:20:24 -0600:
> > >  
> > > > On Tue, Jan 12, 2021 at 10:01 AM Adam Ford <aford173@gmail.com> wrote:  
> > > > >
> > > > > On Tue, Jan 12, 2021 at 8:35 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:  
> > > > > >
> > > > > > Hi Adam,
> > > > > >
> > > > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 11 Jan 2021
> > > > > > 11:20:27 +0100:
> > > > > >  
> > > > > > > Hi Adam,
> > > > > > >
> > > > > > > Adam Ford <aford173@gmail.com> wrote on Sat, 9 Jan 2021 08:46:44 -0600:
> > > > > > >  
> > > > > > > > On Tue, Sep 29, 2020 at 6:09 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:  
> > > > > > > > >
> > > > > > > > > The NAND BCH control structure has nothing to do outside of this
> > > > > > > > > driver, all users of the nand_bch_init/free() functions just save it
> > > > > > > > > to chip->ecc.priv so do it in this driver directly and return a
> > > > > > > > > regular error code instead.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > > > > > ---  
> > > > > > > >
> > > > > > > > Starting with this commit:  3c0fe36abebe, the kernel either doesn't
> > > > > > > > build or returns errors on some omap2plus devices with the following
> > > > > > > > error:
> > > > > > > >
> > > > > > > >     nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > > > > > > >     nand: Micron MT29F4G16ABBDA3W
> > > > > > > >     nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > > > > > > >     nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > > > > > > >     Invalid ECC layout
> > > > > > > >     omap2-nand 30000000.nand: unable to use BCH library
> > > > > > > >     omap2-nand: probe of 30000000.nand failed with error -22
> > > > > > > >     8<--- cut here ---
> > > > > > > >
> > > > > > > > There are few commits using git bisect that have build errors, so it
> > > > > > > > wasn't possible for me to determine the exact commit that broke the
> > > > > > > > ECC.  If the build failed, I marked it as 'bad' to git bisect.  
> > > > > > >
> > > > > > > I am sorry to hear that, I regularly rebase with a make run between each
> > > > > > > pick and push my branches to a 0-day repository to have robots check
> > > > > > > for such errors, but sometimes I fail.
> > > > > > >  
> > > > > > > > Newer commits have remedied the build issue, but the Invalid ECC
> > > > > > > > layout error still exists as of 5.11-RC2.  
> > > > > > >
> > > > > > > Ok so let's focus on these.
> > > > > > >  
> > > > > > > > Do you have any suggestions on what I can do to remedy this?  I am
> > > > > > > > willing to try and test.  
> > > > > > >
> > > > > > > Glad to hear that.
> > > > > > >
> > > > > > > Can you share the NAND controller DT node you are using?
> > > > > > >
> > > > > > > Also, can you please add a few printk's like below and give me the
> > > > > > > output?  
> > > > > >
> > > > > > Will you have the time to check these soon? I am ready to help and
> > > > > > would like to fix it asap.  
> > > > >
> > > > > Sorry for the delay, I have to split my time with 3 different
> > > > > projects.  I am hoping to get you data later today.
> > > > >  
> > > > Miquel,
> > > >
> > > > Here is the dump from my boot sequence:
> > > >
> > > > [    2.629089] omap2-nand 30000000.nand: GPIO lookup for consumer rb
> > > > [    2.635253] omap2-nand 30000000.nand: using device tree for GPIO lookup
> > > > [    2.642150] of_get_named_gpiod_flags: parsed 'rb-gpios' property of node '/o)
> > > > [    2.653900] gpio gpiochip6: Persistence not supported for GPIO 0
> > > > [    2.660339] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > > > [    2.666900] nand: Micron MT29F4G16ABBDA3W
> > > > [    2.670959] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB si4
> > > > [    2.678710] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > > > [    2.684234] writesize 2048, step_size 512, nsteps 4
> > > > [    2.689300] strength 8, step size 512, code_size 13  
> > >
> > > Until here, everything looks fine.
> > >  
> > > > [    2.696807] count eccbytes 0  
> > >
> > > This is the cause of the error, the MTD OOB layout reports not ECC byte.
> > >
> > > Can you please check that we effectively call the large page helpers
> > > (in particular nand_ooblayout_ecc_lp()) . I bet this function returns
> > > -ERANGE on its first call, which reduces the eccbytes variable above to
> > > zero.  
> >
> > I will do what I can, but I am out of my element with this mtd and nand stuff.
> >
> > I added a printk to the beginning of nand_ooblayout_ecc_lp() and it's
> > not appearing, so I wonder if nand_ooblayout_ecc_lp() is not getting
> > called.
> >
> > I also added some printk's to the drivers/mtd/nand/raw/omap2.c to see
> > what's being defined for section and ecc.steps.
> >
> > [    2.621978] mtdoops: mtd device (mtddev=name/number) must be supplied
> > [    2.629699] omap2-nand 30000000.nand: GPIO lookup for consumer rb
> > [    2.635864] omap2-nand 30000000.nand: using device tree for GPIO lookup
> > [    2.642761] of_get_named_gpiod_flags: parsed 'rb-gpios' property of
> > node '/ocp@68000000/gpmc@6e000000/nand@0,0[0]' - status (0)
> > [    2.654510] gpio gpiochip6: Persistence not supported for GPIO 0
> > [    2.660949] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > [    2.667510] nand: Micron MT29F4G16ABBDA3W
> > [    2.671569] nand: 512 MiB, SLC, erase size: 128 KiB, page size:
> > 2048, OOB size: 64
> > [    2.679321] nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > [    2.684844] writesize 2048, step_size 512, nsteps 4
> > [    2.689910] strength 8, step size 512, code_size 13
> > [    2.694824] nand->ecc.ctx.total = 52
> > [    2.700988] omap_sw_ooblayout_ecc section 0, chip->ecc.steps 0
> >
> > omap_sw_ooblayout_ecc() returns -ERANGE if section => chip->ecc.steps
> > which appears to be the case here.
> >
> > Is it safe to assume that ecc.steps should be 4 if nsteps is 4?
> >
> > [    2.707031] count eccbytes 0
> > [    2.709930] omap_sw_ooblayout_ecc section 0, chip->ecc.steps 0
> > [    2.715820] Invalid ECC layout
> > [    2.719055] omap2-nand 30000000.nand: unable to use BCH library
> > [    2.725067] omap2-nand: probe of 30000000.nand failed with error -22
> > [    2.738983] 8<--- cut here ---
> >  
> > >
> > > What is strange is that, the only reason this would happen (to my eyes)
> > > is nand->ecc.ctx.total being 0. Can you please check its effective
> > > value?  
> >
> > [    2.694824] nand->ecc.ctx.total = 52
> >  
> > >
> > > I do not see the immediate reason because nand->ecc.ctx.total is set to
> > > nsteps (4) * code_size (13) right before calling
> > > mtd_ooblayout_count_eccbytes().
> > >
> > > Can you please verify my sayings and perhaps tackle the root cause of
> > > this issue? Please do not hesitate to ask questions, I'll do my best to
> > > help because this is a critical section that is not only breaking
> > > OMAP boards, unfortunately.  
> 
> I appear to have the NAND flash working with the following patch:
> 
> @@ -247,11 +253,21 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
>         nand->ecc.ctx.priv = engine_conf;
>         nand->ecc.ctx.total = nsteps * code_size;
> 
> +       struct nand_chip *chip = mtd_to_nand(mtd);
> +       chip->ecc.steps = nsteps;
> +       chip->ecc.size =  conf->step_size;
> 
> I am guessing it's not exactly what you want, but appears that the
> ecc.steps and ecc.size wasn't getting propagated to the mtd layer, so
> when omap_sw_ooblayout_ecc() was called, those fields were blank.
> 
> If you have a suggestion on how you want this implemented, I can push a patch.

Great, I'll check more deeply why is this happening and get back to you
early next week.

Thanks,
Miquèl
