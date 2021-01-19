Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FAC2FC3ED
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 23:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbhASWkh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 19 Jan 2021 17:40:37 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48231 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732056AbhASOhZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Jan 2021 09:37:25 -0500
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2D6A1C000B;
        Tue, 19 Jan 2021 14:36:32 +0000 (UTC)
Date:   Tue, 19 Jan 2021 15:36:31 +0100
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
Message-ID: <20210119153521.7d5de79d@xps13>
In-Reply-To: <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
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
        <20210119125634.6d4c5c1e@xps13>
        <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> > ---8<---
> >
> > Author: Miquel Raynal <miquel.raynal@bootlin.com>
> > Date:   Tue Jan 19 12:27:07 2021 +0100
> >
> >     wip: fix omap
> >
> >     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >  
> Thanks for fixing this.
> 
> I tested your patch, and I no longer get a Panic and the MTD device
> appears to appear correctly:
> 
> mtdoops: mtd device (mtddev=name/number) must be supplied
> omap2-nand 30000000.nand: GPIO lookup for consumer rb
> omap2-nand 30000000.nand: using device tree for GPIO lookup
> of_get_named_gpiod_flags: parsed 'rb-gpios' property of node
> '/ocp@68000000/gpmc@6e000000/nand@0,0[0]' - status (0)
> gpio gpiochip6: Persistence not supported for GPIO 0
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> nand: Micron MT29F4G16ABBDA3W
> nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> 6 cmdlinepart partitions found on MTD device omap2-nand.0
> Creating 6 MTD partitions on "omap2-nand.0":
> ...

Good to know. Can you just tell me if the values of
- chip->ecc.bytes vs. engine_conf->code_size
- chip->ecc.steps vs. engine_conf->nsteps
are the same in both cases (your patch and mine)? Otherwise your data
might appear corrupted somehow.

> 
> When you submit a formal patch, CC me on the patch, and I'll respond
> with a 'tested-by'

Of course, I'll also add a Reported-by.

Thanks,
Miquèl
