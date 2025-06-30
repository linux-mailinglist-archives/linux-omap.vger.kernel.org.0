Return-Path: <linux-omap+bounces-3993-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA4AEDB5E
	for <lists+linux-omap@lfdr.de>; Mon, 30 Jun 2025 13:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F5C189B0A2
	for <lists+linux-omap@lfdr.de>; Mon, 30 Jun 2025 11:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAE0264F9C;
	Mon, 30 Jun 2025 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcYFD092"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06A260585;
	Mon, 30 Jun 2025 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283642; cv=none; b=JPVX8deMMlYdNaEJharxIKqgDCpdAQwXTjZIT0p1LJ76N9eDhoKZmsZ4+dNRUuvePTyDYPz4voNteI9ekka/7YZpscs/ztnPkUWFluGMxNcO73Ak0DWZLPVSO/oZCpyp49xdxdlagJfBU+53nCc9F8JZi95bReJTSQ4lmgti4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283642; c=relaxed/simple;
	bh=gmKNcGdDMCFPQSOys3Imzl6Vfp2FCLYfLD0o34CSah4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tc0/o6ah/oIiqalTC15mMOWydPw2se31i8gM7a8NbYjAHiyQchXjlkpUAHnyxRe3s3VPxWyj4IK4JQQRADsdjUhG88MOTgM2QVjnf6iCq5Ph7ayY3owEHdX5wvwRbdznq1eG5vlj+mvFtJWrCsqtv57VTGaBsSAQJi+ZnnmbDFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcYFD092; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5071AC4CEF3;
	Mon, 30 Jun 2025 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283642;
	bh=gmKNcGdDMCFPQSOys3Imzl6Vfp2FCLYfLD0o34CSah4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UcYFD0927/OKFLo3KDynhMZSrwVblmbb1GdKDvnrfIM3KMNW6GF58Qpyjb/3oISnP
	 yMg0cIxfxgoaFNNG31QhGRuWPWuQidyT1Fn0EyM+7L9mVc1V8NcoW4T/Qe7OGvxsI9
	 twnJHt1/8v1jS7ev1KWQGd7oR3ZY/nsCCOeuyCMCx5yXs2Xr2OsSAlheWrXLBU2iUp
	 rgFkObIeEDbek558v9DhhWaQimEbJyo5txXQtRAITL3jHX1OgpJyDSLQVXyz5WUvOe
	 aH52d1RuA1OY82vlztjDLDujQ2nsxLd0ocG4xPlSxcSnccPgNOtt2KGKzmYstGLVYY
	 9G4N6YKBmdxmQ==
From: Mark Brown <broonie@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, lee@kernel.org, d-gole@ti.com, 
 robertcnelson@gmail.com, jkridner@gmail.com, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com, afd@ti.com
In-Reply-To: <20250620154541.2713036-1-s-ramamoorthy@ti.com>
References: <20250620154541.2713036-1-s-ramamoorthy@ti.com>
Subject: Re: [PATCH v2] regulator: tps65219: Fix devm_kmalloc size
 allocation
Message-Id: <175128363906.28827.3502546879680346196.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:39 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 20 Jun 2025 10:45:41 -0500, Shree Ramamoorthy wrote:
> In probe(), two arrays of structs are allocated with the devm_kmalloc()
> function, but the memory size of the allocations were given as the arrays'
> length (pmic->common_irq_size for the first call and pmic->dev_irq_size for
> the second devm_kmalloc call). The memory size should have been the total
> memory needed.
> 
> This led to a heap overflow when the struct array was used. The issue was
> first discovered with the PocketBeagle2 and BeaglePlay. The common and
> device-specific structs are now allocated one at a time within the loop.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: tps65219: Fix devm_kmalloc size allocation
      commit: eeca209124bb694650026216d3e59cae02d91686

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


