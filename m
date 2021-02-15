Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9027931B5EE
	for <lists+linux-omap@lfdr.de>; Mon, 15 Feb 2021 09:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhBOIcB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Feb 2021 03:32:01 -0500
Received: from muru.com ([72.249.23.125]:33552 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229960AbhBOIcA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Feb 2021 03:32:00 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8A4A680CE;
        Mon, 15 Feb 2021 08:31:40 +0000 (UTC)
Date:   Mon, 15 Feb 2021 10:31:11 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 5/5] ARM: dts: dra7/omap5: add cec clock
Message-ID: <YCoxT62Sv7MvyQ3G@atomide.com>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
 <20210211103703.444625-6-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211103703.444625-6-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Hans Verkuil <hverkuil-cisco@xs4all.nl> [210211 12:37]:
> Add cec clock to the dra7 and omap5 device trees.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This should merge just fine with what I'm planning to merge for v5.13,
probably best to apply this together with the driver changes:

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  arch/arm/boot/dts/dra7.dtsi  | 5 +++--
>  arch/arm/boot/dts/omap5.dtsi | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index ce1194744f84..efe579ddb324 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -879,8 +879,9 @@ hdmi: encoder@0 {
>  						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  						status = "disabled";
>  						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>  						dmas = <&sdma_xbar 76>;
>  						dma-names = "audio_tx";
>  					};
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index 5f1a8bd13880..2bb1000aeae9 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -580,8 +580,9 @@ hdmi: encoder@0 {
>  						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
>  						status = "disabled";
>  						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>  						dmas = <&sdma 76>;
>  						dma-names = "audio_tx";
>  					};
> -- 
> 2.30.0
> 
