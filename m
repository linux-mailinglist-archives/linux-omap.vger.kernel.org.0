Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5B4AA755
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 17:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388226AbfIEP2c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 11:28:32 -0400
Received: from muru.com ([72.249.23.125]:59832 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388218AbfIEP2c (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Sep 2019 11:28:32 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9ECBE810D;
        Thu,  5 Sep 2019 15:28:59 +0000 (UTC)
Date:   Thu, 5 Sep 2019 08:28:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Subject: Re: [PATCH 4/6] ARM: dts: Configure sgx for omap5
Message-ID: <20190905152826.GY52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <20190814131408.57162-5-tony@atomide.com>
 <20190815182348.8A1BA2063F@mail.kernel.org>
 <20190817065615.GI52127@atomide.com>
 <20190826145530.GT52127@atomide.com>
 <4BC961D4-1D6E-457B-944A-7137414BC163@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4BC961D4-1D6E-457B-944A-7137414BC163@goldelico.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [190905 15:04]:
> Hi Tony,
> I found some time to update my drivers/stating/pvr/1.14.369993 tree to make
> use of the new sgx soc integration code and it works on omap5!
> 
> > root@letux:~# modprobe pvrsrvkm_omap_omap5_sgx544_116
> > [  106.478254] pvrsrvkm_omap_omap5_sgx544_116: module is from the staging directory, the quality is unknown, you have been warned.
> > [  106.526201] [drm] Initialized pvr 1.14.3699939 20110701 for 5600fe00.sgx on minor 1
> > root@letux:~# pvrsrvctl --no-module --start
> > [  261.091978] PVR_K: UM DDK-(3699939) and KM DDK-(3699939) match. [ OK ]
> > root@letux:~# gles1test1 0
> > ^C
> > root@letux:~# 

Hey that's great, good to hear :)

> To make it work, I have added a child node to the target-module@56000000
> that describes the img,sgx5xx. Here are the work-in-progress patches if
> you want to take a look inside:
> 
> 	https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/omap-pvr-soc-glue-v2

OK

> On omap3630 the driver module loads but pvrsrvinit fails:
> 
> > root@letux:~# modprobe pvrsrvkm_omap_omap3630_sgx530_125
> > [  390.429260] pvrsrvkm_omap_omap3630_sgx530_125: module is from the staging directory, the quality is unknown, you have been warned.
> > [  390.474304] [drm] Initialized pvr 1.14.3699939 20110701 for 50000000.sgx on minor 1
> > root@letux:~# pvrsrvctl --start --no-module
> > [  402.200439] PVR_K: UM DDK-(3699939) and KM DDK-(3699939) match. [ OK ]
> > [  402.219604] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.  Driver unusable.
> > PVR:(Error): LoaduKernelProgram : SGX ukernel program Device Addr: 0xe400000 invalid alignment [0, ]
> > PVR:(Error): SetupuKernel : Failed to load uKernel programs [0, ]
> > PVR:(Error): SrvInit: Initialisation for device of class 0, type 7, index 0, failed (1) [0, ]
> > PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function ID:3223086862 (strerror returns no value.). [0, ]
> > pvrsrvctl: SrvInit failed (already initialized?) (err=PVRSRV_ERROR_OUT_OF_MEMORY - Unable to allocate required memory)
> > root@letux:~# 
> 
> Maybe I do not have done the address range translation properly. Or I am missing
> some of your PRM rstctrl patches since I am working on top of linus/master.
> Because of that I had to comment out prm_gfx in am33xx.dtsi to get it compile and could
> not test yet on Beagle Bone.

My guess is that on 36xx the sgx registers are at a different offset
that does not start at offset 0? And this might be different again
for 34xx?

If you enable the module via sysfs, you should be able to just
read out some registers to figure out where it might be is my
guess.

> A little unclear is how to properly handle omap4. omap4430/4440 and 4460 have the sgx540
> while only omap4470 has an sgx544 inside. But omap4420/30 share one .dtsi and omap4460/70
> the other. So we might have to define a new omap4470.dtsi and #include in the real omap4470
> boards.

Oh OK. Well for 4460, see omap4460.dtsi that already has some ranges
updated compared to 4430 in l4_cfg_segment_300000 and l4_cfg_target_0.
I recall that was the only difference for the added 2d accelerator
between 4430 and 4460.

Adding a omap4470.dtsi in a similar way should work, just also update
also &sgx_module there too.

> And am3517 and am43/am57/am65/... support is missing. But that can be added later if we
> have it running on omap3 and am33xx.

Yeah sure at least 335x depends on the pending rstctrl patches.

> Anyways, we again have made a big step forwards. Let's hope that we can get
> the FLOSS part of the sgx drivers to staging in some not too far future.

Yeah great.

Regards,

Tony
