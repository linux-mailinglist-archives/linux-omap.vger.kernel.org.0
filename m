Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F9DFDC87
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 12:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbfKOLt2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 06:49:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:57548 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726983AbfKOLt2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Nov 2019 06:49:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AEDCEADCB;
        Fri, 15 Nov 2019 11:49:25 +0000 (UTC)
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-realtek-soc@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        LAKML <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Architecture Mailman List <boot-architecture@lists.linaro.org>,
        DTML <devicetree@vger.kernel.org>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de> <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
 <CAL_JsqLr=fw6zxa=69rtgZ4oxzdw=cVDr3km5ya0pRGsNT1xLw@mail.gmail.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <8411cceb-56f1-bcb3-96b6-5a2aaedd18cf@suse.de>
Date:   Fri, 15 Nov 2019 12:49:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLr=fw6zxa=69rtgZ4oxzdw=cVDr3km5ya0pRGsNT1xLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 14.11.19 um 23:09 schrieb Rob Herring:
> On Tue, Nov 12, 2019 at 4:47 AM Andreas Färber <afaerber@suse.de> wrote:
>> Finally, arch/arm seems unique in that it has the machine_desc mechanism
>> that allows individual SoCs to force creating their soc_device early and
>> using it as parent for further DT-created platform_devices. With arm64
>> we've lost that ability, and nios2 is not using it either.
>> A bad side effect (with SUSE hat on) is that this parent design pattern
>> does not allow to build such drivers as modules, which means that distro
>> configs using arm's multi-platform, e.g., CONFIG_ARCH_MULTI_V7 will get
>> unnecessary code creep as new platforms get added over time (beyond the
>> basic clk, pinctrl, tty and maybe timer).
>> Even if it were possible to call into a driver module that early, using
>> it as parent would seem to imply that all the references by its children
>> would not allow to unload the module, which I'd consider a flawed design
>> for such an "optional" read-once driver. If we want the device hierarchy
>> to have a soc root then most DT based platforms will have a /soc DT node
>> anyway (although no device_type = "soc") that we probably could have a
>> device registered for in common code rather than each SoC platform
>> handling that differently? That might then make soc_register_device()
>> not the creator of the device (if pre-existent) but the supplier of data
>> to that core device, which should then allow to unload the data provider
>> with just the sysfs data disappearing until re-inserted (speeding up the
>> develop-and-test cycle on say not-so-resource-constrained platforms).
> 
> I for one would like to for this to be consistent. Either we always
> have an SoC device parent or never. I wouldn't decide based on having
> a DT node or not either.

Sure, if we can always be consistent, that might be best.

Where I was coming from here is that, if we're not supposed to use
soc_device_to_device(), then we have no way to associate an of_node with
the soc_device from the outside (and nobody was doing it today, as per
my analysis). We'd either need a new helper of_soc_device_register()
with additional argument for the node, or it would need to be done
entirely in the infrastructure as I suggested, be it by looking for one
hardcoded /soc node or for nodes with device_type = "soc".

Rob, in light of this discussion, should we start adding the latter
property for new DTs such as my new Realtek SoCs, or was there a reason
this has not been used consistently outside of powerpc and nios2?
Intel/Altera appear to be the only two in arm64, with only three more in
arm, none in mips.

(BTW my assumption was that we don't follow the booting-without-of.txt
documented schema of soc<SOCname> so that we can share .dtsi across
differently named SoCs, is that correct?)

> Generally, we should always have MMIO devices
> under a bus node and perhaps more than one, but that doesn't always
> happen. I think building the drivers as modules is a good reason to do
> away with the parent device.
> 
> It would also allow getting rid of remaining
> of_platform_default_populate calls in arm platforms except for auxdata
> cases. Pretty much that's the ones you list below in arch/arm/.

The majority was indeed passing in NULL, so yeah, we might clean that
up, if someone could come up with a plan of where/how to implement it.

Cheers,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
