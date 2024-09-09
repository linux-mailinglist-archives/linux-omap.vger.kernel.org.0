Return-Path: <linux-omap+bounces-2161-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BE972477
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 23:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A77391C23170
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 21:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4DC18C901;
	Mon,  9 Sep 2024 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKV7PFNo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D9189F2F;
	Mon,  9 Sep 2024 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725916858; cv=none; b=MtYCqa5W2nnK1KozcwOZrOKCToRKwe4swXTmOWHabx7R8+xn8uEwIq5jaLBMe5hAObHxGyqrqI6fGKtOJctcPHa7Vp95eWE1jmLc/wOwSfvTHNoc5gjvySc4OlvUjjEAjFDcGWiaL8PLZd+wwetpLFH0cj4w40XoutcIq3e0meI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725916858; c=relaxed/simple;
	bh=tK0vooX06fNMJDsOaDbjgFNdPUmm25HgOZttNw444Wc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=dNQ4Na63UWlfDf3BQomFp0i6v+lp/o4IiGcPi6qV735FWJV7oHLUkdjqx7UH5eymp1gOwG8obzysAGXxPRU4ZYx/n5T2Fe7xttPFDwynuE0ldXSUoTnRJmNJ6CworiL97bvZ5hUEbjmFEiPTJYolZrxVDBEH76HYa8RzNw3XBFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKV7PFNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A2BC4CEC5;
	Mon,  9 Sep 2024 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725916857;
	bh=tK0vooX06fNMJDsOaDbjgFNdPUmm25HgOZttNw444Wc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FKV7PFNoHKTi30ShjIpCoZkwRE9t9Bfen1obWZlTvE/7kBYKoIEn31C3N39nYrzLS
	 wV2jGW6w3KN0K3zsvrErlzYPWwBetvWrY2f307qC1q/3r6J+/p1zFtPeTYhXIBOgN0
	 eciafNUixANNFxl6vSdZtqlBS5a9LmNMRn55+D94diIDR7T0G/PHhYyWeO5X33k4FG
	 eTc+U7uq9LECMV+8qgZJNyPQQ3B1/4G+QyMY4iVu63qvL0PddnNwd/KXYnczd4Jcm4
	 IDC2sERGEVlUEXtxEBNhzMRj5ryAeR0lohVqt8NWNujt4iZz2fJvqK4Z8M+XAaInC8
	 wBai1QZE/xkAA==
Message-ID: <ca22b69fe6311ba87a7dcca9948a62a7.sboyd@kernel.org>
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
Date: Mon, 09 Sep 2024 14:20:55 -0700
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
> Hello,
>=20
> I was lazy and created a single patch for all of clk. Please tell me if
> I should split per vendor (or per-driver). Given that touches so many
> drivers, I also stripped the individual maintainers and just kept the
> mailing lists. I hope this doesn't prevent people to give feedback, but
> otherwise the Cc: list gets Huge.
>=20

I'll apply it on top of clk-next right before sending the main clk PR to
Linus.

