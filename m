Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935CA6F077C
	for <lists+linux-omap@lfdr.de>; Thu, 27 Apr 2023 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244169AbjD0ObW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Apr 2023 10:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244103AbjD0Oau (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Apr 2023 10:30:50 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86A55588
        for <linux-omap@vger.kernel.org>; Thu, 27 Apr 2023 07:30:32 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-14-243-nat.elisa-mobile.fi [85.76.14.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4Q6dSK04H5zyV2;
        Thu, 27 Apr 2023 17:30:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1682605828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/Knutw9efmL7sFDSiTIYCuWAHjFgryPEGA2TX4TFI8g=;
        b=fvKo0ovFYsmLZqbkptswdcEzasmh5TxEkO3yXWDFaL3/BQDHiq6edM82JCXNPAjytShOTW
        BnrMJHdyAj4+IDydBvPEqXXnLNr8zSmlSU/N1fHYGCbI+N/2tXWs0FB/j6mte7ZnsrBOUl
        U2QqxPEHQdP6krcJotehQBVngEi9sO8=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1682605828; a=rsa-sha256; cv=none;
        b=vjOAz8Un/xvUZPuTrmIx4IFAoiCWEOfaoIIlNpgyBlqRasY4NIgQcSPQTxzTi5HlbRIDHv
        UPeVfHiQEjKUKYZ89nQwhZgqm4N6FF4fqJ2XjaGpayZo4ygN3J52hrvPdk/ZaUwMi0JZiS
        t8XEzCV4Aw+CfWVwfx2J1xpnjoI14TY=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1682605828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/Knutw9efmL7sFDSiTIYCuWAHjFgryPEGA2TX4TFI8g=;
        b=JB5nmkq1l6jIvQkwOZqQVi5sMQw+9WqRKC3HbxpOCN9oZpLlsf+sMy4POSQjdIlue280RW
        xqSzqZ3RCqLWShqA5lWOdtHVw2RE/GLaAn4zKBJ9X0rdWMPE3a2rb6ATLmZvcjM5JWwWgU
        zMaq55Ir7ev9Jdv3NVIgi1Bq2TDLk+E=
Date:   Thu, 27 Apr 2023 17:30:23 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
Message-ID: <20230427143023.GB881984@darkstar.musicnaut.iki.fi>
References: <20230426203341.360155-1-linus.walleij@linaro.org>
 <20230426220159.GA881984@darkstar.musicnaut.iki.fi>
 <CACRpkdbGWqbVxVC7tYy2keqDA0OnOumeqXJ2ZyaBTqZF_FMbGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbGWqbVxVC7tYy2keqDA0OnOumeqXJ2ZyaBTqZF_FMbGQ@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Thu, Apr 27, 2023 at 09:09:18AM +0200, Linus Walleij wrote:
> On Thu, Apr 27, 2023 at 12:02 AM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> 
> > > Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> >
> > Fixes should be 92bf78b33b0b ("gpio: omap: use dynamic allocation
> > of base").
> 
> OK I fix Fixes.
> 
> > Thanks, the patch almost works - I can now boot all the way to rootfs
> > (USB disk), and also ethernet works.
> 
> That's actually surprisingly good results... Then we can certainly
> fix this up and get it working.
> 
> > However CF is not working:
> >
> > [    0.276947] (NULL device *): requested GPIO 0 (62) is out of range [0..15] for chip gpio-0-15
> > [    0.277130] Unable to get CF IRQ GPIO descriptor
> 
> Ooops no surprise there. Which gpiochips do you have on OMAP1?
> Just a simple cat /sys/kernel/debug/gpio should give the answer.

Got it working with:

-               GPIO_LOOKUP(OMAP_GPIO_LABEL, 62, "cf_irq",
+               GPIO_LOOKUP("gpio-48-63", 14, "cf_irq",

(BTW, I think these tables are more readable with just string literals
instead of OMAP_GPIO_LABEL...)

Here's full lists from OSK, 770, SX1 and Palm TE with v6.2:

	OSK:

gpiochip1: GPIOs 0-15, parent: platform/omap_gpio.1, gpio-0-15:
 gpio-0   (                    |smc_irq             ) in  lo IRQ 
 gpio-9   (                    |OHCI overcurrent    ) in  hi 

gpiochip2: GPIOs 16-31, parent: platform/omap_gpio.2, gpio-16-31:
 gpio-18  (                    |UART wake           ) in  lo IRQ 

gpiochip3: GPIOs 32-47, parent: platform/omap_gpio.3, gpio-32-47:
 gpio-37  (                    |UART wake           ) in  lo IRQ 

gpiochip4: GPIOs 48-63, parent: platform/omap_gpio.4, gpio-48-63:
 gpio-49  (                    |UART wake           ) in  lo IRQ 
 gpio-62  (                    |cf_irq              ) in  hi IRQ 

gpiochip0: GPIOs 192-207, parent: platform/omap_gpio.0, mpuio:
 gpio-193 (                    |tps65010            ) in  hi IRQ 

gpiochip5: GPIOs 208-214, parent: i2c/i2c-tps65010, tps65010, can sleep:
 gpio-208 (                    |OHCI power          ) out lo 
 gpio-210 (                    |smc_reset           ) out lo 
 gpio-211 (                    |dsp_power           ) out hi 

	770:

gpiochip1: GPIOs 0-15, parent: platform/omap_gpio.1, gpio-0-15:
 gpio-15  (                    |ads7846_pendown     ) in  hi IRQ 

gpiochip2: GPIOs 16-31, parent: platform/omap_gpio.2, gpio-16-31:
 gpio-18  (                    |UART wake           ) in  lo IRQ 
 gpio-23  (                    |MMC cover           ) in  lo 

gpiochip3: GPIOs 32-47, parent: platform/omap_gpio.3, gpio-32-47:
 gpio-37  (                    |UART wake           ) in  lo IRQ 
 gpio-40  (                    |Tahvo IRQ           ) in  lo IRQ 
 gpio-41  (                    |MMC power           ) out hi 

gpiochip4: GPIOs 48-63, parent: platform/omap_gpio.4, gpio-48-63:
 gpio-49  (                    |UART wake           ) in  hi IRQ 
 gpio-62  (                    |Retu IRQ            ) in  lo IRQ 

gpiochip0: GPIOs 192-207, parent: platform/omap_gpio.0, mpuio:
 gpio-201 (                    |CBUS clk            ) out lo 
 gpio-202 (                    |CBUS dat            ) out lo 
 gpio-203 (                    |CBUS sel            ) out hi 

	SX1:

gpiochip1: GPIOs 0-15, parent: platform/omap_gpio.1, gpio-0-15:
 gpio-1   (                    |A_IRDA_OFF          ) out lo 
 gpio-11  (                    |A_SWITCH            ) out lo 
 gpio-15  (                    |A_USB_ON            ) out lo 

gpiochip0: GPIOs 192-207, parent: platform/omap_gpio.0, mpuio:

	Palm TE:

gpiochip1: GPIOs 0-15, parent: platform/omap_gpio.1, gpio-0-15:
 gpio-1   (                    |USB/DC-IN           ) in  lo 
 gpio-6   (                    |TSC2102 PINTDAV     ) in  hi 

gpiochip0: GPIOs 192-207, parent: platform/omap_gpio.0, mpuio:

A.
