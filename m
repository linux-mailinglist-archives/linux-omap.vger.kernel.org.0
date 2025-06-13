Return-Path: <linux-omap+bounces-3861-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E91B4AD8FBC
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 16:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5170718930B0
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 14:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019411990B7;
	Fri, 13 Jun 2025 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWqdB8cO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F75191493;
	Fri, 13 Jun 2025 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825552; cv=none; b=Wdsih7mqnV9T5yrg6AFEbbpGSbw38EgEDUzwEJ04Pk4Boy6hjZEKnh00feJ1AYARoT65qSqrqzyeQFpu9n0kxmxLhyKMk6qDBmK9Nw2b6FFJEVuJEkpjosSmMzQZY3K9J8NTCLcdU8DhJIZXGMKrclWPjK3NcQIEj11qnRDcgZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825552; c=relaxed/simple;
	bh=MlNL5NuSsckZmfzOBbDDlUapsEairvkF/IEwHQhc/sg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t+e0TSaEEvF9tlJGn8guotHQMRwujtuzj6KxXTJEatCBF2RJ+irzOQ2fYxg5pFVd03dthRDLYol762iZjrC41PNTByIspe2zvGoL6umJU4UOIx7aw3p9vJ9XrVyuV3twkXJk5H2WA/j3XaMilMiYVOSm2PYrP7tUyM2WfXKVg0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWqdB8cO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73634C4CEE3;
	Fri, 13 Jun 2025 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825552;
	bh=MlNL5NuSsckZmfzOBbDDlUapsEairvkF/IEwHQhc/sg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fWqdB8cOmaIYs8CYIv/mmsGUhVKzqCFTAcNqxVhXsqTTghwo1riLPDnIvBh2NMMDg
	 ZrBJtz8FySKher5dgfq6ipqpiIso43mnQ88v8IaqqGRqmA5+QxOZBgpw2UB+l0DY4B
	 tfY7IvV2dA57hGCPeBmDko9+gWY+PEcstepNqDlRlL/+BwIfzeqM4N22wKguigIXAO
	 9OIupGAfw6DpaSqVS4zolbsw4SniC8VO7psLRR6wkoRxTl+Bc6PiLGxd9WKjQ7Vugu
	 Pek71J0GN8o+9u3kg0qwImX3MhmfjPkjcPJlQ0ya/lSqYQMyhIQrrYIaVA0faKD3Wq
	 a9odqk7xkWb3A==
From: Lee Jones <lee@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, linux@treblig.org
Cc: lee@kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250607202232.265344-1-linux@treblig.org>
References: <20250607202232.265344-1-linux@treblig.org>
Subject: Re: (subset) [PATCH] mfd: twl6030-irq: Remove unused
 twl6030_mmc_card_detect*
Message-Id: <174982555021.957746.5154174096136189391.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 15:39:10 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Sat, 07 Jun 2025 21:22:32 +0100, linux@treblig.org wrote:
> twl6030_mmc_card_detect() and twl6030_mmc_card_detect_config() have
> been unused since 2013's
> commit b2ff4790612b ("ARM: OMAP2+: Remove legacy
> omap4_twl6030_hsmmc_init")
> 
> Remove them.
> 
> [...]

Applied, thanks!

[1/1] mfd: twl6030-irq: Remove unused twl6030_mmc_card_detect*
      commit: 3d5341b17ca242fbf1dc78d642c36af0a510c758

--
Lee Jones [李琼斯]


