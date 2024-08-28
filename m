Return-Path: <linux-omap+bounces-2047-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEC96319E
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2024 22:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30DD8282B6B
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2024 20:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2AA1ABED5;
	Wed, 28 Aug 2024 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZST9Hly"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68DA1A01CE;
	Wed, 28 Aug 2024 20:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876295; cv=none; b=Z2XEEGt+f+jtp8wDIgxTDxsFU8vQKfeE/2Mc4vCbUtRyrHwlBBN/kWvgLgydBs8DFHc4g+Z6R6f8VvYPVlB7dnIgqdKv4O9v+r4KcpIMb49VLp1xo54Nu4a5fdX+0PSyUyGAcxLDJO/FrOV2vzq6EiFqhLYDMyWY1bBvOsofUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876295; c=relaxed/simple;
	bh=vQ7MRrWmWKu5iDKIJXcG/RjxdCeCVpq+Ow0Xufz6W4o=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=uGRndcnLlKME2PhQnWD4kC2WOylrcm+lU6kl7HU+ok7/Ia6gtZ+7zYAoBSFgbeoM3g5piatBCbVuhk9IrdDXJ1zzDCUJ4RQCARJTKyq6zccDLdHF2C0Gmi3fuQHVIHwC1dfcYF+MDvkUSmGghjvCuCb9k6CHJEzD7jAUxC4B1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZST9Hly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40812C4CEC0;
	Wed, 28 Aug 2024 20:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724876294;
	bh=vQ7MRrWmWKu5iDKIJXcG/RjxdCeCVpq+Ow0Xufz6W4o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZZST9Hlypgu43ZVoiXCeZKLHjjokCxDuAl1ShTsxDlzWXLP605FbL74mlMmhqYkRZ
	 CYtG94TdJX25x13omrWGXUDPNUaYkofYFxA2fxvVtyxeBXO6guFAGg7tzH5AQNCkfG
	 3Sgywap1lv0u4dg5/Xt4B2Eia+CxHgfBwtLXCxW+MCJru6gvzVfV4cTCQD0WXt6kYm
	 1rxUrncDvbS3tgoWmks12cNasI0GA+8rBi7RNUiKiiHU6B9csNzL3CzwHtqaKs0dBT
	 +FAP5iZZG1nLZICdjSt2ODnSdq/QyhzfXnh+aBamDNoZIhxRNLce3Gd1ULwdkumW+9
	 Y0GNhtt9p3xWA==
Message-ID: <b2737143b0c4f4eceb5008e6629f1691.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240826-clk-fix-leak-v1-1-f55418a13aa6@baylibre.com>
References: <20240826-clk-fix-leak-v1-1-f55418a13aa6@baylibre.com>
Subject: Re: [PATCH] clk: ti: dra7-atl: fix leak of of_nodes
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
To: David Lechner <dlechner@baylibre.com>, Tero Kristo <kristo@kernel.org>
Date: Wed, 28 Aug 2024 13:18:11 -0700
User-Agent: alot/0.10

Quoting David Lechner (2024-08-26 08:35:29)
> This fix leaking the of_node references in of_dra7_atl_clk_probe().
>=20
> The docs for of_parse_phandle_with_args() say that the caller must call
> of_node_put() on the returned node. This adds the missing of_node_put()
> to fix the leak.
>=20
> Fixes: 9ac33b0ce81f ("CLK: TI: Driver for DRA7 ATL (Audio Tracking Logic)=
")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Applied to clk-next

