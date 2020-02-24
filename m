Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B15416B217
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgBXVV6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:21:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53836 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBXVV6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 16:21:58 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D0A3E89;
        Mon, 24 Feb 2020 22:21:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582579316;
        bh=Humv/W7MtolbJhn+tghF9XabiEZVlPSC50D9YpGPsxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DVk+8Oky6X79NITO4X+HxyvPY2cqVTrk5/8qlNireCrxD6X71hvxZC3Ym2EaqaNYq
         eThtx0XFSLfIy1YtFAudQbSOrvSOhH/Fvg8j/VPtdAIh9JgbC2csfBCpFl1PlXnTCs
         akSX8sUfsEglxlXo+uAhDSIbViEH3isjZ4UsRrRc=
Date:   Mon, 24 Feb 2020 23:21:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/23] Drop platform data for omap DSS
Message-ID: <20200224212135.GB16163@pendragon.ideasonboard.com>
References: <20200224210959.56146-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200224210959.56146-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Thank you for the patches.

On Mon, Feb 24, 2020 at 01:09:36PM -0800, Tony Lindgren wrote:
> Hi all,
> 
> This series configures dts data for omap display susbsystem (DSS)
> and then drops the legacy platform data.
> 
> These patces are against v5.6-rc1, and depend on the following
> two patch series:
> 
> [PATCH 0/7] ti-sysc driver fix for hdq1w and few improvments
> [PATCH 0/3] ti-sysc changes for probing DSS with dts data
> 
> To make testing easier, I've pushed out these patches into a
> temporary testing branch at [0][1] below.

Nice work !

Just for my information, do you plan to do something similar for OMAP3 ?

> So far I've tested this on omap4 (dsi and hdmi), omap5 (hdmi),
> dra7 (hdmi) and am437x-sk-evm (dpi). Please test with your
> use cases too.
> 
> Regards,
> 
> Tony
> 
> [0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.7/tmp-testing-drop-dss-pdata
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.7/tmp-testing-drop-dss-pdata
> 
> Tony Lindgren (23):
>   ARM: dts: Configure interconnect target module for omap4 dss
>   ARM: dts: Configure interconnect target module for omap4 dispc
>   ARM: dts: Configure interconnect target module for omap4 rfbi
>   ARM: dts: Configure interconnect target module for omap4 venc
>   ARM: dts: Configure interconnect target module for omap4 dsi1
>   ARM: dts: Configure interconnect target module for omap4 dsi2
>   ARM: dts: Configure interconnect target module for omap4 hdmi
>   ARM: OMAP2+: Drop legacy platform data for omap4 dss
>   ARM: dts: Configure interconnect target module for omap5 dss
>   ARM: dts: Configure interconnect target module for omap5 dispc
>   ARM: dts: Configure interconnect target module for omap5 rfbi
>   ARM: dts: Configure interconnect target module for omap5 dsi1
>   ARM: dts: Configure interconnect target module for omap5 dsi2
>   ARM: dts: Configure interconnect target module for omap5 hdmi
>   ARM: OMAP2+: Drop legacy platform data for omap5 DSS
>   ARM: dts: Configure interconnect target module for dra7 dss
>   ARM: dts: Configure interconnect target module for dra7 dispc
>   ARM: dts: Configure interconnect target module for dra7 hdmi
>   ARM: OMAP2+: Drop legacy platform data for dra7 DSS
>   ARM: dts: Move am437x dss to the interconnect target module in l4
>   ARM: dts: Configure interconnect target module for am437x dispc
>   ARM: dts: Configure interconnect target module for am437x rfbi
>   ARM: OMAP2+: Drop legacy platform data for am437x DSS
> 
>  arch/arm/boot/dts/am4372.dtsi              |  32 --
>  arch/arm/boot/dts/am437x-l4.dtsi           |  77 +++-
>  arch/arm/boot/dts/dra7.dtsi                | 123 +++++--
>  arch/arm/boot/dts/dra72x.dtsi              |   6 +-
>  arch/arm/boot/dts/dra74x.dtsi              |  10 +-
>  arch/arm/boot/dts/omap4-l4.dtsi            |   1 +
>  arch/arm/boot/dts/omap4.dtsi               | 278 ++++++++++----
>  arch/arm/boot/dts/omap5.dtsi               | 241 ++++++++----
>  arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 101 ------
>  arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 404 ---------------------
>  arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 288 ---------------
>  arch/arm/mach-omap2/omap_hwmod_7xx_data.c  | 163 ---------
>  12 files changed, 550 insertions(+), 1174 deletions(-)

-- 
Regards,

Laurent Pinchart
