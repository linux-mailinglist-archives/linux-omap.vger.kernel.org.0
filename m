Return-Path: <linux-omap+bounces-3042-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC266A07241
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 10:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989611887E51
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB72215F4F;
	Thu,  9 Jan 2025 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rc/UxQE1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC5215789;
	Thu,  9 Jan 2025 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416552; cv=none; b=Vq5e2wUuB2tE4nt3VJdnNevpne78dqulRZWP7E0EVVmUgk6ezqgu2Tk8/ceQ8jYv/vSKP7lwND81fUwzlJREY1ZFkO1iOfreQZXYmIPOuU/gMBMevMCpVS3GFFlYEov8hKK1v95vqPIilvs7WqE4Z0ZqHBeH1y8K7i5rdo32C5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416552; c=relaxed/simple;
	bh=OhTMSj3gzbDHwnNCPJcBL9l44FTqEPTH1u0WLgvpEeg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n/F3gEJcZryo6JAbbeIgrEc3IH1SADjBfDpxmNZ/f/fen7wpD9Mmuh1c2buT+GO7E04WUlHnMreL7/x5/Pvu+zl0uyQJcXl8o5Eg7N/VSkOOp46sPFIwjP4OQIax0LBymgiI+tHgxRGuHNGTCMBiY1+ZRjINXr1PzEobZLSmGUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rc/UxQE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E15C4CEE1;
	Thu,  9 Jan 2025 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736416551;
	bh=OhTMSj3gzbDHwnNCPJcBL9l44FTqEPTH1u0WLgvpEeg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rc/UxQE1dBhGwKItP2NInEXcNceCx4XlCU5j1coQleHIb7JUdCakWPlL7sFEpEpGD
	 U1wGE86BXLcN1EZGQu3tFFb7GsZTwP3+CpUdj+2eBwfXTKDSS9N/ZrrCMf8z5aOSvi
	 QapeORbj4us49QhNZz/CA4ABWfn+qgF68UM8vkfXYFS1jQ8oKcG86rh76sI0g2hmTd
	 1I0T5S6QmCYWzUdqO4tMrY5Hm9+ig0dI5m87sxb27/1HHbtFP+TlM0UlFr+Bzq03HZ
	 l2EfKbLeBVnlsMqKpy0g4wbxkh3LJQXjhWgMzkLJUBKydPRahrUvItaGP11IpkIBsx
	 zMtGsqtTPk7Og==
From: Lee Jones <lee@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, lee@kernel.org, brgl@bgdev.pl, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com
In-Reply-To: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
References: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
Subject: Re: [PATCH v1 0/2] TPS65219 MFD Driver Cleanup Series
Message-Id: <173641654929.2549594.4293850372429117827.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 09:55:49 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 17 Dec 2024 14:49:33 -0600, Shree Ramamoorthy wrote:
> This series is in preparation to add 2 PMIC devices to the TPS65219 driver.
> 
> The changes involve using existing helper macros and removing unused macros
> to simplify code. The intention is to remove unnecessary noise from the new
> PMIC device patches adding support to this driver.
> 
> Shree Ramamoorthy (2):
>   mfd: tps65219: Use MFD_CELL macros
>   mfd: tps65219: Remove unused macros & add regmap.h
> 
> [...]

Applied, thanks!

[1/2] mfd: tps65219: Use MFD_CELL macros
      commit: 6891e88dfbbcd897b381dbc464211bf31a854509
[2/2] mfd: tps65219: Remove unused macros & add regmap.h
      commit: 09a897432637aa0b99545ce13d57760cf0cb09d1

--
Lee Jones [李琼斯]


