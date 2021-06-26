Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE863B504B
	for <lists+linux-omap@lfdr.de>; Sat, 26 Jun 2021 23:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFZVhD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Jun 2021 17:37:03 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:36052 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230151AbhFZVhD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 26 Jun 2021 17:37:03 -0400
X-Greylist: delayed 393 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Jun 2021 17:37:02 EDT
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4GC6RS169Gz9Y;
        Sat, 26 Jun 2021 23:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1624742886; bh=dWImk9HkBNe+ekrV1q/6KaJflIfNimOeYdfY4Tj38xI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LKk9nIcEmjV5Nq+benxCQN+lYrKITijaeNnuNK0IUsPJU3DvfyEDg7I/yzUs9S5BY
         p3aNJD0zCYme2nf8TS10+wYBd10cJ6EPm1YBLSG/AnNvnyp7eCiL1qxM+87dOwVi/3
         4ENk1Dn2NVShk5z90uslVBLNL2h0syepGaYMKtzNwumKdwG11Iad+B52upuLMn7iZG
         XlM5yqZNYNLphntLWTWmX525dYh9qJS7XrwioXjLR2qPaZHJcuHMbbgB8GiqPSfpOR
         12y5T1uZ5vwffbd1qcQJocow5KrdipPgIhuf6PuYt0FVaye5wjhhYVgc55Aao2U31z
         idlPWKnV6ofcw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.2 at mail
Date:   Sat, 26 Jun 2021 23:28:02 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Jinchao Wang <wjc@cdjrlc.com>
Cc:     ulf.hansson@linaro.org, udovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, s.hauer@pengutronix.de,
        shawnguo@kernel.org, linux-kernel@vger.kernel.org,
        inux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mmc: Prefer unsigned int to bare use of unsigned
Message-ID: <YNeb4rJizAyr4y5y@qmqm.qmqm.pl>
References: <20210626083657.49475-1-wjc@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210626083657.49475-1-wjc@cdjrlc.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Jun 26, 2021 at 04:36:57PM +0800, Jinchao Wang wrote:
> Fix checkpatch warnings:
>     WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
[...]
>  int mmc_send_adtc_data(struct mmc_card *card, struct mmc_host *host, u32 opcode,
> -		       u32 args, void *buf, unsigned len)
> +		       u32 args, void *buf, unsigned int len)

I'd suggest size_t for the 'size' and 'len' arguments while at it.

> --- a/drivers/mmc/host/cb710-mmc.c
[...]

For cb710 part:

Acked-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>

BTW, I think you should directly Cc: driver maintainers with each driver
having its separate patch. I noticed code for cb710 in this patch purely
by chance.

Best Regards
Micha³ Miros³aw
