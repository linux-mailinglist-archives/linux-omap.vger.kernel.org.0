Return-Path: <linux-omap+bounces-3849-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2AAD6CF5
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 12:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A9A3A03CB
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 10:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1513722FAC3;
	Thu, 12 Jun 2025 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwGH9V3t"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61EC22D9E6;
	Thu, 12 Jun 2025 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722519; cv=none; b=R58/6gHwRfAEkM0mgjLj8To48czbiJ7Wx6SUerdnb0xBqf3A+VkSSm4fvYbWLrLBMPFQk1LlHQNyXDIdLI9n92Z5DbryGX7xkhlddhRJ+5K0UvxsfQBptPqvPRBHroJjhyfY8R7NV8NLRuhQg/3OAOeyqnUQ2Zmjt0af6FaJdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722519; c=relaxed/simple;
	bh=MLTIZ2gBIclvDDfpqNi6HxlCEd1MrHpGoPcXB2yJJtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=paypzxRrkcbTj99l7qwFGYan80CBNLhAjNbqOM0lQlQnr9DVG7PnDjtYmQKnGao/8evWWUj07OgMWDZN1Lir3iAIrlDym1g63acZHDx56rUqm6einvAMrGJCfJCDL0wfM5c7wLUYupvDtqxXTXvF45l/GIwf7kUfpcKUTdLpTMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwGH9V3t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC88C4CEEE;
	Thu, 12 Jun 2025 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749722519;
	bh=MLTIZ2gBIclvDDfpqNi6HxlCEd1MrHpGoPcXB2yJJtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uwGH9V3twf1URZS6YnsuiW7fAa1JfpC/sSh7d3v0rMty9fcwX/kAY9LnDJ5m4ulgt
	 NPPJ+LQKhLOdz+gKIQj3qKb2Cx0oxH3kOE9jSPagnGygMLBtrIiyeGbYEsaH2g1KDz
	 dU1muk/XmdWYSPQHqVfiquL0CJgnHYA7c0sLpnmD5lBSXYcif7t+XZZv+E5TiCJgJf
	 N8UCWMMGqtahZPZ1D6lPA4gD6yK4ml4jnlOLaCGBuehzah8bZImjb7Y3mslh6UCCDN
	 /bYxNvXFIOxl18SIyTNK/Iw+fJEIm5MaHNoHuqY8mmstJiv/jiXxXKpvvdeETUK7u5
	 aR2eXGSaZ1Khg==
From: Lee Jones <lee@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, 
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Chen Ni <nichen@iscas.ac.cn>, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20250520154106.2019525-1-arnd@kernel.org>
References: <20250520154106.2019525-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] mfd: fix building without CONFIG_OF
Message-Id: <174972251660.411546.11712272234120780.b4-ty@kernel.org>
Date: Thu, 12 Jun 2025 11:01:56 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Tue, 20 May 2025 17:40:43 +0200, Arnd Bergmann wrote:
> Using the of_fwnode_handle() means that local 'node' variables are unused
> whenever CONFIG_OF is disabled for compile testing:
> 
> drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
> drivers/mfd/88pm860x-core.c:576:29: error: unused variable 'node' [-Werror=unused-variable]
>   576 |         struct device_node *node = i2c->dev.of_node;
>       |                             ^~~~
> drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
> drivers/mfd/max8925-core.c:659:29: error: unused variable 'node' [-Werror=unused-variable]
>   659 |         struct device_node *node = chip->dev->of_node;
>       |                             ^~~~
> drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
> drivers/mfd/twl4030-irq.c:679:46: error: unused variable 'node' [-Werror=unused-variable]
>   679 |         struct                  device_node *node = dev->of_node;
>       |                                              ^~~~
> 
> [...]

Applied, thanks!

[1/1] mfd: fix building without CONFIG_OF
      commit: fc5f017a71d08eea3983762ce57d27e5bc300db1

--
Lee Jones [李琼斯]


