Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71A020B572
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 17:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgFZP5K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 11:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbgFZP5K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jun 2020 11:57:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94946C03E979
        for <linux-omap@vger.kernel.org>; Fri, 26 Jun 2020 08:57:10 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e22so7299760edq.8
        for <linux-omap@vger.kernel.org>; Fri, 26 Jun 2020 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xVd9N213riXPUD2itSPIbSPnCMWuM2XzkjASCyzpRfk=;
        b=db+WpfKJjytEXZGl4eowJwNVULaexvLERg2alc+uKG+MuZeuhs3ivUwPy3SC+p2Jyr
         GGEwLj5C1Vxy/MzQhP+5K/qrN1ee++uXgGmtOoLJKwypKJ2AmcdxRpcfK5JIWraqTRJz
         7jXACPecLQqC2YvHSZPpsoZDDfpsWZyHlXUzfyq+EQ9jslwSU9vWjC5q5STMvUyG0oZ3
         ZF5yRzPBHdzXHowTVJmlN9SrFSREOki3AN6Kx9r5XEo4ThSki0cKQbQIcRGYurIGrF9S
         pw4tX420EWxoaMe5D6NOLLcXt3BBnX/EMsQyu5d0rNZ6jFMHRBRNv24vJkDMjbYoLF7Q
         Km/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xVd9N213riXPUD2itSPIbSPnCMWuM2XzkjASCyzpRfk=;
        b=rUYXLqt23VcOlN3YTM5/EETI6jAG5F8eS0gSV+gxovhCLWvp4Iam7se60JAACL4tCL
         9RO6bT6nhjc0HHM955yOT54ElOch4x7IuwMZxOfW7K/Ci8btn7qsPiaMSEHhk2Yzklm1
         mkxrq3a7dG3m4LHvriCB7dME5GQlTPLr3PJrSL4ldSMBp+DVLRSYIc8SSs3aWVReOggu
         pHOds8qv/LTJpZOS5bs/0Q6iYGWnjIdMJzhXYKvt6i3C6V9ffcdqowbTdGvDWL2e8M8n
         WjmnjLmcdeJHp7w875rUEV9L5FMPsb7mnkwSF8+uxtUaLqJhmkHpdnq2zYjH3v666ogD
         ZPyQ==
X-Gm-Message-State: AOAM530httbL+gAj4q3iGqMjglfrcRqeumWctJ05/z3WXFcKQg3Ope3n
        ZhK9IrEfxuKebRLzbjP6yapQcw==
X-Google-Smtp-Source: ABdhPJyUSdvgabL3NHpOMt/ZXaeE0HbQEdB98XAU15BLq+Sd+ApJWciGpn2vQdsw91HWEYQaguk+Pw==
X-Received: by 2002:aa7:d043:: with SMTP id n3mr4230131edo.102.1593187029128;
        Fri, 26 Jun 2020 08:57:09 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id y12sm21235478edj.37.2020.06.26.08.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 08:57:08 -0700 (PDT)
Date:   Fri, 26 Jun 2020 17:57:05 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: AM335x: how to mux a pin for libgpiod to use?
Message-ID: <20200626155705.GA80557@x1>
References: <20200625231633.GA9012@x1>
 <8d5ff801-62a1-935e-3746-e1c51817a3b6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d5ff801-62a1-935e-3746-e1c51817a3b6@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 26, 2020 at 01:36:50PM +0300, Grygorii Strashko wrote:
> 
> 
> On 26/06/2020 02:22, Drew Fustini wrote:
> > I am trying to determine an upstream method to be able to mux an AM3358
> > pin to gpio and then allow that line to be used from the gpiod userspace
> > ABI.  A "pinctrl-single,pins" device tree property can easily define a
> > gpio mux for a given pin.  For example, the P9_14 pin on the BeagleBone
> > [0] can be set to gpio (mode 7) with this node:
> > 
> > P9_14_gpio_pin: pinmux_P9_14_gpio_pin {
> > 	pinctrl-single,pins = <
> > 	AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_INPUT_PULLDOWN, MUX_MODE7)
> > 	>;
> > };
> > 
> > GPMC_A2 is gpio1_18 per the AM3358 datasheet [1].  Normally, a node for
> > a driver, like gpio-keys, would have a gpio property that cause the
> > driver to claim the gpio line.  But, in that case, the line will not be
> > available to be used through the gpiod userspace ABI.
> > 
> > If no driver claims the gpio line, then I find that the pin mux in
> > "pinctrl-single,pins" does not get applied by the pinctrl-single driver.
> 
> pinmux node can have default node by itself, like
> 
> &am43xx_pinmux {
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&cm_t43_led_pins>;
> 

Thank you, this is what I was missing.

I think this should do what I was looking for:

&am33xx_pinmux {

        pinctrl-names = "default";
        pinctrl-0 = <&libgpiod_pins>;

        libgpiod_pins: pinmux-libgpiod-pins {
                pinctrl-single,pins = <
                        AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_INPUT_PULLDOWN, MUX_MODE7)
                >;
        };


-Drew
