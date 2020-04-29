Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4793D1BEB7B
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 00:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgD2WHU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 18:07:20 -0400
Received: from muru.com ([72.249.23.125]:52124 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2WHU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Apr 2020 18:07:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B2F93810A;
        Wed, 29 Apr 2020 22:08:07 +0000 (UTC)
Date:   Wed, 29 Apr 2020 15:07:14 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] ARM: dts: omap4: fix node names for the l4_cm
 clkctrl nodes
Message-ID: <20200429220714.GV37466@atomide.com>
References: <20200429143002.5050-1-t-kristo@ti.com>
 <20200429143002.5050-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429143002.5050-2-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200429 14:31]:
> The node name for these should be clk instead of clock. Otherwise the
> clock driver won't be able to map the parent/child relationships
> properly, and large number of clocks end up in orphaned state.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/boot/dts/omap44xx-clocks.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi b/arch/arm/boot/dts/omap44xx-clocks.dtsi
> index 532868591107..b82b1ca0e557 100644
> --- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
> @@ -1279,13 +1279,13 @@
>  		#size-cells = <1>;
>  		ranges = <0 0x1400 0x200>;
>  
> -		l4_per_clkctrl: clock@20 {
> +		l4_per_clkctrl: clk@20 {
>  			compatible = "ti,clkctrl-l4-per", "ti,clkctrl";
>  			reg = <0x20 0x144>;
>  			#clock-cells = <2>;
>  		};
>  
> -		l4_secure_clkctrl: clock@1a0 {
> +		l4_secure_clkctrl: clk@1a0 {
>  			compatible = "ti,clkctrl-l4-secure", "ti,clkctrl";
>  			reg = <0x1a0 0x3c>;
>  			#clock-cells = <2>;

Heh this is no longer needed since commit 6c3090520554
("clk: ti: clkctrl: Fix hidden dependency to node name")
that added support for using the compatible name :)

Maybe you are using some older tree? Or else there's
still something wrong somewhere.

Regards,

Tony
