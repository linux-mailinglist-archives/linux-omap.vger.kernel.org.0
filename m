Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97C912D445
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 21:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbfL3UAj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 15:00:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:43254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727680AbfL3UAj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Dec 2019 15:00:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FDC820718;
        Mon, 30 Dec 2019 20:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577736039;
        bh=GZzn8HfnoZRWLIfkTeNT9Fn9tQs36qKjqruvMrJZuzY=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=d7RQlN+3djcI2T9apSArTM6/2PmxPl+LScywEUI+treEEAuZRXHzeZPSXHv8NAvGx
         XlhQiGUXDyx8cjWQsp+8OvIHSIMU+n4Mn+ANxDd8dvM47QRqsDREfixbLZg6GUYy12
         Rv35xDMZEIfrI43TpRRJEVjAXdaYQrzcWHjRiXaE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191210172108.38868-4-tony@atomide.com>
References: <20191210172108.38868-1-tony@atomide.com> <20191210172108.38868-4-tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add missing omap5 secure clocks
User-Agent: alot/0.8.1
Date:   Mon, 30 Dec 2019 12:00:38 -0800
Message-Id: <20191230200039.1FDC820718@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-12-10 09:21:06)
> The secure clocks on omap5 are similar to what we already have for dra7
> with dra7_l4sec_clkctrl_regs and documented in the omap5432 TRM in
> "Table 3-1044. CORE_CM_CORE Registers Mapping Summary".
>=20
> The secure clocks are part of the l4per clock manager. As the l4per
> clock manager has now two clock domains as children, let's also update
> the l4per clockdomain node name to follow the "clock" node naming with
> a domain specific compatible property.
>=20
> Compared to omap4, omap5 has more clocks working in hardare autogating
> mode.
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

