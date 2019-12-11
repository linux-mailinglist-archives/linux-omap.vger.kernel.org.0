Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0CF11AE74
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729611AbfLKOzP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:55:15 -0500
Received: from muru.com ([72.249.23.125]:45526 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728370AbfLKOzP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 09:55:15 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0058680FA;
        Wed, 11 Dec 2019 14:55:52 +0000 (UTC)
Date:   Wed, 11 Dec 2019 06:55:11 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     "Andrew F. Davis" <afd@ti.com>, linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 9/9] ARM: OMAP2+: Drop legacy platform data for dra7
 timers except timer1 to 4
Message-ID: <20191211145511.GP35479@atomide.com>
References: <20191210233524.46875-1-tony@atomide.com>
 <20191210233524.46875-10-tony@atomide.com>
 <84c0944d-0e75-4c1f-9220-bf4eb9396040@ti.com>
 <629f9571-d5d7-b85d-ff34-ef35f9fec821@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <629f9571-d5d7-b85d-ff34-ef35f9fec821@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191211 13:00]:
> On 11/12/2019 04:10, Andrew F. Davis wrote:
> > On 12/10/19 6:35 PM, Tony Lindgren wrote:
> > > We can now probe devices with ti-sysc interconnect driver and dts
> > > data. Let's drop the related platform data and custom ti,hwmods
> > > dts property.
> > > 
> > > As we're just dropping data, and the early platform data init
> > > is based on the custom ti,hwmods property, we want to drop both
> > > the platform data and ti,hwmods property in a single patch.
...

> > > @@ -2069,12 +1783,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
> > >   	NULL,
> > >   };
> > > -/* GP-only hwmod links */
> > > -static struct omap_hwmod_ocp_if *dra7xx_gp_hwmod_ocp_ifs[] __initdata = {
> > > -	&dra7xx_l4_wkup__timer12,
> > > -	NULL,
> > > -};
> > > -
> > >   /* SoC variant specific hwmod links */
> > >   static struct omap_hwmod_ocp_if *dra76x_hwmod_ocp_ifs[] __initdata = {
> > >   	&dra7xx_l4_per3__usb_otg_ss4,
> > > @@ -2124,8 +1832,5 @@ int __init dra7xx_hwmod_init(void)
> > >   		}
> > >   	}
> > > -	if (!ret && omap_type() == OMAP2_DEVICE_TYPE_GP)
> > > -		ret = omap_hwmod_register_links(dra7xx_gp_hwmod_ocp_ifs);
> > > -
> > 
> > 
> > Maybe I'm missing it but how is this logic getting replicated when using
> > ti,sync? We runtime detect here if we are on an HS device and if so let
> > the secure world manage these device's pm/clocks, without this the
> > non-secure side managment will be unconditional.
> 
> This is handled by the clkctrl driver itself. timer12 is marked as NON-SEC
> device supported only, so it doesn't get registered on HS chips.
> 
> I guess the lack of the clock fails the ti-sysc part of the registration
> logic also. Tony?

Yes it should bail out with a clock error. To avoid an error for that
in dmesg the timer needs to be tagged with status = "disabled" though.

For drivers, we have soc_device_match() to use that should work for
detecting SoCs type on boot. Maybe cat /sys/bus/soc/devices/soc0/type
to confirm this as I don't think we're currently using it for
detecting HS SoCs anywhere.

Regards,

Tony


