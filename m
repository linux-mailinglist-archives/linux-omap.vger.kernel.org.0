Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261A8369A6
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2019 04:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfFFCAb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 22:00:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:54244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbfFFCAb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 5 Jun 2019 22:00:31 -0400
Received: from dragon (li1264-180.members.linode.com [45.79.165.180])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12B4420866;
        Thu,  6 Jun 2019 02:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559786431;
        bh=iLIh1cF5PrdXT/fdIuzZB/k+k3Z+d0zIq2E9MelXmLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dv5TTeCz1d2AZNEaYK00A5nsKms4beVe0/HMpGnLt7s6oxOYmK2ryuXseFxDkgcoG
         KMffspjP3zcZ58h0JhogAVnnqLlErgIspfCvlalaTD+KafiKyvMPhYsWg94oU8mZmw
         iN+ojzDvSH7u11XjJvT8HPYB5hzRXhx0B99kMI7A=
Date:   Thu, 6 Jun 2019 10:00:09 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, arm@kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v2] ARM: config: Remove left-over BACKLIGHT_LCD_SUPPORT
Message-ID: <20190606020008.GT29853@dragon>
References: <1559633061-28003-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559633061-28003-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
> 
> ---
> 
> Changes since v1:
> 1. Change also mini2440_defconfig.
> ---
...
>  arch/arm/configs/mxs_defconfig            | 1 -

Acked-by: Shawn Guo <shawnguo@kernel.org>
