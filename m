Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6273DA1E0
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 01:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388701AbfJPXDY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 19:03:24 -0400
Received: from muru.com ([72.249.23.125]:37728 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732249AbfJPXDY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 19:03:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1FDFF8107;
        Wed, 16 Oct 2019 23:03:56 +0000 (UTC)
Date:   Wed, 16 Oct 2019 16:03:18 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Adam Ford <aford173@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        James Hilliard <james.hilliard1@gmail.com>,
        maemo-leste@lists.dyne.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com, Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [Letux-kernel] Lay common foundation to make PVR/SGX work
 without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
Message-ID: <20191016230318.GK5610@atomide.com>
References: <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
 <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
 <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org>
 <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
 <72851E17-9B56-4CA5-B164-667836A7C894@goldelico.com>
 <1A69DA38-DD6D-4C2B-9F42-D293796AC98A@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1A69DA38-DD6D-4C2B-9F42-D293796AC98A@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191014 09:12]:
> 
> > Am 12.10.2019 um 15:09 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > 
> > Hi,
> > 
> >> Am 05.10.2019 um 18:58 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > 
> > I have found the following description, followed all steps, and it works:
> > 
> > http://blog.0xpebbles.org/PowerVR-SGX-on-the-beaglebone-black-in-2019
> > 
> > So with this, I have got a working user-space setup for BeagleBone and some working
> > pvrsrvkm.ko module (kernel 4.4.155-ti-r155) for evaluation.
> 
> > What I don't have yet is the full source code or build recipe for the specific
> > 4.4.155-ti-r155 pvrsrvkm.ko from TI.
> > 
> > But even without having this yet, I can start experiments by replacing
> > kernel and pvrsrvkm.ko with mine. This should allow to gain new insights.
> 
> Good news:
> 
> after making a Hybrid SD image of the setup described above and replacing the
> 4.4.155-ti-r155 kernel with its pvrsrvkm.ko by my own 5.4-rc2 kernel and pvrsrvkm,
> I was able to start the pvrsrv uKernel. And run the gles1test1 on beaglebone
> (without LCD but also without errors).
> 
> With this knowledge I could adapt my user-space. There are indeed different
> non-free binaries for sgx530, sgx540, sgx544. And SGX needs enough coherent memory.
> So I could make a completely self-built kernel and rootfs (using the git clone from
> ti for the firmware + make install) run on BeagleBone.
> 
> Here is a quickly taken video:
> 
> https://youtu.be/jFCPR_EvtjY

Nice :)

> With the same setup, I can now also load the kernel driver and run pvrsrvctl on
> DM3730 without errors, but the gles1test1 reports some error and fails to run.
> Maybe something in the video subsystem or memory mapping is still wrong.
> 
> Unfortunately, the same setup does not run on omap5. It looks like there are different
> releases for the non-free binaries and I have to pick the right one.
> 
> On BBB the version I could make running is branch ti-img-sgx/1.14.3699939_k4.4 from
> git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git. Target ti335x works while
> target jacinto6evm fails for OMAP5. A diff on the binaries for e.g. pvrsrvctl shows
> that they are different.
> 
> If you want to repeat this setup and my instructions are too imprecise, please
> ask.
> 
> So in summary this means:
> * the common foundation (clock, reset, power etc.) setup is working - thanks to Tero, Tony and others
> * I have added device tree nodes for each SoC type to define sgx registers, interrupts, compatible etc.
> * compiling SoC specific kernel module variants from single source tree works
> * the work can already be demoed on BBB and OMAP5 Pyra (using different user-space binaries)
> 
> Basically I am now ready to post an RFC for the sgx child device nodes together
> with a bindings document [1]. But I am not sure if I should better wait until
> really all underlaying prm+rtsctl+syscon+idlest-polling patches by Tero and Tony [2]
> have matured in linux-next and have arrived in v5.5-rc1. Would be short before Xmas.

I think you've already proven that we can have a generic binding for the
sgx using standard properties :) So AFAIK, there's nothing stopping you
from posting the binding and dts changes for review for v5.5.

> Independent of low level patches, we all have to discuss how we want to get the GPLed
> kernel driver [3] into mainline drivers/staging. This likely needs more cleanup before
> it can be proposed.

You probably need a shell script using sed or something to get rid of the
crazy directory path for the kernel driver :) Just make it something like:

drivers/staging/pvr

Then if you have a script doing the directory path conversion, you can
still convert and diff against any other prv branches you may find.

And you can get rid of all the LINUX_VERSION_CODE stuff too for the
mainline kernel.

Regards,

Tony


> [1]: https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/omap-pvr-soc-glue-v5
> [2]: https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/omap-sysc-prm-gfx
> [3]: https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/latest-pvr
> 
