Return-Path: <linux-omap+bounces-2226-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1B97DF01
	for <lists+linux-omap@lfdr.de>; Sat, 21 Sep 2024 23:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1991F21591
	for <lists+linux-omap@lfdr.de>; Sat, 21 Sep 2024 21:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2534D1514CC;
	Sat, 21 Sep 2024 21:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPfuKriU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AC313C9B8;
	Sat, 21 Sep 2024 21:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726953156; cv=none; b=cLKSpv+zfIWXE0y/Flm8gHeCQjxRYLLsbPdCvTrv+e2kDBT1KvRTOzRKc8QMatmX98Q+jBG+EYLNqfNnBJrNtsBXPWOuLjvHAIGKcJE559wSKRD8FuhMCfi+JARDXz8HW3jb9IjDjXkDqJd29ieNAJmGdourunHqz0nHQneCS8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726953156; c=relaxed/simple;
	bh=phXqp9sx1SQ3XnHPFtM1vPkRhWKw5lBZejOf6LQt9ao=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=AQ5dtS98DViy92sGQRwuP23wRw/AOLS+i7rrouSIwn+IfCWoFV+Pd+5NJzP2kEZnaN+E/btg+YG2mStJEhOusPXl0Hvu7joWwilbNBdQ4OHT3eXYJyOp+05WeVkgYeGbBpbcctPv4i4PVQ9tAbZO4ZG2x6KtGNRanrLDSeTa3W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPfuKriU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF62C4CEC2;
	Sat, 21 Sep 2024 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726953156;
	bh=phXqp9sx1SQ3XnHPFtM1vPkRhWKw5lBZejOf6LQt9ao=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HPfuKriUJ7XdvindCQ93kJOi52p/hb4yEY19k6ESAe5MkEtBmJzu1PVvFJG1LoVLP
	 wt2gbB1hm8mXSgJ9yO9wDdJIgVrhnjL6MVQVoDQx5VYg2H+cNvLKGaTlLdcm/0F9iq
	 jOQTk9vsaQgUwOuDDUMLYeA6DfZceX5/WoleSw5xz1AURC+vIslXn6+LqnhKmaQUYA
	 cSMriGt6YbVN6H0msczVVKOSyNe6LmyAHERtIuW1Gld5uDFeDTwM7xayTORfk4IYUn
	 UvMSFvyEdL1tKjtYhCNEpMMYtSlvDkTCLNllo+OW+Vc1BQTTK1KvaMNDNiBlZRB4nK
	 R/h+nnCFE873g==
Message-ID: <1a96db1609b5b3b26584d8f823d85b7f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] clk: Switch back to struct platform_driver::remove()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Sat, 21 Sep 2024 14:12:34 -0700
User-Agent: alot/0.10

Quoting Uwe Kleine-K=C3=B6nig (2024-09-09 07:40:25)
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all clk drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---

Applied to clk-next

