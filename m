Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E234E0854
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbfJVQKU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:10:20 -0400
Received: from muru.com ([72.249.23.125]:39000 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfJVQKU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:10:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9C3C580FA;
        Tue, 22 Oct 2019 16:10:54 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:10:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP1: ams-delta FIQ: Fix a typo ("Initiaize")
Message-ID: <20191022161016.GS5610@atomide.com>
References: <20191002145301.11332-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191002145301.11332-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jonathan Neuschäfer <j.neuschaefer@gmx.net> [191002 07:54]:
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  arch/arm/mach-omap1/ams-delta-fiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap1/ams-delta-fiq.c b/arch/arm/mach-omap1/ams-delta-fiq.c
> index 0254eb9cf8c6..4eea3e39e633 100644
> --- a/arch/arm/mach-omap1/ams-delta-fiq.c
> +++ b/arch/arm/mach-omap1/ams-delta-fiq.c
> @@ -110,7 +110,7 @@ void __init ams_delta_init_fiq(struct gpio_chip *chip,
> 
>  		/*
>  		 * FIQ handler takes full control over serio data and clk GPIO
> -		 * pins.  Initiaize them and keep requested so nobody can
> +		 * pins.  Initialize them and keep requested so nobody can
>  		 * interfere.  Fail if any of those two couldn't be requested.
>  		 */
>  		switch (i) {
> --

Thanks applying into omap-for-v5.5/omap1.

Regards,

Tony
