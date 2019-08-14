Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7BF8CFFC
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 11:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfHNJsB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 05:48:01 -0400
Received: from muru.com ([72.249.23.125]:57496 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfHNJsB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 05:48:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 83CA380C8;
        Wed, 14 Aug 2019 09:48:26 +0000 (UTC)
Date:   Wed, 14 Aug 2019 02:47:55 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
Message-ID: <20190814094755.GC52127@atomide.com>
References: <CAKpie0RXM1UC33YFeFy-kAxfGhYGNkw4vUgNTThf-ZCAhPTVXw@mail.gmail.com>
 <BE23C1E4-2877-49FA-B230-F9C10691B805@goldelico.com>
 <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com>
 <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com>
 <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com>
 <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [190814 08:57]:
> I also have pushed good news to
> 
> 	https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/letux-pvr
> 
> Thanks to the help from the Pyra community, I was able to get a (binary) reference
> implementation using DRM that works on Pyra/OMAP5. At least the gles1test1.
> 
> With that reference setup I was able to fix my Makefiles for the staging/pvr implementation.
> 
> I have tested that it works with v4.19.66 and v5.3-rc4 (LPAE build of the LetuxOS kernel tree)
> on the Pyra.
> 
> In which areas does this tree go beyond the TI SDK/IMG DDK 1.14?
> 
> * includes internal API fixes for kernels up to v5.3
> * lives in drivers/staging/pvr/1.14.3699939 - so that we can ask for inclusion in linux-next
> * has Kconfig and Makefiles for in-kernel configuration (no separate build system)
> * builds separate kernel modules for omap3430, omap3630, am335x, omap4, omap5, dra7 etc.
>   pvrsrvkm
>   e.g. pvrsrvkm_omap_omap5_sgx544_116
> * the correct kernel module is automatically probed by matching .compatible in device tree
>   so that the code is multi-platform friendly
> * includes SoC integration for OMAP3/4/5 and has some preliminary bindings documentation
> * code base should also support JZ4780/CI20 and some Intel Atom processors (CedarView, Poulsbo)
> * has got a ToDo to describe what should be done during staging phase
> 
> 	https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/blob/letux/latest-pvr/drivers/staging/pvr/TODO
> 
> My plans for the next steps are:
> 
> * do more testing (e.g. X11, kmscube)
> * check if and/or how it can run on am335x (BeagleBone) or OMAP3 (e.g. GTA04, OpenPandora)
> * try a JZ480/CI20 build (unfortuantely I have no HDMI there with mainline kernels and I am
>   missing the user-space libraries for MIPS).

That sounds good to me, just one comment. Before getting these into
staging, I'd like to have omap variants use proper interconnect
target module in devicetree like we already have in omap4.dtsi
as target-module@56000000. This should simplify things further
as the module child device driver(s) can just enable things with
runtime PM and we can leave out all the legacy hwmod platform data
that sounds like you're still carrying.

I have patches here to add similar interconnect target modules for
at least omap34xx, omap36xx, omap5, and am335x that I'll try to post
later on today to play with. For am335x, things still depend on the
recentely posted prm rstctrl patches. I'm not sure if I already
did a dts patch for dra7 yet, need to check.

Regards,

Tony
