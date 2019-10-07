Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 259A9CEADE
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbfJGRq1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:46:27 -0400
Received: from muru.com ([72.249.23.125]:35754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728793AbfJGRq1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 13:46:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9F8D68191;
        Mon,  7 Oct 2019 17:46:58 +0000 (UTC)
Date:   Mon, 7 Oct 2019 10:46:22 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Emmanuel Vadot <manu@bidouilliste.com>
Cc:     Emmanuel Vadot <manu@freebsd.org>, bcousson@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Set status to disable for MMC3
Message-ID: <20191007174622.GW5610@atomide.com>
References: <20191007080339.57209-1-manu@freebsd.org>
 <20191007161634.GS5610@atomide.com>
 <20191007183830.71e1303d6bd713014dc36710@bidouilliste.com>
 <20191007165859.GV5610@atomide.com>
 <20191007192922.7ce3423bd1fd03551487e907@bidouilliste.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007192922.7ce3423bd1fd03551487e907@bidouilliste.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Emmanuel Vadot <manu@bidouilliste.com> [191007 17:30]:
> On Mon, 7 Oct 2019 09:58:59 -0700
> Tony Lindgren <tony@atomide.com> wrote:
> > There should be no need to do that for SoC internal devices, the
> > the default status = "okay" should be just fine. Setting the
> > status = "disabled" for SoC internal devices and then enabling them
> > again for tens of board specific dts files just generates tons of
> > pointless extra churn for the board specific configuration.
> 
>  Setting the status = "okay" means that you can use the device. What's
> the point of enabling a device if you can't use it ? Or worse can't
> probe it like i2c or spi ?

The main reasons for not setting SoC internal devices with
status = "disabled" are:

1. The SoC internal device is there for sure and also accessible
   for the kernel

2. Setting an SoC internal device with status = "disabled" makes
   the kernel completely ignore it and it cannot be idled for PM
   if left on from the bootloader

3. We avoid tens of lines of pointess repetive status = "okay"
   tinkering for multiple devices per each board specic dts file
   making them more readable and easier to maintain

>  Is the plan for TI dts to have every (or almost) device tree node
> enabled even if the device isn't usable on the board ?

This has always been the case with omap3, 4, and 5. I don't
know when folks started tagging am33xx SoC internal devices as
disabled but that should have never been necessary.

Few years back I suggested some patches for status = "incomplete"
to deal with cases where the device is there but not pinned
out or otherwise not complete. But so far we've gotten away
without that, so probably not needed.

> > >  In this case it's FreeBSD being  because (I think) we have bad support
> > > for the clocks for this module so we panic when we read from it as the
> > > module isn't clocked. And since I find it wrong to have device enabled
> > > while it isn't present I've sent this patch.
> > 
> > Thanks for clarifying what happens. OK, sounds like FreeBSD might be
> > missing clock handling for some devices then.
> > 
> > What Linux does is probe the internal devices and then idle the
> > unused ones as bootloaders often leave many things enabled. Otherwise
> > the SoC power management won't work properly because device clocks
> > will block deeper SoC idle states.
> 
>  I can understand stand but then the bootload should be fixed to not
> enable devices that aren't enabled in the DTS if it does that.

This is not doable as in many cases the bootloader cannot be
updated as it can be signed for phones like n900 and droid4.

Regards,

Tony
