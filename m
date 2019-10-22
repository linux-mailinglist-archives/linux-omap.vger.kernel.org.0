Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74114E07CF
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 17:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388055AbfJVPsT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 11:48:19 -0400
Received: from muru.com ([72.249.23.125]:38940 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387922AbfJVPsT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 11:48:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0B04980FA;
        Tue, 22 Oct 2019 15:48:53 +0000 (UTC)
Date:   Tue, 22 Oct 2019 08:48:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch 1/3] ARM: dts: am43xx: add support for clkout1 clock
Message-ID: <20191022154816.GO5610@atomide.com>
References: <20191016184954.14048-1-bparrot@ti.com>
 <20191016184954.14048-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016184954.14048-2-bparrot@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191016 18:47]:
> --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
> @@ -704,6 +704,60 @@
>  		ti,bit-shift = <8>;
>  		reg = <0x2a48>;
>  	};
> +
> +	clkout1_osc_div_ck: clkout1_osc_div_ck {
> +		#clock-cells = <0>;
> +		compatible = "ti,divider-clock";
> +		clocks = <&sys_clkin_ck>;
> +		ti,bit-shift = <20>;
> +		ti,max-div = <4>;
> +		reg = <0x4100>;
> +	};

Here too please describe why the clock names are not generic.

Regards,

Tony
