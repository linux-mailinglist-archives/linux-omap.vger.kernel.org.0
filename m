Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7579D319377
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 20:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhBKTxy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 14:53:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:36928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230290AbhBKTxP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 14:53:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8355E64E4D;
        Thu, 11 Feb 2021 19:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073154;
        bh=ltKeL/04gCizg8aeACqEsVS4xGJUvLk4rpzH/ifF29Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VYPzFg095dWZPYMaIBhidc5dmC5NeGOW18gPu/781SZjkB01fJM86SBREKah/eXxS
         ezB9JvhkLRU0MiBQw04tpw5lTnR1Ruo+aRKqKdemoWsbgveJinYBBTL4fXg60fXm04
         GyGVbai1IXeEXPYZ2KwVdKxQj0D4ykvzkN+TDm0H6VDg6AObWokSg510wc6dEEd8Y2
         omjU2+w8HiT/C6loJ/kTRqKayd0ayICfAYWD2uF3nFaWyq0u6O2Tvcnpl7l4sWzM4x
         pNFzEWDa7ApAiOSWRKIj1wh7iN3yOHaI9mMFFJy/M8rc/yVGiIZ4PEQGLW+zJAlgSw
         wusjrBCEoQmbQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-16-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-16-lee.jones@linaro.org>
Subject: Re: [PATCH 15/20] clk: ti: dpll: Fix misnaming of '_register_dpll()'s 'user' parameter
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:52:33 -0800
Message-ID: <161307315324.1254594.8520898903110843188@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:35)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/ti/dpll.c:163: warning: Function parameter or member 'user' =
not described in '_register_dpll'
>  drivers/clk/ti/dpll.c:163: warning: Excess function parameter 'hw' descr=
iption in '_register_dpll'
>=20
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
