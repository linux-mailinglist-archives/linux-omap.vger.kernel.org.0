Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1565F319374
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 20:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhBKTxp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 14:53:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:36748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231148AbhBKTw6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 14:52:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB40264E4A;
        Thu, 11 Feb 2021 19:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073121;
        bh=KtzijZ/PM9i4IMnnBp9FSg35IZ+/w9/KrbgwEM21nHA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MhndcAzjBOQcDmd8GsnyeD07JP1LB/JNCgqpqZqKq4fo1XfoG39LazPilFh7EnOlw
         plJv2vPerUGjAmnlgXlqZwI/FC409vT+YXh73saPxvvqpcTO1KBfhPLdE6VnzVYl3f
         sxlTKFBkX5OhjMFxZUnYbo5C3kKRQMc5q6iOmT+QjWvbRB91Cg+B5nPt83tGhlDQZ1
         4U42WVRejgqv2pLyoiZlf5PNl5fdCCA2SsDIPH9G0tDV0mG+OL1/0/ZpiK8eI7hd/l
         VI8ZXNxUtifcG4WBvsbLUlWisuTSrwgGO69nxJ23G7YMp9J2d2sadEtS9i/d7ghLf9
         Yt5XrZG5itRCg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-14-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-14-lee.jones@linaro.org>
Subject: Re: [PATCH 13/20] clk: ti: clockdomain: Fix description for 'omap2_init_clk_clkdm's hw param
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:52:00 -0800
Message-ID: <161307312063.1254594.9561982374057798421@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:33)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/ti/clockdomain.c:107: warning: Function parameter or member =
'hw' not described in 'omap2_init_clk_clkdm'
>  drivers/clk/ti/clockdomain.c:107: warning: Excess function parameter 'cl=
k' description in 'omap2_init_clk_clkdm'
>=20
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
