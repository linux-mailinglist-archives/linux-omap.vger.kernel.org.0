Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A54023DD66
	for <lists+linux-omap@lfdr.de>; Thu,  6 Aug 2020 19:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgHFRJB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Aug 2020 13:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729104AbgHFRGJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 Aug 2020 13:06:09 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839F4C00214A
        for <linux-omap@vger.kernel.org>; Thu,  6 Aug 2020 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID; bh=zJ14tixkLgo6d6X6SyepDRtNGMMREZY9Z2oJAQlxKB0=;
        b=fDbZqr47jEe9z5NRuA/gV1dA44r6De19uAK7fpy7gJUyYcrTkdmF4ggKO+Pbu/+XmjsME0KZnYdnurkvyysrKL4pDN74U+6TXiG+aTYNPfxtyB2hmjfI+OQawrfGWHzu/+FtSblBTnPhFk5IhHtaXb9oL1QoVmxJRQrRkObixtI=;
Received: from 97e0b068.skybroadband.com ([151.224.176.104] helo=archlinux)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k3iAU-0001a1-0X; Thu, 06 Aug 2020 11:50:58 -0400
Message-ID: <7ef4e081c1a0db81fd98f9e94afc6228a9b68703.camel@ds0.me>
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
From:   David Shah <dave@ds0.me>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Date:   Thu, 06 Aug 2020 16:50:49 +0100
In-Reply-To: <64416676-a2ea-f11e-4d07-51a3efb55cdd@ti.com>
References: <20200706143613.GS37466@atomide.com>
         <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
         <20200707180115.GB5849@atomide.com>
         <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
         <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
         <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
         <20200724012411.GJ21353@pendragon.ideasonboard.com>
         <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
         <20200801232259.hitcfosiq6f2i57y@earth.universe>
         <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
         <20200805112831.akufm5wxkwqehiff@earth.universe>
         <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com>
         <64416676-a2ea-f11e-4d07-51a3efb55cdd@ti.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I had a moment to give letux-5.7.y a test on the Pyra hardware.

I notice an error in dmesg:

 DSI: omapdss DSI error: unsupported DSI module

which comes from this code (with a small patch added by me):

	d = dsi->data->modules;
	while (d->address != 0 && d->address != dsi_mem->start)
		d++;

	if (d->address == 0) {
		DSSERR("unsupported DSI module (start: %08x)\n",
dsi_mem->start);
		return -ENODEV;
	}

"start" here is c0b3ba5c - a kernel virtual address - which definitely
doesn't seem right as it would never match. 

Not sure my kernel-fu is quite up to tracking this down yet, but I will
keep trying to trace out what is happening.

Best

Davidg

On Wed, 2020-08-05 at 15:08 +0300, Tomi Valkeinen wrote:
> On 05/08/2020 14:49, H. Nikolaus Schaller wrote:
> > Hi,
> > 
> > > Am 05.08.2020 um 13:28 schrieb Sebastian Reichel <
> > > sebastian.reichel@collabora.com>:
> > > 
> > > Hi,
> > > 
> > > On Wed, Aug 05, 2020 at 11:19:20AM +0200, H. Nikolaus Schaller
> > > wrote:
> > > > What I do not yet understand is how Laurent's patch should be
> > > > able
> > > > to break it.
> > > 
> > > omapdrm will not probe successfully if any DT enabled component
> > > does not probe correctly. Since the patch you identified touched
> > > HDMI and VENC and you are probably using HDMI, I suggest looking
> > > there first.
> > 
> > Yes, that is a very good explanation.
> > 
> > Maybe there is a subtle change in how the HDMI connector has to be
> > defined
> > which is missing in our (private) DTB. Maybe the OMAP5-uEVM DTS
> > gives a hint.
> > 
> > A quick check shows last hdmi specific change for omap5-board-
> > common or uevm
> > was in 2017 but I may have missed something.
> > 
> > There are 715a5a978733f0 and 671ab615bd507f which arrived in v5.7-
> > rc1 as well
> > and are related to hdmi clocks. So this may be (or not) and
> > influencing factor.
> 
> HDMI should "just work", and has been tested. But maybe there's some
> conflict with HDMI and DSI.
> 
>  Tomi
> 

