Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EC8CFB93
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 15:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfJHNtN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 09:49:13 -0400
Received: from muru.com ([72.249.23.125]:35878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbfJHNtM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 09:49:12 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 657CD8081;
        Tue,  8 Oct 2019 13:49:43 +0000 (UTC)
Date:   Tue, 8 Oct 2019 06:49:06 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Adam Ford <aford173@gmail.com>,
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
        linux-omap <linux-omap@vger.kernel.org>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
Message-ID: <20191008134906.GX5610@atomide.com>
References: <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
 <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
 <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org>
 <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
 <20191007155252.GQ5610@atomide.com>
 <64474fb1-f6d2-52d0-175a-65bb493dc1fe@ti.com>
 <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com>
 <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191008 08:01]:
> On 07/10/2019 22:24, H. Nikolaus Schaller wrote:
> > Hi Tero,
> > 
> > > Am 07.10.2019 um 21:18 schrieb Tero Kristo <t-kristo@ti.com>:
> > > 
> > > On 07/10/2019 18:52, Tony Lindgren wrote:
> > > > Hi,
> > > > * H. Nikolaus Schaller <hns@goldelico.com> [191005 16:59]:
> > > > Please try with Tero's current github branch at github.com/t-kristo/linux-pm.git
> > > > 5.4-rc1-ipc from few days ago, the earlier versions had still issues.
> > > 
> > > Yeah, this one should be fixed now.
> > 
> > Ok! Will try asap.
> > 
> > > 
> > > > > * OMAP5 (Pyra): fails to enable the clocks (did work with the previous version)
> > > > > [  304.140363] clock-controller:clk:0000:0: failed to enable
> > > > > [  304.147388] PVR_K:(Error): EnableSGXClocks: pm_runtime_get_sync failed (16)
> > > > Hmm no idea what might be up with this one. Did some clkctrl clock
> > > > fixes maybe cause a regression here? Tero do you have any ideas?
> > > 
> > > So, this one I am not too sure, I haven't looked at omap5 graphics clocking. I don't think it has anything to do with reset handling though.
> > > 
> > > Is there some simple way to try this out on board; without PVR module that is?
> > 
> > Yes, I have also seen it when just running the commands in the original commit message [1]:
> > 
> > # echo on > $(find /sys -name control | grep \/5600)
> > # rwmem 0x5600fe00	# OCP Revision
> > 0x5600fe00 = 0x40000000
> > # echo auto > $(find /sys -name control | grep \/5600)
> > # rwmem 0x5600fe10
> > # rwmem 0x56000024
> > 
> > But I have not yet tested with 5.4-rc2, just 5.4-rc1.
> 
> Ok, there is a one liner DTS data fix for this issue, attached.

Arhg OK that thing again.. I must have changed node name while
cleaning up the patch or something. Thanks, will apply into fixes.

Then for v5.5, we should start using custom compatible properties
for the clock controller instances. I'll be posting a patch for that.
Otherwise scripts/checkpatch.pl --strict type clean-up will cause
unexpected issues.

Regards,

Tony

> From 57f9fecb167c0ef9f1ae2a1aa93a05ca8add52a2 Mon Sep 17 00:00:00 2001
> From: Tero Kristo <t-kristo@ti.com>
> Date: Tue, 8 Oct 2019 10:56:42 +0300
> Subject: [PATCH 1/1] ARM: dts: omap5: fix gpu_cm clock provider name
> 
> The clkctrl code searches for the parent clockdomain based on the name
> of the CM provider node. The introduction of SGX node for omap5 made
> the node name for the gpu_cm to be clock-controller. There is no
> clockdomain named like this, so the lookup fails. Fix by changing
> the node name properly.
> 
> Fixes: 394534cb07d8 ("ARM: dts: Configure sgx for omap5")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/boot/dts/omap54xx-clocks.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> index 939ec7dfc366..db9885103099 100644
> --- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> @@ -1160,7 +1160,7 @@
>  		};
>  	};
>  
> -	gpu_cm: clock-controller@1500 {
> +	gpu_cm: gpu_cm@1500 {
>  		compatible = "ti,omap4-cm";
>  		reg = <0x1500 0x100>;
>  		#address-cells = <1>;
> -- 
> 2.17.1
> 

