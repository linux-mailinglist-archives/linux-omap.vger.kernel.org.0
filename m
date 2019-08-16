Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0FA7906B3
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2019 19:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfHPRWP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Aug 2019 13:22:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbfHPRWO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 16 Aug 2019 13:22:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA93F2086C;
        Fri, 16 Aug 2019 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565976133;
        bh=YasArnaculdPZqpE7xNfqwxVjvAYNby4uPTSrHtBQbI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V0AJSPwhXlcV4HS+NWIktAO6KfoTyblHBaA410pOZaRukLKr0JZIkpeWfhG1bGD2i
         uGn0aS2hUPrU37KVakJFlvpbelFSTf6Pyhw0JGxeE2VNQb3N799rguWsb7t+lnl7yR
         xeLMquoIyg+lm3q8Ai14PePBLQ//yl7gbtww5h1s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190815221249.53235-1-sboyd@kernel.org>
References: <20190815221249.53235-1-sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: Don't reference clk_init_data after registration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 10:22:12 -0700
Message-Id: <20190816172213.BA93F2086C@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Stephen Boyd (2019-08-15 15:12:49)
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
>=20
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

