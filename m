Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F7FEE6BF
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 18:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfKDR5Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 12:57:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:36220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727469AbfKDR5Z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 4 Nov 2019 12:57:25 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95B78214E0;
        Mon,  4 Nov 2019 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572890244;
        bh=x/tE30ugL9cXun8Vkc8mfGersrd/y4ViPXvLjtWqPIE=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=u9PaCoyMjipKxw2s8DiLg3QdCQySeWQ5NdUENpbKmMuaMn5aUVhne1wZu2hxOAXPh
         ImGhQM2qyDw6GnmCOwpqx4N97HP8dpHptCpeEaAwKeQJey7mg9Jeizqnyq7izlsvx3
         r88ZU/g3fH/kqx7CtZe5o5jWnbe6B5rKzA9deWsk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190930154001.46581-1-tony@atomide.com>
References: <20190930154001.46581-1-tony@atomide.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Keerthy <j-keerthy@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix failed to enable error with double udelay timeout
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 09:57:23 -0800
Message-Id: <20191104175724.95B78214E0@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-09-30 08:40:01)
> Commit 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if
> timekeeping is suspended") added handling for cases when timekeeping is
> suspended. But looks like we can still get occasional "failed to enable"
> errors on the PM runtime resume path with udelay() returning faster than
> expected.
>=20
> With ti-sysc interconnect target module driver this leads into device
> failure with PM runtime failing with "failed to enable" clkctrl error.
>=20
> Let's fix the issue with a delay of two times the desired delay as in
> often done for udelay() to account for the inaccuracy.
>=20
> Fixes: 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if t=
imekeeping is suspended")
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-fixes

