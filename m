Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B87DC44D51
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 22:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbfFMUWX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 16:22:23 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45544 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbfFMUWX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Jun 2019 16:22:23 -0400
Received: by mail-qt1-f196.google.com with SMTP id j19so24109928qtr.12;
        Thu, 13 Jun 2019 13:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PGYgAEgbagAdsu5GyWbotd9ekKgsN2P9KFLuwB0EuYg=;
        b=QhqoztoMbgwlHt6t4o6myDyQreHCWPlOAMJ3aT2mTeEXDcvmtGWQkSmK9MDGwxxCLy
         HNtofLDZ1a7kIsvObXT1krxn8UU4pHMsS+ADbWTbFaI4fd5Y0q3Sj/cNxmh2oM7uZXSj
         sQ3icXiVG7+j4cGhStCWgcgoNqZ31huwu+xl+KUM2R5MZTlCf0EWuhdNuXwKhbOYxNuC
         bE7zznYvP49EnPC1EDcicgu5lepi6txH5zx9U+HsWF5KNT/gBOBS6oV+igrMlAiFc1ql
         JSL/piKUrrw4VjX8xhHq8pq2eTnSQaruN4RXGumgkeAYHs306x+yAriumZDF0EQiHCoa
         JOmg==
X-Gm-Message-State: APjAAAWbi4keTApjKO2IApnRq3bxyEQZLV0hBuJbe+xBTm5s+Bg8YG0x
        y3HXM5QKiouIiGiAvh7lNQ==
X-Google-Smtp-Source: APXvYqwjv0mrGiN12UMZjswyz/MsknKU4+SlFUsCqjcmrXhGitx7gMlcgdGflgeS0mNkX5YAF1j9NA==
X-Received: by 2002:aed:2063:: with SMTP id 90mr38651901qta.307.1560457341649;
        Thu, 13 Jun 2019 13:22:21 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id q2sm363082qkf.44.2019.06.13.13.22.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 13:22:21 -0700 (PDT)
Date:   Thu, 13 Jun 2019 14:22:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
Message-ID: <20190613202220.GA4282@bogus>
References: <20190510194229.20628-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510194229.20628-1-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 10, 2019 at 02:42:29PM -0500, Adam Ford wrote:
> Currently the source code is compiled using hard-coded values
> from CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.  This patch allows this
> clock divider value to be moved to the device tree and be changed
> without having to recompile the kernel.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
> index cd02516a40b6..42449d07c47e 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
> +++ b/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
> @@ -40,7 +40,7 @@ Required properties:
>  Optional properties:
>  - max-memory-bandwidth: Input memory (from main memory to dispc) bandwidth limit
>  			in bytes per second
> -
> +- min-fck-pck-ratio:  Make sure that DISPC FCK is at least n x PCK

Assuming this patch progresses, this needs a vendor prefix and please 
split bindings to separate patch.

>  
>  RFBI
>  ----
> diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> index 4043ecb38016..bf84a8487aae 100644
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -751,7 +751,7 @@
>  			#size-cells = <1>;
>  			ranges;
>  
> -			dispc@48050400 {
> +			dispc: dispc@48050400 {

Unrelated change.

>  				compatible = "ti,omap3-dispc";
>  				reg = <0x48050400 0x400>;
>  				interrupts = <25>;
> diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
> index f24ebf7f61dd..d0666edcdf2a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
> @@ -102,24 +102,6 @@ config OMAP2_DSS_DSI
>  
>  	  See http://www.mipi.org/ for DSI specifications.
>  
> -config OMAP2_DSS_MIN_FCK_PER_PCK
> -	int "Minimum FCK/PCK ratio (for scaling)"
> -	range 0 32
> -	default 0
> -	help
> -	  This can be used to adjust the minimum FCK/PCK ratio.
> -
> -	  With this you can make sure that DISPC FCK is at least
> -	  n x PCK. Video plane scaling requires higher FCK than
> -	  normally.
> -
> -	  If this is set to 0, there's no extra constraint on the
> -	  DISPC FCK. However, the FCK will at minimum be
> -	  2xPCK (if active matrix) or 3xPCK (if passive matrix).
> -
> -	  Max FCK is 173MHz, so this doesn't work if your PCK
> -	  is very high.
> -
>  config OMAP2_DSS_SLEEP_AFTER_VENC_RESET
>  	bool "Sleep 20ms after VENC reset"
>  	default y
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index ba82d916719c..09a130c53da2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -198,6 +198,9 @@ struct dispc_device {
>  
>  	/* DISPC_CONTROL & DISPC_CONFIG lock*/
>  	spinlock_t control_lock;
> +
> +	/* Optional min-fck-pck-ratio */
> +	u32 min_fck_per_pck;
>  };
>  
>  enum omap_color_component {
> @@ -3683,15 +3686,8 @@ bool dispc_div_calc(struct dispc_device *dispc, unsigned long dispc_freq,
>  	unsigned long pck, lck;
>  	unsigned long lck_max;
>  	unsigned long pckd_hw_min, pckd_hw_max;
> -	unsigned int min_fck_per_pck;
>  	unsigned long fck;
>  
> -#ifdef CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK
> -	min_fck_per_pck = CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK;
> -#else
> -	min_fck_per_pck = 0;
> -#endif
> -
>  	pckd_hw_min = dispc->feat->min_pcd;
>  	pckd_hw_max = 255;
>  
> @@ -3723,7 +3719,7 @@ bool dispc_div_calc(struct dispc_device *dispc, unsigned long dispc_freq,
>  			else
>  				fck = lck;
>  
> -			if (fck < pck * min_fck_per_pck)
> +			if (fck < pck * dispc->min_fck_per_pck)
>  				continue;
>  
>  			if (func(lckd, pckd, lck, pck, data))
> @@ -4826,6 +4822,8 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
>  		}
>  	}
>  
> +	of_property_read_u32(np, "min-fck-pck-ratio", &dispc->min_fck_per_pck);
> +
>  	r = dispc_init_gamma_tables(dispc);
>  	if (r)
>  		goto err_free;
> -- 
> 2.17.1
> 
