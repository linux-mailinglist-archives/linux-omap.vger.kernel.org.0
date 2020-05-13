Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669221D055B
	for <lists+linux-omap@lfdr.de>; Wed, 13 May 2020 05:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbgEMDSc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 23:18:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:50318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMDSa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 23:18:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 451A624927;
        Wed, 13 May 2020 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589339910;
        bh=ed6gXENa/W1RjzBFyeIVvQW6Im7PXr0RmRmYy3seB8c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=G07pCmBY2YfcYT/8Dgz2GHDgNgVAtQm+vKpVa/BKuIO8kIc5xu8NO4hvYobThHJnU
         m4iiKkRkQqBZynA0XmrodJonIlEyakObiMOPHDJPuY7/xk2DzJb69VgugE4Nkig+Mk
         yc+4FqogA2Lv/ku3PaANBzdj7PtIKinu35LGy77M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200430083451.8562-1-t-kristo@ti.com>
References: <20200430083451.8562-1-t-kristo@ti.com>
Subject: Re: [PATCH] clk: ti: clkctrl: convert subclocks to use proper names also
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 12 May 2020 20:18:29 -0700
Message-ID: <158933990954.215346.10446994560814171691@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-30 01:34:51)
> Addition of the new internal API to get the clkctrl names missed adding
> the same conversion in place for the subclocks. This leads into missed
> parent/child relationships (i.e. orphaned clocks) with mixed node name
> handling, for example with omap4/omap5 where the l4_per clocks are using
> new naming, but rest are using old. Fix by converting the subclock
> registration to pick correct names for the clocks also.
>=20
> Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node nam=
e")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-fixes
