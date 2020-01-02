Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0820012EAA4
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 20:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgABTvN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 14:51:13 -0500
Received: from muru.com ([72.249.23.125]:49978 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728260AbgABTvN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jan 2020 14:51:13 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 942208087;
        Thu,  2 Jan 2020 19:51:52 +0000 (UTC)
Date:   Thu, 2 Jan 2020 11:51:08 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?utf-8?B?QW5kcsOp?= Hentschel <nerv@dawncrow.de>,
        Adam Ford <aford173@gmail.com>, linux@arm.linux.org.uk,
        robh+dt@kernel.org, mark.rutland@arm.com, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Add omap3-echo
Message-ID: <20200102195108.GF16702@atomide.com>
References: <20191224161005.28083-1-nerv@dawncrow.de>
 <20191224184503.GK35479@atomide.com>
 <60412339-53BF-4DC1-8AF6-4FB0E75D429C@goldelico.com>
 <53e6cbbd-1094-cba2-4942-981502a738d4@dawncrow.de>
 <20191230172948.GL35479@atomide.com>
 <55E6481C-2137-4086-ACDF-5F7D86E41A21@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55E6481C-2137-4086-ACDF-5F7D86E41A21@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191231 08:16]:
> > Am 30.12.2019 um 18:29 schrieb Tony Lindgren <tony@atomide.com>:
> > And let's also add minimal dm3725.dtsi, am3715.dtsi and am3703.dtsi
> > to make things simple.
> 
> Well, is that "simple"?

Well simple from "adding support for a new device in most case" point
of view yes..

> We also have to add omap3503, omap3515, omap3520, omap3530.dtsi.
> And probably am3351,2,4,6,7,8,9 variants with different capabilities
> (PRU, SGX, CAN, ZCZ ports to name some).
> 
> And to be correct, there should be a different "compatible".

..and yes the number of permutations quickly gets out of control :)

The SoC specific compatibles should be there though. So everybody,
please keep adding them as we encounter the missing ones.

Note that we don't seem to have much any feature detection for the
newer TI parts. At least am4 and dra7 already rely on
of_machine_is_compatible() checks for omap_hwmod_43xx_data.c and
omap_hwmod_7xx_data.c.

> Rob asked me when reviewing the pvrsgx bindings if the img,5xx variants
> can be autodetected to reduce bindings complexity.

Yes also dynamic detection is needed, and we do have that working
for many SoCs. The use in ti-sysc driver is still missing though,
and newer SoCs never had feature detection added.

> > The device tree is supposed to describe the
> > hardware, and in most cases the SoC version is fixed and need no
> > dynamic detection.
> 
> There may be exactly the same board populated with either one since
> they are drop-in pin compatible. So this may proliferate to the
> board.dts files and u-boot can have to load different .dtb.

Yeah. I'm afraid we're already depending for bootloader picking
the right dtb for many cases, such as capes etc.

Regards,

Tony
