Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509B44115E8
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 15:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbhITNio (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 09:38:44 -0400
Received: from muru.com ([72.249.23.125]:34984 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230159AbhITNio (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Sep 2021 09:38:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 86EB98102;
        Mon, 20 Sep 2021 13:37:44 +0000 (UTC)
Date:   Mon, 20 Sep 2021 16:37:15 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 1/4] ARM: dts: dra7: add entry for bb2d module
Message-ID: <YUiOixF5/op1hXLf@atomide.com>
References: <20210920125306.12347-1-narmstrong@baylibre.com>
 <20210920125306.12347-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920125306.12347-2-narmstrong@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Neil Armstrong <narmstrong@baylibre.com> [210920 12:53]:
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -965,6 +965,26 @@ hdmi: encoder@0 {
>  			};
>  		};
>  
> +		target-module@59000000 {
> +			compatible = "ti,sysc-omap4", "ti,sysc";
> +			reg = <0x59000020 0x4>;
> +			reg-names = "rev";
> +			clocks = <&dss_clkctrl DRA7_DSS_BB2D_CLKCTRL 0>;
> +			clock-names = "fck";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x59000000 0x1000>;
> +
> +			bb2d: gpu@0 {
> +				compatible = "vivante,gc";
> +				reg = <0x0 0x0700>;
> +				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&dss_clkctrl DRA7_BB2D_CLKCTRL 0>;
> +				clock-names = "core";
> +				status = "disabled";
> +			};
> +		};
> +
>  		aes1_target: target-module@4b500000 {
>  			compatible = "ti,sysc-omap2", "ti,sysc";
>  			reg = <0x4b500080 0x4>,

How about just use the default for the bb2d node with is "okay"?
That way there's no need set status = "okay" for each board file.

If there is no driver loaded, we idle the target-module anyways.

Regards,

Tony
