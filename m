Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5892B12D2C5
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 18:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbfL3RfM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 12:35:12 -0500
Received: from muru.com ([72.249.23.125]:49732 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfL3RfM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Dec 2019 12:35:12 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2EFF68027;
        Mon, 30 Dec 2019 17:35:51 +0000 (UTC)
Date:   Mon, 30 Dec 2019 09:35:07 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: Droid 4 on 5.5-rc3
Message-ID: <20191230173507.GM35479@atomide.com>
References: <20191228162929.GA29269@duo.ucw.cz>
 <20191228193622.GA13047@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191228193622.GA13047@duo.ucw.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [191228 19:37]:
> Hi!
> 
> > 5.4-based kernel works ok on my droid 4.
> > 
> > 5.5-rc3 based kernel has problems; it reboots when I try to kexec it.
> > 
> > Vanilla 5.5-rc3 reboots, too.
> > 
> > If you have any ideas, let me know.
> 
> I managed to get partial serial dump. This should be 5.5-rc3: And then
> a bit better serial dump (below). But it is silent for few seconds,
> and then it restarts...

If spi or regulators have problems, nothing will really work..

> 885955] ------------[ cut here ]------------                                    
> [    1.890624] WARNING: CPU: 0 PID: 1 at /data/fast/l/k/drivers/regulator/core.c
> [    1.900421] Modules linked in:                                               
> [    1.903533] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc3-00624-g46cf00
> [    1.911651] Hardware name: Generic OMAP4 (Flattened Device Tree)             
> [    1.917724] [<c010f1e4>] (unwind_backtrace) from [<c010b4b0>] (show_stack+0x)
> [    1.925537] [<c010b4b0>] (show_stack) from [<c08ecd18>] (dump_stack+0xb4/0xd)
> [    1.932800] [<c08ecd18>] (dump_stack) from [<c012db50>] (__warn+0xc8/0xf0)   
> [    1.939727] [<c012db50>] (__warn) from [<c012dc04>] (warn_slowpath_fmt+0x8c/)
> [    1.947235] [<c012dc04>] (warn_slowpath_fmt) from [<c0423b4c>] (_regulator_p)
> [    1.955474] [<c0423b4c>] (_regulator_put) from [<c0423b74>] (regulator_put+0)
> [    1.963348] [<c0423b74>] (regulator_put) from [<c04ddcbc>] (release_nodes+0x)
> [    1.971313] [<c04ddcbc>] (release_nodes) from [<c04d9e0c>] (really_probe+0x1)
> [    1.979187] [<c04d9e0c>] (really_probe) from [<c04da204>] (driver_probe_devi)
> [    1.987518] [<c04da204>] (driver_probe_device) from [<c04d8490>] (bus_for_ea)
> [    1.996093] [<c04d8490>] (bus_for_each_drv) from [<c04da11c>] (__device_atta)
> [    2.004394] [<c04da11c>] (__device_attach) from [<c04d91b4>] (bus_probe_devi)
> [    2.012634] [<c04d91b4>] (bus_probe_device) from [<c04d7370>] (device_add+0x)
> [    2.020599] [<c04d7370>] (device_add) from [<c04dbb04>] (platform_device_add)
> [    2.028747] [<c04dbb04>] (platform_device_add) from [<c0503a34>] (mfd_add_de)
> [    2.037414] [<c0503a34>] (mfd_add_devices) from [<c0503b4c>] (devm_mfd_add_d)
> [    2.045989] [<c0503b4c>] (devm_mfd_add_devices) from [<c0503f40>] (cpcap_pro)
> [    2.054382] [<c0503f40>] (cpcap_probe) from [<c054b4ac>] (spi_drv_probe+0x80)
> [    2.061981] [<c054b4ac>] (spi_drv_probe) from [<c04d9edc>] (really_probe+0x1)
> [    2.069854] [<c04d9edc>] (really_probe) from [<c04da204>] (driver_probe_devi)
> [    2.078186] [<c04da204>] (driver_probe_device) from [<c04d8490>] (bus_for_ea)
> [    2.086761] [<c04d8490>] (bus_for_each_drv) from [<c04da11c>] (__device_atta)
> [    2.095062] [<c04da11c>] (__device_attach) from [<c04d91b4>] (bus_probe_devi)
> [    2.103302] [<c04d91b4>] (bus_probe_device) from [<c04d7370>] (device_add+0x)
> [    2.111267] [<c04d7370>] (device_add) from [<c054c044>] (spi_add_device+0x8c)
> [    2.118957] [<c054c044>] (spi_add_device) from [<c054caa8>] (spi_register_co)
> [    2.127868] [<c054caa8>] (spi_register_controller) from [<c054ce10>] (devm_s)
> [    2.137847] [<c054ce10>] (devm_spi_register_controller) from [<c0550ab8>] (o)
> [    2.147460] [<c0550ab8>] (omap2_mcspi_probe) from [<c04db92c>] (platform_drv)

I'm not seeing this with v5.5-rc4 though, maybe it already got fixed?

Regards,

Tony
