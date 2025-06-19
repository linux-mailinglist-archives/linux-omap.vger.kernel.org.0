Return-Path: <linux-omap+bounces-3912-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB2AE040D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 13:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CD83167506
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 11:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE5B22A4FA;
	Thu, 19 Jun 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNLxrB/Q"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E153221FDF;
	Thu, 19 Jun 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333191; cv=none; b=jSjfF4j8xsjUJ75UPpM+tFXtvsybsX4FnRioSHMNYelIibOh38c1PY1A6WC9Rl+QQjBIj4fOsjRxMHxl3c7SAxCtE3jqJCgMONJhJHP1vcUF0CQH5lktUMviyeSxoKtdhzzWlrF3MYAFMWm5ppPUDAyexYSrHfX1usIVfyPuHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333191; c=relaxed/simple;
	bh=Cr/XY+f7hqDQDs2BjidW31hWiBLcZfU3+9eud1UsTIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bDENcVfJkmylDsrloE0TPhLa/egAbhJ97pviMVQEgysAHWJiDhV8eI9b/tqleDHMExyNL0kYND7FZ61mr2Eo+hlun2L3w6cUyG5Pcl5+ByueSu8BnhXakIjrtmCENZho0qpXCPOrZthma2xrKChnkBdfgQV2/IWFVxvH8WeVrb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNLxrB/Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5707BC4CEEA;
	Thu, 19 Jun 2025 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333191;
	bh=Cr/XY+f7hqDQDs2BjidW31hWiBLcZfU3+9eud1UsTIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aNLxrB/QRYwEBaF+tAjia9dW7Udi7kuWkruxU1zTqBpiA50BuBb/eb2Sh9eQnyX0Z
	 hCXvmS/g5o6oqhoFWac0l+5AumtLFubrrCAJKO4qzmVI8I+U6JJ4xXFlzy55wahU7/
	 bYuuz0Blf3XejQaYffpv4DcOYLu23ceR30ghmXnuEZC0kV0VM63gQgM6qywBmJCETU
	 zyIYl7sT3lZkbMBVEFlc6W61SbxTkue/pEi+/72c9Nhiufwl+m31PcU1d8sojFTsCS
	 VXGDwy9Sek8/tqrUfF3bhTpnpthyjJ+ojIEBNJWZS14yXIpM1b8ute8o6i0aezAdjx
	 ikSlncSkJG95Q==
From: Lee Jones <lee@kernel.org>
To: linux-omap@vger.kernel.org, avinashlalotra <abinashlalotra@gmail.com>
Cc: linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, 
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org, 
 tony@atomide.com, lee@kernel.org, 
 avinashlalotra <abinashsinghlalotra@gmail.com>
In-Reply-To: <20250613122251.1033078-1-abinashsinghlalotra@gmail.com>
References: <20250613122251.1033078-1-abinashsinghlalotra@gmail.com>
Subject: Re: (subset) [RFC PATCH] mfd: twl4030-irq: remove redundant 'node'
 variable
Message-Id: <175033318908.710815.6342115650499994401.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 12:39:49 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 13 Jun 2025 17:52:51 +0530, avinashlalotra wrote:
> The local variable 'node' was used only once to retrieve dev->of_node
> in a call to irq_domain_create_legacy(). This patch inlines the usage
> and removes the redundant variable, improving code clarity.
> 
> No functional change intended.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: twl4030-irq: remove redundant 'node' variable
      commit: 29be779ed76e7bac378be9edd213b0ddc2f20e0f

--
Lee Jones [李琼斯]


