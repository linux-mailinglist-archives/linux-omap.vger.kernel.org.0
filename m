Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826372FBA6C
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 15:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391670AbhASOyu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 19 Jan 2021 09:54:50 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:59767 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392013AbhASL5Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Jan 2021 06:57:25 -0500
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D9F244000C;
        Tue, 19 Jan 2021 11:56:35 +0000 (UTC)
Date:   Tue, 19 Jan 2021 12:56:34 +0100
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
Message-ID: <20210119125634.6d4c5c1e@xps13>
In-Reply-To: <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
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
        <20210115171736.1c837c29@xps13>
        <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

Thank you very much for troubleshooting this, here is my proposal.

> > > I appear to have the NAND flash working with the following patch:
> > >
> > > @@ -247,11 +253,21 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
> > >         nand->ecc.ctx.priv = engine_conf;
> > >         nand->ecc.ctx.total = nsteps * code_size;
> > >
> > > +       struct nand_chip *chip = mtd_to_nand(mtd);
> > > +       chip->ecc.steps = nsteps;
> > > +       chip->ecc.size =  conf->step_size;

I was fearing that many boards would be affected by this issue but it
appears that the problem will only show up here because the OMAP driver
makes a strange use of the BCH library: it initializes it itself
because it only needs it for a single operation while usually, the core
is in charge of doing that. During the initialization, the OOB layout
is verified. Usually, the BCH driver is used with one of the generic OOB
layouts, while here the OMAP driver uses its own, which reads raw NAND
chip entries.

I recently moved the BCH driver to only use "generic" NAND bits, which
produced the bug because the entries derived by the layout helpers
have not been updated yet.

So using raw NAND bits in the BCH driver is not an option here.
Instead, I think the best way to address this is to export the
declaration of the BCH internal configuration structure to the OMAP
driver and use the right values, recently derived by the driver:

---8<---

Author: Miquel Raynal <miquel.raynal@bootlin.com>
Date:   Tue Jan 19 12:27:07 2021 +0100

    wip: fix omap
    
    Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index fbb9955f2467..2c3e65cb68f3 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -15,6 +15,7 @@
 #include <linux/jiffies.h>
 #include <linux/sched.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/omap-dma.h>
@@ -1866,18 +1867,19 @@ static const struct mtd_ooblayout_ops omap_ooblayout_ops = {
 static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
                                 struct mtd_oob_region *oobregion)
 {
-       struct nand_chip *chip = mtd_to_nand(mtd);
+       struct nand_device *nand = mtd_to_nanddev(mtd);
+       const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
        int off = BADBLOCK_MARKER_LENGTH;
 
-       if (section >= chip->ecc.steps)
+       if (section >= engine_conf->nsteps)
                return -ERANGE;
 
        /*
         * When SW correction is employed, one OMAP specific marker byte is
         * reserved after each ECC step.
         */
-       oobregion->offset = off + (section * (chip->ecc.bytes + 1));
-       oobregion->length = chip->ecc.bytes;
+       oobregion->offset = off + (section * (engine_conf->code_size + 1));
+       oobregion->length = engine_conf->code_size;
 
        return 0;
 }
@@ -1885,7 +1887,8 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
                                  struct mtd_oob_region *oobregion)
 {
-       struct nand_chip *chip = mtd_to_nand(mtd);
+       struct nand_device *nand = mtd_to_nanddev(mtd);
+       const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
        int off = BADBLOCK_MARKER_LENGTH;
 
        if (section)
@@ -1895,7 +1898,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
         * When SW correction is employed, one OMAP specific marker byte is
         * reserved after each ECC step.
         */
-       off += ((chip->ecc.bytes + 1) * chip->ecc.steps);
+       off += ((engine_conf->code_size + 1) * engine_conf->nsteps);
        if (off >= mtd->oobsize)
                return -ERANGE;
 
--->8---

Can you please try this patch and compare the values between your hack
and mine of:
- chip->ecc.bytes vs. engine_conf->code_size
- chip->ecc.steps vs. engine_conf->nsteps
The values should be the same, but I prefer to be sure.

Thanks,
Miquèl
