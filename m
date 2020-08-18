Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6086248260
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 11:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgHRJ6y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 05:58:54 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:33357 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgHRJ6x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Aug 2020 05:58:53 -0400
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA4NMLE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w7I9wlRjh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Aug 2020 11:58:47 +0200 (CEST)
Subject: Re: [Letux-kernel] [PATCH] omap5: Fix DSI base address and clocks
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200818095100.25412-1-dave@ds0.me>
Date:   Tue, 18 Aug 2020 11:58:47 +0200
Cc:     kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <9081697A-02F9-42EA-9F22-F62381FA1C79@goldelico.com>
References: <20200818095100.25412-1-dave@ds0.me>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 18.08.2020 um 11:51 schrieb David Shah <dave@ds0.me>:
> 
> DSI was not probing due to base address off by 0x1000, and sys_clk
> missing.
> 
> With this patch, the Pyra display works if HDMI is disabled in the
> device tree.

For me it also works if HDMI is not disabled.
So IMHO this comment is misleading.

Otherwise,

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

> 
> Signed-off-by: David Shah <dave@ds0.me>
> ---
> arch/arm/boot/dts/omap5.dtsi | 20 +++++++++++---------
> 1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index c96e19a15c52..849a2dd9fef7 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -388,11 +388,11 @@ rfbi: encoder@0  {
> 					};
> 				};
> 
> -				target-module@5000 {
> +				target-module@4000 {
> 					compatible = "ti,sysc-omap2", "ti,sysc";
> -					reg = <0x5000 0x4>,
> -					      <0x5010 0x4>,
> -					      <0x5014 0x4>;
> +					reg = <0x4000 0x4>,
> +					      <0x4010 0x4>,
> +					      <0x4014 0x4>;
> 					reg-names = "rev", "sysc", "syss";
> 					ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> 							<SYSC_IDLE_NO>,
> @@ -404,7 +404,7 @@ SYSC_OMAP2_SOFTRESET |
> 					ti,syss-mask = <1>;
> 					#address-cells = <1>;
> 					#size-cells = <1>;
> -					ranges = <0 0x5000 0x1000>;
> +					ranges = <0 0x4000 0x1000>;
> 
> 					dsi1: encoder@0 {
> 						compatible = "ti,omap5-dsi";
> @@ -414,8 +414,9 @@ dsi1: encoder@0 {
> 						reg-names = "proto", "phy", "pll";
> 						interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> 						status = "disabled";
> -						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
> -						clock-names = "fck";
> +						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> +						clock-names = "fck", "sys_clk";
> 					};
> 				};
> 
> @@ -445,8 +446,9 @@ dsi2: encoder@0 {
> 						reg-names = "proto", "phy", "pll";
> 						interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> 						status = "disabled";
> -						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
> -						clock-names = "fck";
> +						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> +						clock-names = "fck", "sys_clk";
> 					};
> 				};
> 
> -- 
> 2.28.0
> 
> _______________________________________________
> https://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

