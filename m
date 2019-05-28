Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788112C300
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 11:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfE1JTs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 05:19:48 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41460 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE1JTs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 05:19:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S9JYYP045555;
        Tue, 28 May 2019 04:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559035174;
        bh=0SQ34B5HOk35t1pLSe3ahubUcB7ram5G3YhycY8CAJg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aDq+pfi9k3q3a03MktomO1TfKh6WV1BHBSvKtRK1zSG+Dqs4sdVVnVvC1nl+HGDlt
         4SnZX9Ai7OabF0RGFEdd1Vq6qel1S1Cr03lnrING3JBh9jC5vGA8e3Ub4gcECgZY9J
         EvtAoxram2CCOy0qJeWfPhNMH2gsCPyH+NTondtM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S9JYKi065704
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 04:19:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 04:19:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 04:19:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S9JVYM068155;
        Tue, 28 May 2019 04:19:31 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To:     Tony Lindgren <tony@atomide.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>,
        Keerthy <j-keerthy@ti.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
Date:   Tue, 28 May 2019 12:19:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527112122.GJ5447@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/05/2019 14:21, Tony Lindgren wrote:

>> Looks good to me. For some reason I can't boot 5.2-rc2 (on x15) so I haven't
>> been able to test yet. I'll pick the series up in any case, and I'll test it
>> when I get the kernel booting.
> 
> Great good to have these merged finally :)
> 
> Hmm I wonder if some x15 models are affected by the SoC variant
> changes queued in my fixes branch?

This is what I see with earlycon, on linux-omap fixes branch. I think this looks
similar to what I saw with dra76 _without_ the fixes.

[    1.290771] Unable to handle kernel paging request at virtual address 5a5a5a5a
[    1.298222] pgd = (ptrval)
[    1.301002] [5a5a5a5a] *pgd=00000000
[    1.304695] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    1.310158] Modules linked in:
[    1.313300] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc1-00016-g43069e68f162-dirty #7
[    1.321979] Hardware name: Generic DRA74X (Flattened Device Tree)
[    1.328256] PC is at clk_hw_create_clk.part.33+0x8/0x94
[    1.333632] LR is at sysc_notifier_call+0x98/0x138
[    1.338558] pc : [<c0554118>]    lr : [<c04fb514>]    psr: 00000013
[    1.345001] sp : eb8f7c78  ip : 5a5a5a5a  fp : c0b3b538
[    1.350374] r10: 00000001  r9 : 00000000  r8 : 00000000
[    1.355746] r7 : eaab8340  r6 : eaabea10  r5 : cffea79c  r4 : 00000000
[    1.362459] r3 : cffea79c  r2 : eaabc8c0  r1 : 5a5a5a5a  r0 : eaabea10
[    1.369174] Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    1.376513] Control: 10c5387d  Table: 8000406a  DAC: 00000051
[    1.382422] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    1.388599] Stack: (0xeb8f7c78 to 0xeb8f8000)
[    1.393077] 7c60:                                                       00000000 cffea79c
[    1.401493] 7c80: eaabea10 c04fb514 c0e76c6c fffffffd 00000000 00000001 00000000 eaabea10
[    1.409905] 7ca0: 00000001 c015cee8 ffffffff 00000001 eb8dfb80 eaabea10 c0e05148 00000000
[    1.418319] 7cc0: 00000000 c0e2e4f0 00000000 c015d684 00000000 00000000 eaabea10 00000000
[    1.426732] 7ce0: eb93c810 c05b97e4 00000000 00000000 00000000 0fee2f56 00000000 0fee2f56
[    1.435143] 7d00: 00000000 eaabea00 00000000 eb93c810 efdbfd0c 00000000 00000001 c078edb0
[    1.443557] 7d20: efdbfcc0 00000000 00000000 c0e05148 c0e2e390 c078ef88 eb93ca8c 00000000
[    1.451972] 7d40: c0a39b64 eb93c810 eb93c88c eb93ca8c c0e05148 c091b0c4 eb93c810 c05c9aac
[    1.460386] 7d60: c0f13ba4 60000013 c0a39b64 0fee2f56 c0a39b3c efdbfcc0 efdbfa3c c0a39b64
[    1.468800] 7d80: c0e2e390 eb93c810 00000001 00000000 c0a39b3c c078f2b8 00000001 0fee2f56
[    1.477213] 7da0: eaab8340 eaab8340 eb93c810 00000000 c0e05148 00000001 00000010 c04fc964
[    1.485627] 7dc0: 00000000 c0349714 c0e2e500 eb93c810 00000001 efdbfa3c ea9dfd28 00000000
[    1.494039] 7de0: 00000001 00000001 00000003 0fee2f56 00000001 eb93c810 00000000 c0e76c8c
[    1.502451] 7e00: 00000000 00000000 c0e76c8c c0eb8f30 00000000 c05c00e8 eb93c810 c0f0f35c
[    1.510865] 7e20: c0f0f360 00000000 00000000 c05bdc04 c0e76c8c eb93c810 c0eaf2a0 eb93c810
[    1.519278] 7e40: c0e76c8c c0e76c8c c0e05148 ffffe000 c0d5b834 000000d8 c0eaf2a0 c05be0b4
[    1.527692] 7e60: c0a39d00 a0000013 c0eaf2a0 eb93c810 00000000 c0e76c8c c0e05148 ffffe000
[    1.536104] 7e80: c0d5b834 c05be450 00000000 c0e76c8c eb93c810 c05be4fc eb9380b4 c0e76c8c
[    1.544516] 7ea0: c05be458 c05bbc24 c0eaf2a0 eb8dfb58 eb9380b4 0fee2f56 c0e76c8c c0e76c8c
[    1.552928] 7ec0: ea9e4280 c0e85338 00000000 c05bcf68 c0b7aa98 c0e05148 c0d36b20 c0e76c8c
[    1.561343] 7ee0: c0e05148 c0d36b20 00000000 c05bf0a0 c0eaf2a0 c0e05148 c0d36b20 c0102f88
[    1.569757] 7f00: c0c4e10c 00000000 efd9a82f c015a900 00000000 eb8f7f14 c0d004a8 00000006
[    1.578171] 7f20: 00000006 c0bc2e88 00000000 00000000 00000000 efd9a827 00000000 0fee2f56
[    1.586583] 7f40: c0eaf2a0 c0d004a8 00000006 0fee2f56 c0d770ec 00000007 c0d5b854 c0eca080
[    1.594997] 7f60: c0eca080 c0d01208 00000006 00000006 00000000 c0d004a8 c09145e0 00000000
[    1.603411] 7f80: 00000000 00000000 c09145e0 00000000 00000000 00000000 00000000 00000000
[    1.611823] 7fa0: 00000000 c09145e8 00000000 c01010e8 00000000 00000000 00000000 00000000
[    1.620237] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.628651] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    1.637074] [<c0554118>] (clk_hw_create_clk.part.33) from [<c04fb514>] (sysc_notifier_call+0x98/0x138)
[    1.646656] [<c04fb514>] (sysc_notifier_call) from [<c015cee8>] (notifier_call_chain+0x2c/0xa0)
[    1.655612] [<c015cee8>] (notifier_call_chain) from [<c015d684>] (blocking_notifier_call_chain+0x50/0x68)
[    1.665461] [<c015d684>] (blocking_notifier_call_chain) from [<c05b97e4>] (device_add+0x3bc/0x628)
[    1.674685] [<c05b97e4>] (device_add) from [<c078edb0>] (of_platform_device_create_pdata+0x90/0xbc)
[    1.683997] [<c078edb0>] (of_platform_device_create_pdata) from [<c078ef88>] (of_platform_bus_create+0x1a0/0x328)
[    1.694558] [<c078ef88>] (of_platform_bus_create) from [<c078f2b8>] (of_platform_populate+0x7c/0x108)
[    1.704046] [<c078f2b8>] (of_platform_populate) from [<c04fc964>] (sysc_probe+0x9dc/0xf98)
[    1.712552] [<c04fc964>] (sysc_probe) from [<c05c00e8>] (platform_drv_probe+0x48/0x98)
[    1.720700] [<c05c00e8>] (platform_drv_probe) from [<c05bdc04>] (really_probe+0x100/0x40c)
[    1.729205] [<c05bdc04>] (really_probe) from [<c05be0b4>] (driver_probe_device+0x6c/0x1b8)
[    1.737709] [<c05be0b4>] (driver_probe_device) from [<c05be450>] (device_driver_attach+0x58/0x60)
[    1.746836] [<c05be450>] (device_driver_attach) from [<c05be4fc>] (__driver_attach+0xa4/0x148)
[    1.755700] [<c05be4fc>] (__driver_attach) from [<c05bbc24>] (bus_for_each_dev+0x70/0xb4)
[    1.764116] [<c05bbc24>] (bus_for_each_dev) from [<c05bcf68>] (bus_add_driver+0x1a8/0x200)
[    1.772620] [<c05bcf68>] (bus_add_driver) from [<c05bf0a0>] (driver_register+0x74/0x108)
[    1.780948] [<c05bf0a0>] (driver_register) from [<c0102f88>] (do_one_initcall+0x48/0x29c)
[    1.789365] [<c0102f88>] (do_one_initcall) from [<c0d01208>] (kernel_init_freeable+0x304/0x3d8)
[    1.798317] [<c0d01208>] (kernel_init_freeable) from [<c09145e8>] (kernel_init+0x8/0x110)
[    1.806732] [<c09145e8>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
[    1.814516] Exception stack(0xeb8f7fb0 to 0xeb8f7ff8)
[    1.819711] 7fa0:                                     00000000 00000000 00000000 00000000
[    1.828124] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.836535] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    1.843342] Code: 000010ac c0b85b48 e92d4070 e1a06000 (e5915000) 
[    1.849647] ---[ end trace ddabd37e7aa3d908 ]---
[    1.854430] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.862311] CPU1: stopping
[    1.865098] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D           5.2.0-rc1-00016-g43069e68f162-dirty #7
[    1.875208] Hardware name: Generic DRA74X (Flattened Device Tree)
[    1.881487] [<c011394c>] (unwind_backtrace) from [<c010da7c>] (show_stack+0x10/0x14)
[    1.889460] [<c010da7c>] (show_stack) from [<c08fc9f4>] (dump_stack+0xa8/0xc4)
[    1.896895] [<c08fc9f4>] (dump_stack) from [<c01119d8>] (handle_IPI+0x3ec/0x450)
[    1.904510] [<c01119d8>] (handle_IPI) from [<c04f92b0>] (gic_handle_irq+0x94/0xa8)
[    1.912302] [<c04f92b0>] (gic_handle_irq) from [<c0101aac>] (__irq_svc+0x6c/0xa8)
[    1.919996] Exception stack(0xeb913f60 to 0xeb913fa8)
[    1.925193] 3f60: 000006c0 00000000 efd90be0 c011e480 ffffe000 c0e05168 00000002 c0e051ac
[    1.933608] 3f80: 00000000 c0e05148 00000000 c0e055b0 00000000 eb913fb0 c010a20c c010a210
[    1.942017] 3fa0: 60000013 ffffffff
[    1.945609] [<c0101aac>] (__irq_svc) from [<c010a210>] (arch_cpu_idle+0x30/0x3c)
[    1.953222] [<c010a210>] (arch_cpu_idle) from [<c016cdf0>] (do_idle+0x1d8/0x2a8)
[    1.960834] [<c016cdf0>] (do_idle) from [<c016d184>] (cpu_startup_entry+0x18/0x1c)
[    1.968623] [<c016d184>] (cpu_startup_entry) from [<8010270c>] (0x8010270c)
[    1.975793] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
