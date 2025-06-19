Return-Path: <linux-omap+bounces-3919-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7DAE0A2E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 17:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49032167B0E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 15:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DAB230BFD;
	Thu, 19 Jun 2025 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCaBOipm"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC938225402;
	Thu, 19 Jun 2025 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346397; cv=none; b=L0cM0v73jF9vIEmZ+PGtWqYmQdk3tVvFS7aetAWCSyjtw6HbXTKv+Ohd6ajEl0vXc8lYh6W+8vJZHZbpCsCJgUCuZmtBteXuRTy4sz2UEF7KC9quz6v+9Rt+IcYmvYzW2O/KB6/nhg7WyxKEOwpOV6DEvEsBuMMR/St4Q01Nuew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346397; c=relaxed/simple;
	bh=aVDQVsOpeRgjFQ2sPSr2L/6D++KjudbneKFIrc83/NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F+RIoer02+tvMoXKSDgAh8PEl/LDr9fXa+jJ+YFQ4kFoL0GcrSXth/ialxJeoFebMK6v74jRQE1cWQcVf06PlN/OzoIqHPdBKkx6iTAF3t9L+yOjebsUK9SmflM6rDVEn7la7SwgP9d/sKGkEwEOXIwPgV49cuL6KCl7XgqaWsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCaBOipm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE182C4CEEF;
	Thu, 19 Jun 2025 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750346396;
	bh=aVDQVsOpeRgjFQ2sPSr2L/6D++KjudbneKFIrc83/NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JCaBOipmgONZrs968Q9ICPA+WH+Zidf48VUUR2h29bEjiCiaEfkSs4kbwq5aen2qZ
	 mY90LNA9kNyV0tLZrUOKEHcRAcMlAjsh7kjSwibV1VdAx3NF5u7BN5uCaHbWZT2bEe
	 AlGEkLmB0O49NCfrxfsazcGWSMNy3Tdh9ztlxw0AcHZQmgt7OT9EIAzlTyQ/GsjdBN
	 80R6yubeU0zfh+slAKuvVKbtB5odVlzwyNmfElTJqJYb3d53NEwloTQiFPd7t9Fmzx
	 cLx5rfDhLjjkqPFh5phZzlETMaOdCZAYaXS00LulE1K2KfKmS6dYTZsGCStx1MUAWX
	 HaAHqKbd3/QPA==
From: Lee Jones <lee@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, 
 Abinash Singh <abinashlalotra@gmail.com>
Cc: lee@kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abinash Singh <abinashsinghlalotra@gmail.com>
In-Reply-To: <20250619120315.125620-1-abinashsinghlalotra@gmail.com>
References: <20250619120315.125620-1-abinashsinghlalotra@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: twl4030-irq: remove redundant 'node'
 variable
Message-Id: <175034639445.919047.15916398851991498477.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 16:19:54 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 19 Jun 2025 17:33:15 +0530, Abinash Singh wrote:
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
      commit: 3d77b3cc7cc8115d89fa14eaf601e56372953484

--
Lee Jones [李琼斯]


