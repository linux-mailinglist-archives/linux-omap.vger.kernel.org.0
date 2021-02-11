Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDFF319384
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 20:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhBKTz1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 14:55:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:38072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhBKTzU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 14:55:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 423DD61493;
        Thu, 11 Feb 2021 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073278;
        bh=WQ4lNSjrQeMVaNYSEnThIJAjEycKGb4cOMMSp0E7+6g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=URZ1zh2yGTgqFIXz41SXkwChbIIcItqEGC4nRunG4s6Qss0XLpdKJPPV5CA5cQJ3d
         zmiSiN7ZdNXBKDGbC/nlNMXocOrxofpomAgkP9IH/kIaWATq6qoxV31qQFJQsVB8md
         yRM+X3GGdBQBneLb4tSw0o/DbmTRNR5rpDCUlNWzuqYkpiQ7Ih97TUMkyMKXdolore
         89vbW2ooOqtBbxZZpJK0i4HA+JwOjHVpRjzEmxxDIm1PTIVG8zUYxPtrCkn2Qq0xtY
         mbk3XZ9b54uHr2L0fXyVV42XSQJkZRTTeBxD11yNyuroIupACtUrL+hQJZRwOE6eHA
         /+50jUNO+ieVQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-3-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-3-lee.jones@linaro.org>
Subject: Re: [PATCH 02/21] clk: ti: clkt_dpll: Fix some kernel-doc misdemeanours
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Richard Woodruff <r-woodruff2@ti.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:54:37 -0800
Message-ID: <161307327701.1254594.13576853995244975064@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:21)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/ti/clkt_dpll.c:284: warning: Function parameter or member 'h=
w' not described in 'omap2_dpll_round_rate'
>  drivers/clk/ti/clkt_dpll.c:284: warning: Function parameter or member 'p=
arent_rate' not described in 'omap2_dpll_round_rate'
>  drivers/clk/ti/clkt_dpll.c:284: warning: Excess function parameter 'clk'=
 description in 'omap2_dpll_round_rate'
>=20
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Richard Woodruff <r-woodruff2@ti.com>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
