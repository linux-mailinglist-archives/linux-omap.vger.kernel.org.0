Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52C0211017F
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2019 16:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfLCPow (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Dec 2019 10:44:52 -0500
Received: from muru.com ([72.249.23.125]:44012 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbfLCPow (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Dec 2019 10:44:52 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E047F804F;
        Tue,  3 Dec 2019 15:45:28 +0000 (UTC)
Date:   Tue, 3 Dec 2019 07:44:47 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Nishanth Menon <nm@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken
 omap2_set_init_voltage()
Message-ID: <20191203154447.GC35479@atomide.com>
References: <20190924233222.52757-1-tony@atomide.com>
 <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com>
 <20191202213929.GB35479@atomide.com>
 <EE749881-C3DB-4BBE-85FE-E5AF3D34884F@goldelico.com>
 <BAF5B057-1017-4174-8C3F-4B49B31E2E0D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BAF5B057-1017-4174-8C3F-4B49B31E2E0D@goldelico.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191203 12:31]:
> Ok, dev_pm_opp_find_freq_ceil() is doing what it should do and it
> returns the first OPP higher or equal than the frequency passed in.
>
> The real reason for the warning is that the same OPP table is used
> for vdd_mpu_iva and vdd_core and it appears as if "core" (l3_ick)
> runs at 200 MHz which does not correspond to a valid OPP.

OK

> So to silcence the warning it suffices to remove
> 
> 	omap2_set_init_voltage("core", "l3_ick", "l3_main");
> 
> The question is now what l3_ick has to do with the OPPs at all
> and how it should interwork with OPPs and cpufreq.

So what changed then for iva in your configuration then?

At least I'm getting errors for both for 34xx and dm3730 with
Linux next and reverted commit cf395f7ddb9e ("ARM: OMAP2+: Fix
warnings with broken omap2_set_init_voltage()"):

omap2_set_init_voltage: unable to find boot up OPP for vdd_mpu_iva
omap2_set_init_voltage: unable to set vdd_mpu_iva
omap2_set_init_voltage: unable to find boot up OPP for vdd_core
omap2_set_init_voltage: unable to set vdd_core

Then for fixing this code, seems like this can all happen from
a regular device driver init based on the dts data.. We've had
PM init completely ignore these errors already for years so
whatever dependency there might be seems non-critical :)

> Or does all this mean we may need a second OPP fable for vdd_core
> and 200 MHz? But what would it be good for? I have not seen any
> reference for "core-OPPs" in the TRM.

OK yeah sounds like all the domains need an opp table.

Also, I recall some SoCs having a dependency between having to
run DSP at a lower rate for higher MPU rates, not sure if omap3
has such dependencies though.

Regards,

Tony
