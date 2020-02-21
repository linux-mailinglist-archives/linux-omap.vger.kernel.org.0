Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC6B1686F5
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 19:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbgBUSt0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 13:49:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:43184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbgBUSt0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 13:49:26 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80902208E4;
        Fri, 21 Feb 2020 18:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582310965;
        bh=Ls0R4Qe/IcctCXvAuXMBeYsY+8SGJkuitM+5W+PueKg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zG1EL/XfqmIsZXNzNzh/uxnJRX8DmMaUbAxsIUMpG6QXlGvZ/472Z//ta/RKq+PPE
         /+SBlCLPajAxdEoo5f1eSfdMrzrUI4vtiS279H3BQp6xZe5v362h7GLOF0/89QGCEE
         4bHxYm4WQ4jA3ag5hfTk7dXJxr/tiYtom38sqncM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200221171030.39326-1-tony@atomide.com>
References: <20200221171030.39326-1-tony@atomide.com>
Subject: Re: [PATCH] clk: ti: am43xx: Fix clock parent for RTC clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Date:   Fri, 21 Feb 2020 10:49:24 -0800
Message-ID: <158231096467.258574.11716255621346536160@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2020-02-21 09:10:30)
> Currently enabling clkctrl clock on am4 can fail for RTC as the clock
> parent is wrong for RTC.
>=20
> Fixes: 76a1049b84dd ("clk: ti: am43xx: add new clkctrl data for am43xx")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>=20
> It is unclear if we can end up with RTC hung with the current mainline
> kernel in some cases. Probing RTC with device tree data only seems to
> trigger this every time.

It's small enough and if it's annoying enough we can probably put it
into clk-fixes to get it fixed for this release instead of waiting. Can
Tero ack it?
