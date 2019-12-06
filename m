Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA945115717
	for <lists+linux-omap@lfdr.de>; Fri,  6 Dec 2019 19:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfLFSUo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Dec 2019 13:20:44 -0500
Received: from muru.com ([72.249.23.125]:44270 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbfLFSUo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Dec 2019 13:20:44 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 277C08047;
        Fri,  6 Dec 2019 18:21:22 +0000 (UTC)
Date:   Fri, 6 Dec 2019 10:20:40 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken
 omap2_set_init_voltage()
Message-ID: <20191206182040.GH35479@atomide.com>
References: <20190924233222.52757-1-tony@atomide.com>
 <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com>
 <20191202213929.GB35479@atomide.com>
 <EE749881-C3DB-4BBE-85FE-E5AF3D34884F@goldelico.com>
 <BAF5B057-1017-4174-8C3F-4B49B31E2E0D@goldelico.com>
 <20191203154447.GC35479@atomide.com>
 <5F430C0D-7F25-4680-87B9-2D65A08A9F83@goldelico.com>
 <FB42ED12-5DDB-4A9E-941A-ACBE2C10C36A@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FB42ED12-5DDB-4A9E-941A-ACBE2C10C36A@goldelico.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191203 16:55]:
> > What we could do is augment the printk (or dev_err) to tell
> > in these warnings what it is looking for...
> > 
> > 	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> > 	if (IS_ERR(opp)) {
> > 		pr_err("%s: unable to find boot up OPP for vdd_%s freq %ulHz\n",
> > 		__func__, vdd_name, freq);
> > 		goto exit;
> > 	}
> 
> Easier and always prints info:
> 
> 	freq = clk_get_rate(clk);
> 	clk_put(clk);
> 
> 	pr_info("%s: vdd=%s clk=%s %luHz oh=%s\n", __func__, vdd_name, clk_name, freq, oh_name);
> 
> 	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> 
> I get this:
> 
> [    2.908142] omap2_set_init_voltage: vdd=mpu_iva clk=dpll1_ck 1000000000Hz oh=mpu
> [    2.930816] omap2_set_init_voltage: vdd=core clk=l3_ick 200000000Hz oh=l3_main
> [    2.946228] omap2_set_init_voltage: unable to find boot up OPP for vdd_core
> [    2.953460] omap2_set_init_voltage: unable to set vdd_core

OK yeah that's more descriptive.

> Which means that cpufreq already has increased dpll1_ck to 1 GHz
> (I have removed the turbo-mode tags so that it already boots at
> full speed) and l3_ick runs at initial 200 MHz.

OK. I wonder where this initial code should live though..

Regards,

Tony
