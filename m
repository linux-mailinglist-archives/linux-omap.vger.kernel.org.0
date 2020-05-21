Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0141DC555
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 04:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgEUCou (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 May 2020 22:44:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35372 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgEUCou (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 May 2020 22:44:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04L2ijIG030008;
        Wed, 20 May 2020 21:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590029085;
        bh=NqKdhordHZP/Q/7Ru5RjYnoYJ1MquHGB1dM+8pNPGgo=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=gV0z3QRnzIM0LXUxa6zA6Tko5weHABgo9Hvg61UYFBu2oWrBhCe35jSU0YxDHeFDW
         wXBgWIlvABHYAmYjFQ+k7vKWHAOOURQJ8EBh1pvNftEX7nbJox5GqgwgZM8hohu2wE
         t5XYP/fx3r1HwkvnXZbH4egmjrq6sO/f5Oan2NR0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04L2ijoU005217
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 21:44:45 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 21:44:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 21:44:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04L2ijAo018764;
        Wed, 20 May 2020 21:44:45 -0500
Date:   Wed, 20 May 2020 21:44:45 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Adam Ford <aford173@gmail.com>
CC:     Sekhar Nori <nsekhar@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: AM3517 MUSB and CPPI
Message-ID: <20200521024445.GC5684@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Adam Ford <aford173@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
References: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
 <fedbed5e-8365-85ab-9b81-2ec25ffa64b4@ti.com>
 <CAHCN7x+E3YrRFerzOHKOQHfx67g=ANESuopskKpZHX5qBx_fHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHCN7x+E3YrRFerzOHKOQHfx67g=ANESuopskKpZHX5qBx_fHQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

First of all for my curiosity, what motivates you to bring up the AM3517
MUSB support up to date?

Though I maintain the musb drivers, I don't know much about the devices
other than AM335x. But I spent a little time looked at the drivers and
the TRM, here is what I thought.

Your query below seems showing that you are trying to bring up the CPPI41
support for AM3517 MUSB, but have you got the glue driver working in PIO
mode yet? It seems to be quite amount of effort to get PIO mode working.
The glue driver am35x.c is there but it doesn't support device tree. The
dts am3517.dtsi defines the musb node with 'ti,omap3-musb' compatible,
which seems not right, at least internal phy vs external phy, comparing
with omap3 musb. am3517.dtsi also misses some required musb properties.
So I am not sure which glue driver should be used for AM3517 MUSB.

I also looked the CPPI section in the TRM, yes, the scheduler register
base offset should be 0x2000, and the queue manager register base offset
should be 0x4000. But I think the CDMA controller register base should
be 0x1800, not 0x1000 as shown in Table 20-9. However the register
layout in these 3 segments are quite different from those on AM335x, so
it seems the CPPI41 dmaengine driver need some work as well to support
AM3517 CPPI.

-Bin.

On Mon, May 18, 2020 at 05:19:32AM -0500, Adam Ford wrote:
> On Mon, May 18, 2020 at 12:35 AM Sekhar Nori <nsekhar@ti.com> wrote:
> >
> > + Bin who maintains MUSB controller support
> >
> > On 5/18/20 8:17 AM, Adam Ford wrote:
> > > From what I can tell, the MUSB controller on the AM3517 hasn't worked
> > > in a very long time.
> 
> Thanks for adding Bin.
> 
> I can post of code patches as an RFC if interested.  They don't work
> any better, but they don't work any worse either.
> 
> I have modifications to the am35x glue to support cppi41, cppi41 to
> support am35, and updates to the device tree to point the musb
> controller to the am35 glue with additions for cppi41 references and
> some additional clocks.
> 
> adam
> 
> > >
> > > I have been going through the TRM for the AM3517, and I am convinced
> > > the device tree for the OTG port is wrong, but I am struggling to fix
> > > it.
> > >
> > > From what I can see the USB OTG Port support the CPPI 4.1 DMA
> > > controller, but the CPPI 4.1 only appears to support the
> > > DA850/OMAP-L138 and the AM335x family.
> > >
> > > It appears as if the AM35xx is a bit closer in behavior to the AM335x
> > > than the L138, but I was hoping either Tony, Tero or someone from TI
> > > might have a suggestion.
> > >
> > > The compatible flag need to be something like "compatible =
> > > "ti,am35xx-musb" and not omap3, because OMAP3 doesn't support the CPPI
> > > 4.1 DMA controller and the AM3517 does.
> > >
> > > Secondly, we need to update a couple of the tables in the cppi driver
> > > to support the am3517, and lastly, the device tree node needs to
> > > support the CPPI driver.
> > >
> > > It looks like the DA850/L138 makes the CPPI driver a sub-node of the
> > > OTG port, while the am335x has it as a separate node from the USB
> > > controller.
> > >
> > > From what I can tell on the AM3517, the CPPI DMA node should be a
> > > sub-node of the OTG.
> > >
> > > What I am struggling with now is the register offsets for controller,
> > > scheduler and queue manager.
> > > On both DA850 the 335x, there is an explicit table entry showing the
> > > offset of DMAREVID, which tells the DMA revision ID.  I cannot find a
> > > corresponding register for the AM3517, yet the AM3517
> > >
> > > FWICT, the scheduler is offset 0x2000 with respect to the OTG
> > > controller, and the Queue Manager register is at 0ffset 0x4000, both
> > > with respect to the OTG base address.  Unfortunately, I am not finding
> > > the offset for the CDMA controller itself.
> > >
> > > Can someone tell me what it should be?  I am guessing it would be near
> > > the 0x1000 offset, but it's a pure guess.
> > >
> > > adam
> > >
> >
