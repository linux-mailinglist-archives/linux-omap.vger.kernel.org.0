Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 226E6B1345
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 19:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbfILRKA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 13:10:00 -0400
Received: from muru.com ([72.249.23.125]:60600 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728598AbfILRKA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Sep 2019 13:10:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E523880B6;
        Thu, 12 Sep 2019 17:10:27 +0000 (UTC)
Date:   Thu, 12 Sep 2019 10:09:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, ssantosh@kernel.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv5 10/10] ARM: OMAP2+: pdata-quirks: add PRM data for
 reset support
Message-ID: <20190912170953.GT52127@atomide.com>
References: <20190912113916.20093-1-t-kristo@ti.com>
 <20190912113916.20093-11-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912113916.20093-11-t-kristo@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190912 11:40]:
> @@ -565,6 +566,12 @@ void omap_pcs_legacy_init(int irq, void (*rearm)(void))
>  	pcs_pdata.rearm = rearm;
>  }
>  
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

Hmm I think I already commented on this.. Just one entry please:

	OF_DEV_AUXDATA("ti,omap-prm-inst", 0, NULL, &ti_prm_pdata),

As the auxdata is the same for all of them. Note that all the
dts files need to have also the generic compatible
"ti,omap-prm-inst" after the SoC specific one.

Regards,

Tony
