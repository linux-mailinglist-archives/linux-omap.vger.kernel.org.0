Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A468D2749B3
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 22:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgIVUA2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 16:00:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVUA2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Sep 2020 16:00:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04AE1221E8;
        Tue, 22 Sep 2020 20:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804828;
        bh=Xp/dnmXZpQ5oF4+Hs+C3y4T4YnmtYpP9tKcrSJlBSnM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XGT3AHSXzEdKilBX/b6qPwmWNSAilxpVJqiSckyLA13gcrYlr15ba0g3mCqVUpf1V
         n/LEMD4KFrRp/V4qnH7C0DQWyBKOJ7rfUzPR9KBOBx6V9fd8EjqY1s1zIOjoxAiYbY
         VJsnBJeAOTvCiXqlcLb6afKbsbxiWmIhSeTwXpUI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200907082600.454-2-t-kristo@ti.com>
References: <20200907082600.454-1-t-kristo@ti.com> <20200907082600.454-2-t-kristo@ti.com>
Subject: Re: [PATCH 1/3] clk: ti: autoidle: add checks against NULL pointer reference
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Date:   Tue, 22 Sep 2020 13:00:26 -0700
Message-ID: <160080482662.310579.152362626058257826@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-09-07 01:25:58)
> The clk pointer passed to omap2_clk_(deny|allow)_idle can be NULL, so
> add checks for this.
>=20
> Reported-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
