Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4A67A0980
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfH1Sdq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:33:46 -0400
Received: from muru.com ([72.249.23.125]:58994 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbfH1Sdp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 14:33:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E24038162;
        Wed, 28 Aug 2019 18:34:14 +0000 (UTC)
Date:   Wed, 28 Aug 2019 11:33:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, s-anna@ti.com
Subject: Re: [PATCHv2] ARM: OMAP2+: pdata-quirks: add PRM data for reset
 support
Message-ID: <20190828183342.GE52127@atomide.com>
References: <20190828074627.682-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828074627.682-1-t-kristo@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tero Kristo <t-kristo@ti.com> [190828 07:47]:
> +static struct ti_prm_platform_data ti_prm_pdata = {
> +	.clkdm_deny_idle = clkdm_deny_idle,
> +	.clkdm_allow_idle = clkdm_allow_idle,
> +	.clkdm_lookup = clkdm_lookup,
> +};
> +
>  /*
>   * GPIOs for TWL are initialized by the I2C bus and need custom
>   * handing until DSS has device tree bindings.
> @@ -664,6 +671,11 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
>  	/* Common auxdata */
>  	OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
>  	OF_DEV_AUXDATA("pinctrl-single", 0, NULL, &pcs_pdata),
> +	OF_DEV_AUXDATA("ti,omap4-prm-inst", 0, NULL, &ti_prm_pdata),
> +	OF_DEV_AUXDATA("ti,omap5-prm-inst", 0, NULL, &ti_prm_pdata),
> +	OF_DEV_AUXDATA("ti,dra7-prm-inst", 0, NULL, &ti_prm_pdata),
> +	OF_DEV_AUXDATA("ti,am3-prm-inst", 0, NULL, &ti_prm_pdata),
> +	OF_DEV_AUXDATA("ti,am4-prm-inst", 0, NULL, &ti_prm_pdata),
>  	{ /* sentinel */ },
>  };

Since you're passing already generic clkdm data, you can make
it generic with just a single line here:

	OF_DEV_AUXDATA("ti,prm-inst", 0, NULL, &ti_prm_pdata),

Note that this means the dts compatible must have the additional
"ti,prm-inst" for the auxdata to get passed. But that is more
likely to work when we add support for other SoCs with just dts
changes rather than having to manually patch in the auxdata here
for each SoC.

Regards,

Tony
