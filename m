Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E5A12D442
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 21:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbfL3UAd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 15:00:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:43102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727680AbfL3UAc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Dec 2019 15:00:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22EA120718;
        Mon, 30 Dec 2019 20:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577736032;
        bh=wy2V7zDsXVuCBlr49awQCbQ1InKC0RXPiXdQyfebSWY=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=kuDi0isoKn9TatzeHhta6+KKWepXJogCSEqRYLBy/pjapS/gbUyPWlm/PWUqche36
         6YtWc4clOLmadM57iH/qctblUmwxBV3sdUuu4liPctH8gnON0lWzlUCzbsgh8ZKSLH
         G+AoP9GxqbOBd70AWHdv+kquZ/DIOomHawE9hIag=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191210172108.38868-3-tony@atomide.com>
References: <20191210172108.38868-1-tony@atomide.com> <20191210172108.38868-3-tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/5] ARM: dts: Add missing omap4 secure clocks
User-Agent: alot/0.8.1
Date:   Mon, 30 Dec 2019 12:00:31 -0800
Message-Id: <20191230200032.22EA120718@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-12-10 09:21:05)
> The secure clocks on omap4 are similar to what we already have for dra7
> in dra7_l4sec_clkctrl_regs and documented in the omap4460 TRM "Table
> 3-1346 L4PER_CM2 Registers Mapping Summary".
>=20
> The secure clocks are part of the l4_per clock manager. As the l4_per
> clock manager has now two clock domains as children, let's also update
> the l4_per clockdomain node name to follow the "clock" node naming with
> a domain specific compatible property.
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

