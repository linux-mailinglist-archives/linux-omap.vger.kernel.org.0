Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB0C4BC61
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jun 2019 17:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbfFSPFx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jun 2019 11:05:53 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44076 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfFSPFx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Jun 2019 11:05:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so3573898ljc.11
        for <linux-omap@vger.kernel.org>; Wed, 19 Jun 2019 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/la8YhxZ2cr5zsG/Mj3bf2KoRNJCvpbpOWf93KaGA8M=;
        b=n2Rcmy/bvTvujq0Mp0NgQKBCE14/CMC0O4fTI+A+a4Kvj4+M50RkihtSc9uRfk8Z1w
         /mveI+IdabqrlEOJE+jEoSSpQkBHb6VyAKB7JcK8o2xixedM8kCsl6Fk6MUwMMuZQG5z
         TlOTnbmuCaPaFaXBuKMUNFE1QlmI1nXMVlK0Dg1gkQK0qFAh8SnJFPUh5xKa+PBdpJeI
         UrOUDg7RfSI4cAEsRYH3a9ZtlwCJBGphcOqDZRoGHhrglqoJmzzFsTVlR/CNbrJrkReH
         dnG7kL0wcOBxSymEJRCdlhyM724zEicdRxWhlrUwwsyftCxRCTtA+HSZMqPszi0d7Zpa
         4MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/la8YhxZ2cr5zsG/Mj3bf2KoRNJCvpbpOWf93KaGA8M=;
        b=ekPp0rfA72K4XXbmky/a3PhyaCb3DU8oGPQlaB8VZhQpWxEOYrAN0u2Qv2rTwSI9rU
         mWyrh/Virj93XzwGZFiY6DmitUeIUbpb2s7CFSozijb4ehH1LPZ6SIWh51N69WQF9g6I
         5//e6/uYUyE7RImDTjTtu6pIBc1SLqYy5Fl3pbC+YScO4xGHGBTaM+vdWdJ9SfaoWH9q
         /xjgfiMnng8crZ13DK9DL7bDup8kWApTBkfKHFZUOzpOSShbdIOXpaK2OGGJOb6JztHB
         eeWcuVn6prErv2pQwefjpVNLaMWG0pQ284LpGm554RArHd5EuPvdJWIqrp1ASbGwkgWy
         P4Tw==
X-Gm-Message-State: APjAAAXWiyyE4Jn1beBBrs+rvgLc/9TgdXYhVKh40w9yDES4YJFrmqdN
        tmDw4pXWCmIGTbT6RlDOduEPYw==
X-Google-Smtp-Source: APXvYqxJ83jJylZF4/0OSKRawqgT1V4DMOOY2IfhVDxokK2wW4QaZ/7KhrJCKCQaKHgjSaTQiMvx/w==
X-Received: by 2002:a2e:9685:: with SMTP id q5mr18130200lji.227.1560956751539;
        Wed, 19 Jun 2019 08:05:51 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id p76sm2628684ljb.49.2019.06.19.08.05.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 08:05:50 -0700 (PDT)
Date:   Wed, 19 Jun 2019 07:02:32 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, arm@kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v2] ARM: config: Remove left-over BACKLIGHT_LCD_SUPPORT
Message-ID: <20190619140232.hkhrq63ly4mlb3yi@localhost>
References: <1559633061-28003-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559633061-28003-1-git-send-email-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 04, 2019 at 09:24:21AM +0200, Krzysztof Kozlowski wrote:
> The CONFIG_BACKLIGHT_LCD_SUPPORT was removed in commit 8c5dc8d9f19c
> ("video: backlight: Remove useless BACKLIGHT_LCD_SUPPORT kernel
> symbol"). Options protected by CONFIG_BACKLIGHT_LCD_SUPPORT are now
> available directly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>


Applied, thanks.


-Olof
