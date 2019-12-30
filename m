Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2631212D43F
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 21:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbfL3UAY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 15:00:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:42934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727680AbfL3UAY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Dec 2019 15:00:24 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EE1020718;
        Mon, 30 Dec 2019 20:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577736023;
        bh=LXaYelecrLVC5uffYCP8s5MxYuo5nX3oqttyGrW6o44=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=v2E8zYIZ0676IxwIxJmutkFGwfO4VUvmig7VUdocIMGXP2swnm151mODkxZPFqkTS
         i4M/wMk4E2PIJl9lUdsG2q2jcEjs54CMqPnEXgfbPviIVW5d44dc6QBlP3u04disMt
         pHP6E7JKQa3YJWvOExrIbS4S+IGXepJgO0ov51PM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191210172108.38868-2-tony@atomide.com>
References: <20191210172108.38868-1-tony@atomide.com> <20191210172108.38868-2-tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/5] clk: ti: clkctrl: Fix hidden dependency to node name
User-Agent: alot/0.8.1
Date:   Mon, 30 Dec 2019 12:00:22 -0800
Message-Id: <20191230200023.9EE1020718@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-12-10 09:21:04)
> We currently have a hidden dependency to the device tree node name for
> the clkctrl clocks. Instead of using standard node name like "clock", we
> must use "l4-per-clkctrl" type naming so the clock driver can find the
> associated clock domain. Further, if "clk" is specified for a clock node
> name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
> logic for the clock name based on the parent node name for the all the
> clkctrl clocks for the SoC.
>=20
> If the clock node naming dependency is not understood, the related
> clockdomain is not found, or a wrong one can get used if a clock manager
> has multiple clock domains.
>=20
> As each clkctrl instance represents a single clock domain, let's allow
> using domain specific compatible names to specify the clock domain.
>=20
> This simplifies things and removes the hidden dependency to the node
> name. And then later on, after the node names have been standardized,
> we can drop the related code for parsing the node names.
>=20
> Let's also update the binding to use standard "clock" node naming
> instead of "clk" and add the missing description for reg.
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

