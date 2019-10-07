Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707E1CE851
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 17:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfJGPw6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 11:52:58 -0400
Received: from muru.com ([72.249.23.125]:35610 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727912AbfJGPw6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 11:52:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5F8B980A5;
        Mon,  7 Oct 2019 15:53:29 +0000 (UTC)
Date:   Mon, 7 Oct 2019 08:52:52 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>, Adam Ford <aford173@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        James Hilliard <james.hilliard1@gmail.com>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
Message-ID: <20191007155252.GQ5610@atomide.com>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com>
 <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
 <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
 <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org>
 <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* H. Nikolaus Schaller <hns@goldelico.com> [191005 16:59]:
> Hi all,
> with the arrival of v5.4-rc1 some of Tony's sysc patches have arrived
> upstream, so we do no longer need them here.
> 
> Therefore, I have rebased my drivers/staging/pvr driver [1] and fixed some
> more issues:
> * omap4 build only needs to distinguish between omap4420/30/60 and omap4470,
>   because the latter has an sgx544 inside and the other sgx540
>   This is solved by creating a new omap4470.dts
> * I have added proper reg values and interrupts to the omap4 device
>   tree node of the sgx (child node of the target-module)
> * some updates to my sgxdump and sgxdemo scripts (assuming simple
>   Debian Stretch rootfs)
> * James Hilliard has contributed a fix for osfunc.c
> * omap2plus also needs to be configured for STAGING and PREEMPT
>   to be able to compile the driver
> * I have added the __always_inline fix [2] which is needed for v5.4 with
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y (which I are enabled on the Letux builds)
> 
> Unfortunately Tero's rstctrl patches did not yet make it upstream (or even
> linux-next) so I also have a copy in this branch.
> 
> Results of first testing are:
> * OMAP3530 (OpenPandora, BeagleBoard C): fails with
> [  559.247558] PVR_K:(Error): SysLocateDevices: platform_get_resource failed
> 
> * DM3730 (GTA04, BeagleBoard XM): kernel module loads
> 
> * OMAP4460 (Pandaboard ES): kernel module loads
> 
> * AM335x (BeagleBoneBlack): reports a problem with omap_reset_deassert:
> [  204.246706] omap_reset_deassert: timedout waiting for gfx:0

Please try with Tero's current github branch at github.com/t-kristo/linux-pm.git
5.4-rc1-ipc from few days ago, the earlier versions had still issues.

> * OMAP5 (Pyra): fails to enable the clocks (did work with the previous version)
> [  304.140363] clock-controller:clk:0000:0: failed to enable
> [  304.147388] PVR_K:(Error): EnableSGXClocks: pm_runtime_get_sync failed (16)

Hmm no idea what might be up with this one. Did some clkctrl clock
fixes maybe cause a regression here? Tero do you have any ideas?

> * OMAP5 with omap2plus_defconfig:
> root@letux:~# echo on > $(find /sys -name control | grep \/5600)
> [  213.490926] clock-controller:clk:0000:0: failed to enable
> root@letux:~# 
> 
> * pvrsrvctl --start --no-module:
>   reports (where the kernel module loads) that the uKernel does not run
> 
> So I have several ideas what the reasons for the problems on the non-omap5
> devices could be:
> * initial code may have some omap5 specific hack inside
> * or has omap5 specific magic constants
> * uKernel may "know" on which platform it runs and
>   we would need differently patched user-space code
>   for each one
> * omap5 has a dual core sgx544 while the other
>   have single core
> * the register address translation is not yet correct and
>   this inhibits communicating of the user-space libs
>   with the uKernel
> 
> Maybe, if someone can point me to a complete and working BeagleBone source
> tree (any kernel release) which makes use of 1.14.3699939 SDK, I could compare
> code and address setup to find what makes the difference.

Regards,

Tony

> [1]: https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux-pvr
> [2]: https://lkml.org/lkml/2019/10/2/201
