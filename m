Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFF71D0554
	for <lists+linux-omap@lfdr.de>; Wed, 13 May 2020 05:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgEMDRz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 23:17:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMDRz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 23:17:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCF3420714;
        Wed, 13 May 2020 03:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589339874;
        bh=dH7WodKiySEjxDiPWln5uqwzDx7BMZVAJzuDwPu7u+k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U2azNSUZPH9OQ5pHSotiSPJbw4C10b781W1nSBgco8ZISM06JwZ0vwz6S4URUNRiL
         l9yEjslwCyhfKBiGbo6FLfaQlXCq/wzGwEJicjauCDz9EviB/oW/iwq0zV64D4rQdA
         8ltgHCQ9mh7vDKk2HZ1/FYPQRTgI2scoQE8/mv0g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424152301.4018-1-t-kristo@ti.com>
References: <20200424152301.4018-1-t-kristo@ti.com>
Subject: Re: [PATCH] clk: ti: am33xx: fix RTC clock parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 12 May 2020 20:17:54 -0700
Message-ID: <158933987406.215346.6387841240896338597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-24 08:23:01)
> Right now, trying to use RTC purely with the ti-sysc / clkctrl framework
> fails to enable the RTC module properly. Based on experimentation, this
> appears to be because RTC is sourced from the clkdiv32k optional clock.
> TRM is not very clear on this topic, but fix the RTC to use the proper
> source clock nevertheless.
>=20
> Reported-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-fixes
