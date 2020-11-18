Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7AA2B7AEE
	for <lists+linux-omap@lfdr.de>; Wed, 18 Nov 2020 11:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgKRKJB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Nov 2020 05:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgKRKJB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Nov 2020 05:09:01 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C201CC061A51
        for <linux-omap@vger.kernel.org>; Wed, 18 Nov 2020 02:09:00 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c17so1532783wrc.11
        for <linux-omap@vger.kernel.org>; Wed, 18 Nov 2020 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=v5bzhwkELaCGICb6d8fhbPIv8kjZ/GySYO0aNNlFxbI=;
        b=f7dFW4F50CQfzWEvnvcXpqGsRreyLTvSEJs4Vetgi65Dhs9Y+kpDbbuw0Z2oRO4UVz
         Ia2Cd9xlkLXbigqtlS2ICHZr06o6sz/PhUWm3hgnaICJFH2Ctf81/qcLyLBLpYCjTOvE
         RHdJcy9yedRuSYXLXOtFdIqSRBAVV2BaltYfZHPgeqVoIPyzHc/MA0bXh+uvH4vaPCRm
         Hm6QYwUUupLnfeEIGVCz40n509jxnYe7NTm7nzlDQZafAhubHPQOpO5wulejcdDSIw/z
         2MXBOyB1XPqwnkGxp+TG0pnmvCXu53y5RzyNH0tCoWyB8BUhDqy2cT7Zbtbrc9eYkw+/
         c+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=v5bzhwkELaCGICb6d8fhbPIv8kjZ/GySYO0aNNlFxbI=;
        b=GZBBGwInwiZZyKCNJxsPxeJ9hreQ2AVZbbVl3tS7PPf21A8quZbCNs2vNUra5WIpii
         X3f+K8QdYaoktmrERfZrW1FRc7jqwO0sfpR6bLZhqcXHA/DTUQFAU9/L1iu9ibH0h34r
         DNAY62AdNzlaXR2kZ49u5WSCBzlC4KoJq8XDCXlzO8ubBEAZ7IzVoA0xPmSvrPoQsoJ9
         jevIJALAId2ak6dgxTSjsjuppzo7UkKRlnqgBZoEfkNmn+70ANom54sl6/xAER9T5qcc
         h4V/H6vYh1B1bS9qEse4BQfPXLumRS0ixNMCGTq7FKxKPK5TtPpGBtSVQ18V6XskVos7
         cASA==
X-Gm-Message-State: AOAM533ilDJ+X1c3tWWqQnPysfLwEDMJEnlhp32/gv7kBc6IDAwMEcPF
        iEVaxRJFbuon9NfzMhPccG6TEg==
X-Google-Smtp-Source: ABdhPJy8HywNgFmlS2rfsayxt8EQeCO4wH18n+eg5IPhEZF2Qs19yFA2H5bqE0ZXWYKfMyQAX5cJjA==
X-Received: by 2002:a05:6000:364:: with SMTP id f4mr3924765wrf.290.1605694139366;
        Wed, 18 Nov 2020 02:08:59 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id e16sm2855448wmk.5.2020.11.18.02.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:08:58 -0800 (PST)
Date:   Wed, 18 Nov 2020 10:08:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Alban Bedel <albeu@free.fr>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Kevin Hilman <khilman@kernel.org>, zhang.lyra@gmail.com,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        dl-linux-imx <linux-imx@nxp.com>, orsonzhai@gmail.com,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        linux-pwm@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Scott Branden <sbranden@broadcom.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Sascha Hauer <kernel@pengutronix.de>, baolin.wang7@gmail.com,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] drivers: gpio: use of_match_ptr() and ACPI_PTR() macros
Message-ID: <20201118100856.GQ1869941@dell>
References: <20201117154340.18216-1-info@metux.net>
 <CAHp75VfPio=TacTTrY=vZp8vZ7qst_7zWeXKDpYvJ6q7oh2Hdw@mail.gmail.com>
 <20201118095342.sviuxvfsbmmn22mo@pengutronix.de>
 <CAHp75Vd9QUCcUoPLUW3kkJC0h=mPUqHNqNJPY74gDGSu67t8Hw@mail.gmail.com>
 <CAHp75Vcdu1aOLuF+EFDZibbi0OwGH4QfBhJQm9VZQkeEGEeKDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vcdu1aOLuF+EFDZibbi0OwGH4QfBhJQm9VZQkeEGEeKDQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 18 Nov 2020, Andy Shevchenko wrote:

> On Wed, Nov 18, 2020 at 11:56 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Nov 18, 2020 at 11:54 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Tue, Nov 17, 2020 at 06:45:37PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > So a system without CONFIG_OF might still make use of .of_match_table?
> >
> > Yep!
> 
> If you are curious:
> https://elixir.bootlin.com/linux/latest/source/drivers/acpi/bus.c#L615

This still doesn't sit quite well with me.

Not the process of ACPI using OF artifacts or the possibilty to embed
OF type structures into ACPI tables, but the fact that an OF-only user
(or so they think) should have to care about that special use-case.

What if we make ACPI select OF?  Or handle the ACPI case explicitly in
the of_match_ptr() declaration?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
