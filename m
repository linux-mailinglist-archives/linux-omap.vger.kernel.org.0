Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BEC2F3309
	for <lists+linux-omap@lfdr.de>; Tue, 12 Jan 2021 15:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbhALOgU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 12 Jan 2021 09:36:20 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:45053 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731880AbhALOgU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Jan 2021 09:36:20 -0500
X-Greylist: delayed 101707 seconds by postgrey-1.27 at vger.kernel.org; Tue, 12 Jan 2021 09:36:19 EST
X-Originating-IP: 109.220.210.98
Received: from xps13 (lfbn-tou-1-1619-98.w109-220.abo.wanadoo.fr [109.220.210.98])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 99CD140002;
        Tue, 12 Jan 2021 14:35:35 +0000 (UTC)
Date:   Tue, 12 Jan 2021 15:35:34 +0100
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
Message-ID: <20210112153534.5ba93cde@xps13>
In-Reply-To: <20210111112027.7cbda0ba@xps13>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
        <20200929230124.31491-5-miquel.raynal@bootlin.com>
        <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
        <20210111112027.7cbda0ba@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 11 Jan 2021
11:20:27 +0100:

> Hi Adam,
> 
> Adam Ford <aford173@gmail.com> wrote on Sat, 9 Jan 2021 08:46:44 -0600:
> 
> > On Tue, Sep 29, 2020 at 6:09 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:  
> > >
> > > The NAND BCH control structure has nothing to do outside of this
> > > driver, all users of the nand_bch_init/free() functions just save it
> > > to chip->ecc.priv so do it in this driver directly and return a
> > > regular error code instead.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---    
> > 
> > Starting with this commit:  3c0fe36abebe, the kernel either doesn't
> > build or returns errors on some omap2plus devices with the following
> > error:
> > 
> >     nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> >     nand: Micron MT29F4G16ABBDA3W
> >     nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> >     nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> >     Invalid ECC layout
> >     omap2-nand 30000000.nand: unable to use BCH library
> >     omap2-nand: probe of 30000000.nand failed with error -22
> >     8<--- cut here ---
> > 
> > There are few commits using git bisect that have build errors, so it
> > wasn't possible for me to determine the exact commit that broke the
> > ECC.  If the build failed, I marked it as 'bad' to git bisect.  
> 
> I am sorry to hear that, I regularly rebase with a make run between each
> pick and push my branches to a 0-day repository to have robots check
> for such errors, but sometimes I fail.
> 
> > Newer commits have remedied the build issue, but the Invalid ECC
> > layout error still exists as of 5.11-RC2.  
> 
> Ok so let's focus on these.
> 
> > Do you have any suggestions on what I can do to remedy this?  I am
> > willing to try and test.  
> 
> Glad to hear that.
> 
> Can you share the NAND controller DT node you are using?
> 
> Also, can you please add a few printk's like below and give me the
> output?

Will you have the time to check these soon? I am ready to help and
would like to fix it asap.

Cheers,
Miquèl
