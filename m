Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32F1F705EB5
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 06:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbjEQEev (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 00:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjEQEeu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 00:34:50 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE99C2D63
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 21:34:48 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64384274895so178150b3a.2
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 21:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684298088; x=1686890088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tG1kNE7UYC4wkLWo37BI0qTN7B7iDGV7Ktvk8Nl+rtI=;
        b=MuMlnckAVwMdyNsDsScgi01FUkHiJREx6ygDmlCSAYvvmS3ShaK7bjW6fknneksRan
         Gn8kVbl8VuR04QDcjcOn2IZnJGmGvyU3zvW/c88xIqeULitJJZH1zckUbCGEjZ6OnzNY
         SccIUkQ0mjHOVZhY+pO8e52TMG5owPuhTKBYAAyxQO2Hbyv+n98NDE5vZ3hvvaIkGy3E
         fQ8+2G4hADpDPjI5VuCaB0gvDfMtVanZtS32ty7ZxZB+attc6uabA3/RAs43VTmhYee8
         CIrHZkp1AmUnfoPkzvz5wo1ccJnWqrkvU+2qdLasFp/mal9wglF54LZn881g095OZqmQ
         xDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684298088; x=1686890088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG1kNE7UYC4wkLWo37BI0qTN7B7iDGV7Ktvk8Nl+rtI=;
        b=CsZ+5gjG9JX/wTV4ObFn8IP8QrTk+Tqp8j6CfZj8jWDB1tllejkMqIx3zQmev7CQg/
         8o3JVgF/ybNbu1YIF3A3OELEnrD0nRWN4nF0RHa4GGX4oi70o+ZwUUdvBOSZUSyZjHFS
         PDxDd9jeKkXFeUs/3+YrNLraUUm3HuTYOD/r/u1WeMAyIlys3KHmsy4yhCNJhgxvN6nh
         qJ5a3zCrs/36d8bnyo60j8HCiGsItzRpwZD9t8xTRi7O+fC6v99oeZa6KMuKYmeZJDs7
         MiH3Bop/JPEwmREbPBryAIOfDlf/Fo9hNQzbmU+SGZV3GhGx8dJh8uNbvAUTkAZt8gub
         PBoQ==
X-Gm-Message-State: AC+VfDw6KO3bq2ihwDG3/AxujR8GW0QyGeyDv/0ZcYA1EPoDxtUFfBz3
        XRVZhMYUkoVTTPHeqbCSjtyrRg==
X-Google-Smtp-Source: ACHHUZ7ZntCzPC6Kae1pDbO6DYSSci6YTuhSOAjEZpHtW1xnkNQFCJpFTJqzEf+yQY02x5W3U6f6sw==
X-Received: by 2002:a05:6a00:c83:b0:64a:5cde:3a8c with SMTP id a3-20020a056a000c8300b0064a5cde3a8cmr24779255pfv.28.1684298088145;
        Tue, 16 May 2023 21:34:48 -0700 (PDT)
Received: from localhost ([122.172.82.60])
        by smtp.gmail.com with ESMTPSA id k18-20020aa792d2000000b0064cca73d911sm1328858pfa.103.2023.05.16.21.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 21:34:47 -0700 (PDT)
Date:   Wed, 17 May 2023 10:04:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 12/13] ARM: spear: include "pl080.h" for
 pl080_get_signal() prototype
Message-ID: <20230517043445.qhc6ebfq4pwvgiqh@vireshk-i7>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516153109.514251-13-arnd@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16-05-23, 17:31, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> pl080_get_signal() and pl080_put_signal() are declared in pl080.h
> and defined in pl080.c, but this file is missing an include
> of the header:
> 
> arch/arm/mach-spear/pl080.c:27:5: error: no previous prototype for 'pl080_get_signal'
> arch/arm/mach-spear/pl080.c:62:6: error: no previous prototype for 'pl080_put_signal'
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-spear/pl080.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-spear/pl080.c b/arch/arm/mach-spear/pl080.c
> index d6b8627d2544..47243a8153d0 100644
> --- a/arch/arm/mach-spear/pl080.c
> +++ b/arch/arm/mach-spear/pl080.c
> @@ -16,6 +16,7 @@
>  #include <linux/spinlock_types.h>
>  #include "spear.h"
>  #include "misc_regs.h"
> +#include "pl080.h"
>  
>  static spinlock_t lock = __SPIN_LOCK_UNLOCKED(x);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
