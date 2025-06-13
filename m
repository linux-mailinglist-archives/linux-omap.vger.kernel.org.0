Return-Path: <linux-omap+bounces-3859-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C7AD8DB2
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78F6188EBF5
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 13:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C5A18DF6D;
	Fri, 13 Jun 2025 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gm5FI0RT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48652F22;
	Fri, 13 Jun 2025 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822441; cv=none; b=dWeWLBE6TTUFRU1qtmvbmoMbIiOALYsldxruPsIUzw4J/g2v0p/lXcRS2AzWk6KDai33mgwMiWuek56K1HcEVmUQE3IG1rj7TRnmnv4YzSQQBY4VTTFG0I9Wqs0CQFl0gVcu2vV36Dsrrd2Ox7dYjpZrRDmvzg9cTxnm0IQgPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822441; c=relaxed/simple;
	bh=3Xoe6+pynbY5BKDfCqrCnR0y/uNyIpLZOG0MtPfgG8A=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KUyZBlQYloOHstQPiMuw1clzD/Yd7581sBjb9TOy9T2bNY69rfB1L8ADHmh72rEnjF30W/leP96ynqacEY2EBeFQrHF/S4YSHLZxHqSUcfiVBsXvHK8M4XK7hsOLdMRsh3eIX36NcQ5KMG1qnKtatAjuevCYW7z624u8iWPXTOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gm5FI0RT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F15C4CEE3;
	Fri, 13 Jun 2025 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749822441;
	bh=3Xoe6+pynbY5BKDfCqrCnR0y/uNyIpLZOG0MtPfgG8A=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gm5FI0RTnFpaCthfvCWNQ+d3OOsE3rVfzOjf7LMNSCzM/FBGeY+ncAVJ+Pqr7YjPi
	 63ZtcWE36CLBSJseGQhsi6curgvxoo3v9MYlHNkF8HxPzGZgjXZy4a1i/EQw9oDRGZ
	 qoyMe/Ox+va5zBDokf+gPkZMLs5er+ktvTlENzx/KJwKdmZy/3m7JRj05D1ZDC8BTA
	 XOqXNg/ftgXHjKcdi3jp9+G2lTMIZ5840oDFFYb+/n6+Zx0ZvflcVr1q4qyCft5CGD
	 mmvpfwGx3KcgfYhJXAKhypxgdJLXhpPuPGV2eYZkMhjbWUJvEgkhIm6pfJkMkmWYuo
	 C5by/zKh8I33A==
From: Lee Jones <lee@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>, 
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>, 
 Lee Jones <lee@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250528194416.567127-2-krzysztof.kozlowski@linaro.org>
References: <20250528194416.567127-2-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH] mfd: Constify reg_sequence and regmap_irq
Message-Id: <174982243865.907872.947141930229312940.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 14:47:18 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Wed, 28 May 2025 21:44:17 +0200, Krzysztof Kozlowski wrote:
> Static 'struct reg_sequence' array, 'struct regmap_irq_sub_irq_map' and
> 'struct regmap_irq_chip ' are not modified so can be changed to const
> for more safety.
> 
> 

Applied, thanks!

[1/1] mfd: Constify reg_sequence and regmap_irq
      commit: 754b317d617d76e8acbc54de5a68264bd8f21b25

--
Lee Jones [李琼斯]


