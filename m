Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EB01E617A
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 14:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389913AbgE1Mx1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 08:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389828AbgE1Mx1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 08:53:27 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DE4C05BD1E
        for <linux-omap@vger.kernel.org>; Thu, 28 May 2020 05:53:26 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id s19so23104909edt.12
        for <linux-omap@vger.kernel.org>; Thu, 28 May 2020 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x+1YpcuEdkyJCl8vPYkVgmUybCt5AW7nQ4QFTjVvCf4=;
        b=biWAdHVtjFjfO11O8jZNAfXU78VaaGwe6FLdVHJp6TQtwl1c0TIu4k36MtwA7AlFe2
         GmDlZCgCeBdI0StZC//R9hcsA57y+poT9gqFoH9WNtzC5YO2U0NviSL2HV98f5+aKRrL
         ZnN+qHcubDJgTy+yv605tujznOSm8gRD3zVVAwTVqLhUzVG8tZZDiiC8PRBt04rHq3Zt
         CYyO4v9CttnvDxXyEbLQ11/HTpj0KwJ0bZVbelFEpWeFPtqs8GU0dxmlhKejd29GTrl0
         6YGiR9sJMK1r6tSpte8+OpDLRgpK6L+xvaCJgB7Ny736z4PqjEwNMAmMtFGCAgG1y1zo
         49Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x+1YpcuEdkyJCl8vPYkVgmUybCt5AW7nQ4QFTjVvCf4=;
        b=lRhmx+UvIn8ns4MDvjknXbUcntCMbafAY+S/e9KZCtB92sj2VydEttIsY2YCrH7IpP
         23f3dV3s2zQFFzPJy6n0TlHvTXxWe6DRwJ+RMRP8nBqQyIfOvqOshPxDXlgqOaFrItHI
         lwbn8Yg6hMO0TgOILEeajhL+sc0ZcuXRwMLCbbCfHuQZ6JkZXxO8eYR21Z+qVX3Gn9T+
         V3XwTHvJFC774EMRs804RN0wMZhM5l0hNZxD+2HJT2Se1kUECiWzSGogJyTXgGIbwrnz
         L5vh+lrEey0awGodBqPl2DgNLvevxBAOEZ/z2p2lqKSjz8oOnXEYNpDsUec0L4m1yXZp
         YDLw==
X-Gm-Message-State: AOAM532SGTa09D8+R8NkM+iHafv9LD8qZudLs4AUAby32hpAm+FC4sWi
        KO7bj9YOwqhwjwPxiu2lkBzx83zYHXI4hA==
X-Google-Smtp-Source: ABdhPJzgUJKu14LRxTeDHoGIaN5BjElImK8xlKwlwk/qFg3+8tShtx9kOJXSlnoIi8BQp5h83QyEhg==
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr2982957edu.247.1590670405475;
        Thu, 28 May 2020 05:53:25 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id f13sm4959587edk.36.2020.05.28.05.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 05:53:24 -0700 (PDT)
Date:   Thu, 28 May 2020 14:53:23 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200528125323.GA3074222@x1>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
 <20200527221915.GA2963339@x1>
 <20200527224108.GM37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527224108.GM37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 27, 2020 at 03:41:08PM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200527 22:20]:
> > On Wed, May 27, 2020 at 09:51:22AM -0700, Tony Lindgren wrote:
> > > * Drew Fustini <drew@beagleboard.org> [200526 12:22]:
> > > > Hello Haojian and Linus,
> > > > 
> > > > For pcs_parse_one_pinctrl_entry() in drivers/pinctrl/pinctrl-single.c,
> > > > I see that num_maps is set to 2 if PCS_HAS_PINCONF is enabled:
> > > > 
> > > > 1057         if (PCS_HAS_PINCONF && function) {
> > > > 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> > > > 1059                 if (res)
> > > > 1060                         goto free_pingroups;
> > > > 1061                 *num_maps = 2;
> > > > 1062         } else {
> > > > 1063                 *num_maps = 1;
> > > > 1064         }
> > > > 1065         mutex_unlock(&pcs->mutex);
> > > > 
> > > > git blame shows me that came from 9dddb4df90d13:
> > > > "pinctrl: single: support generic pinconf"
> > > > 
> > > > Would you be able to provide any insight as to num_maps needs to be 2
> > > > when pinconf is enabled?
> > > 
> > > Only slightly related, but we should really eventually move omaps to use
> > > #pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
> > > from the mux mode. 
> > 
> > Thanks for the insight, Tony.
> > 
> > I was not considering the situation where pinctrl-cells would be more
> > than 1.
> > 
> > I see now from pinctrl-single.txt bindings doc that:
> > 
> > - #pinctrl-cells : number of cells in addition to the index, set to 1
> >   for pinctrl-single,pins and 2 for pinctrl-single,bits
> > 
> > I am now wondering if it wrong for me to expect compatible string of 
> > "pinconf-single" to work with pinctrl-cells of 1.
> 
> Ideally the #pinctrl-cells would be what makes sense for the
> hardware. However, I'm guessing pinctrl-single.c needs patching
> for that to happen.
> 
> > I see that arch/arm/boot/dts/da850.dtsi has:
> > 
> > 154                 pmx_core: pinmux@14120 {
> > 155                         compatible = "pinctrl-single";
> > 156                         reg = <0x14120 0x50>;
> > 157                         #pinctrl-cells = <2>;
> > 158                         pinctrl-single,bit-per-mux;
> > 
> > and arch/arm/boot/dts/keystone-k2l.dtsi has:
> > 
> > 108                 k2l_pmx: pinmux@2620690 {
> > 109                         compatible = "pinctrl-single";
> > 110                         reg = <0x02620690 0xc>;
> > 111                         #address-cells = <1>;
> > 112                         #size-cells = <0>;
> > 113                         #pinctrl-cells = <2>;
> > 114                         pinctrl-single,bit-per-mux;
> 
> Yeah so there's also the "bit-per-mux" variant. That should not
> affect #pinctrl-cells use, we just need to make it more flexible.
> 
> > > We already treat them separately with the new
> > > AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
> > > use updated #pinctrl-cells. But I think pinctrl-single might need some
> > > changes before we can do that.
> > 
> > Do you mean that it would be possible to make the change just for AM335x
> > to start with?
> 
> Yes. So ideally we'd just fix up whatever is needed in pinctrl-single.c,
> then just set #pinctrl-cells = <2> in am33xx-l4.dtsi, and update the
> AM33XX_PADCONF accordingly.

Would you be able to describe what you think AM33XX_PADCONF would look
like if the mux and conf are seperated?

Is there an example you know of for another SoC?
 
> > Do you think the changes would be limited to pinctrl-single.c and the
> > associated device tree files like am33xx-l4.dtsi ?
> 
> Yes that should be the case. There should be no need to churn the board
> specific dts files now that we have AM33XX_PADCONF.

Currently, the macro takes dir and mux:

include/dt-bindings/pinctrl/omap.h:
#define AM33XX_PADCONF(pa, dir, mux) OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))

For example, in arch/arm/boot/dts/am335x-bone-common.dtsi:
AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLUP, MUX_MODE0)

I think it might be more accurate to rename 'dir' to 'conf'.

Table "9.3.1.50 conf_<module>_<pin> Register" in the AM335x TRM [0]
defines bits 0-2 as "Pad functional signal mux select." Bits 3-6 are
what I would consider pin configuration.  Only bit 5 is related to
direction: "Input enable value for the PAD".

> 
> Regards,
> 
> Tony

thanks,
drew
