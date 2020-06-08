Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D221F209F
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jun 2020 22:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgFHUW2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jun 2020 16:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgFHUW1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jun 2020 16:22:27 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14818C08C5C2
        for <linux-omap@vger.kernel.org>; Mon,  8 Jun 2020 13:22:26 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id f7so19815858ejq.6
        for <linux-omap@vger.kernel.org>; Mon, 08 Jun 2020 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2bbf4a1UpigisBAK2scf+0MAbTS1jtQ5thxgbXn5iII=;
        b=UtE69PEocIqXale+O5z1dt7hCUfipw35RURcr81URaaT0RjVVIojdcFSt4Isdwx+Cm
         tVhYz+A9SKZctDXuoR6uh/o1Vw+PyIXZL//lTC6nzyMqExU/qD3HM1r+DKBRMeYio2uD
         /5YM93DP/VIfhRy1B7pv6oAJMVqb+LSOvNwhXALg4xKDAAmTPvu0xf15AhGPoI2ELatF
         Y5xirjlD+Q1j2FwjC6UDwvnlb+uU1ohxkgfRqyVz+kPeuMIOzlnvhjFvWATqK9+tWS4c
         HbVi/J4vIzcutDVZKQtUn2oenUB3Ms+XqnrJk5hQejX4zMBIP5tuF2FSdVaF+nSO143l
         6dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2bbf4a1UpigisBAK2scf+0MAbTS1jtQ5thxgbXn5iII=;
        b=ItF0xSa4GYTdKZwuag/ydx1i8jK6w0nWtu7AEvDQb+jG1MD8uKrtCuWT9kryunbWqE
         iPF2jy6M3QVCgrjQYSWFrSm7/do6PQXezGbI9Zo+SzLf//y6QPPh735ku3V9CfHcI4fW
         U6SHRDV5diSjbcpYlT7n0j0b0mwoC1ZdNk0GZTWHSfC24Q10BEqFmK5PzRH/Qy0b27rF
         MAZQdIpzWUut8wO0jVJEx0GgYz9a5y+/O+2yIrYBmp5MA8B3yL+V65ojKoNxaLq0gWHP
         rIOXxzYAd7jpEc7HB0SxX/TUtAjglblB4npZjsqi1c8MydxoPL9oPRpm+u9L47Z6hTMw
         CReQ==
X-Gm-Message-State: AOAM5308Hk31AF/MQRV9/WJcwaQzFghRFI68Y1d7PRmVcxdVKlPFzAYz
        OnTxVw2QFqAeUJoPnCFSdxz/JA==
X-Google-Smtp-Source: ABdhPJykZZ5/Yc2dgDuZJziecWXDP22O8wM1hJgEmfMMEzoTiF4K430NTmxCMt5BABW4AmkmUao8DA==
X-Received: by 2002:a17:906:7746:: with SMTP id o6mr23190899ejn.75.1591647744631;
        Mon, 08 Jun 2020 13:22:24 -0700 (PDT)
Received: from x1 ([2001:16b8:5c5c:ea01:10b2:73c:bda4:56d6])
        by smtp.gmail.com with ESMTPSA id s2sm11502840ejm.50.2020.06.08.13.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:22:20 -0700 (PDT)
Date:   Mon, 8 Jun 2020 22:22:18 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200608202218.GA2891935@x1>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
 <20200527221915.GA2963339@x1>
 <20200527224108.GM37466@atomide.com>
 <20200528125323.GA3074222@x1>
 <20200529174037.GT37466@atomide.com>
 <20200608180543.GA2825296@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608180543.GA2825296@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 08, 2020 at 08:05:43PM +0200, Drew Fustini wrote:
> On Fri, May 29, 2020 at 10:40:37AM -0700, Tony Lindgren wrote:
> > * Drew Fustini <drew@beagleboard.org> [200528 12:54]:
> > > Would you be able to describe what you think AM33XX_PADCONF would look
> > > like if the mux and conf are seperated?
> > 
> > Yes it would just slightly change, see your example below.
> > 
> > > Is there an example you know of for another SoC?
> > 
> > I think the other driver already keep the padconf and mux separate.
> > 
> > So not sure where all #pinctrl-cells could be used. It would make
> > pinctrl-single.c a bit nicer though, and probably would make it
> > easier to implement further features.
> > 
> > Some hardware may need it to have #pinctrl-cells = <3> if GPIO
> > features are there too, ideally pinctrl-single would not even
> > care but just work for what is configured for the hardware.
> > 
> > > Currently, the macro takes dir and mux:
> > > 
> > > include/dt-bindings/pinctrl/omap.h:
> > > #define AM33XX_PADCONF(pa, dir, mux) OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> > 
> > So after fixing up pinctrl-single.c, and changing the SoC dts
> > to have #pinctrl-cells = <2> instead of <1>, the macro would
> > then need to be:
> > 
> > #define AM33XX_PADCONF(pa, dir, mux) OMAP_IOPAD_OFFSET((pa), 0x0800) (dir), (mux))
> > 
> > > For example, in arch/arm/boot/dts/am335x-bone-common.dtsi:
> > > AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLUP, MUX_MODE0)
> > 
> > Yeah so no change needed for the use.
> > 
> > > I think it might be more accurate to rename 'dir' to 'conf'.
> > 
> > Sure makes sense to rename it in the macro.
> > 
> > Regards,
> > 
> > Tony
> 
> Tony - would this be how the macro would need to be changed?
> 
> diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
> index 625718042413..2d2a8c737822 100644
> --- a/include/dt-bindings/pinctrl/omap.h
> +++ b/include/dt-bindings/pinctrl/omap.h
> @@ -65,7 +65,7 @@
>  #define DM814X_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
>  #define DM816X_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
>  #define AM33XX_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> -#define AM33XX_PADCONF(pa, dir, mux)   OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> +#define AM33XX_PADCONF(pa, conf, mux)  OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
> 
>  /*
>   * Macros to allow using the offset from the padconf physical address

I've been looking at pinctrl-single.c further and now I am wondering if
it makes sense to modify pcs_parse_one_pinctrl_entry() or create a new
function.  Currently it does:

1020                 /* Index plus one value cell */
1021                 offset = pinctrl_spec.args[0];
1022                 vals[found].reg = pcs->base + offset;
1023                 vals[found].val = pinctrl_spec.args[1];

I believe it will need something similar to what is done in
pcs_parse_bits_in_pinctrl_entry():

1136                 /* Index plus two value cells */
1137                 offset = pinctrl_spec.args[0];
1138                 val = pinctrl_spec.args[1];
1139                 mask = pinctrl_spec.args[2];

So using #pinctrl-cells = <2> would require would require:

offset = pinctrl_spec.args[0];
vals[found].reg = pcs->base + offset;
vals[found].conf = pinctrl_spec.args[1];
vals[found].mux = pinctrl_spec.args[2];

However, the type of vals:

struct pcs_func_vals {
	void __iomem *reg;
	unsigned val;
	unsigned mask;
};

represents the combined mux + conf value in the register, so I think
pcs_conf_vals would need to used:

struct pcs_conf_vals {
	enum pin_config_param param;
	unsigned val;
	unsigned enable;
	unsigned disable;
	unsigned mask;
};

Thoughts?

thanks,
drew
