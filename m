Return-Path: <linux-omap+bounces-3283-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7BA30F14
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2025 16:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05333188B4C8
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2025 15:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F5C25332D;
	Tue, 11 Feb 2025 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBtFJJNS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1070F17C91;
	Tue, 11 Feb 2025 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286161; cv=none; b=I70Px2RoIMtW2ZvxYuyx2D6j0T97LcSRaOPcQQQ+sKtGSQPCS/WWN5jV4HnUR9FnGarwaYP6ClkIjPfsBbmHVduNPG6/kqF29kI6gCsbwBwF1995xDtHJzNAwEwmUFHlRz5wI8UaZBEuCO+KwvpIXUgV3FAJNJUEHObz+1pMjJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286161; c=relaxed/simple;
	bh=fU+KOUzriA+Byz8qOOwbiZz7qpwtroHkK/lRPC4d7Uo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BcNLF2z0SkeH9wrdRmA6Yus/aIf98gACM5jFgsnslz0KJ5s+XLw0STj1OSA6yBnRjONSy1/bzbBRZMnLaAph7ZDIXrCUUSH3NWFR9iOecyMqwEZhXv5dbwLPyOu6+RrXQs+7ffbs0Ik8KEFKxJtmJicJ1B+hf1AZSPQx96u7xRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBtFJJNS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6009C4CEE7;
	Tue, 11 Feb 2025 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739286160;
	bh=fU+KOUzriA+Byz8qOOwbiZz7qpwtroHkK/lRPC4d7Uo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LBtFJJNSIoaRYwEvIlsSscVildK4P6ZOR0FiF8clXOzgqsqfzvHL9JglPgfN5VEqu
	 b9eYRU542aRPSZ9f6i60t0UttSQlXkWVrVMLceip4epwrw+FKuF2A6jM/6q/vSVkO3
	 C6rxnr7X2usl7o8FQWfs7yEqMRSQtt050HVOksti5OfpW4A396xeAIxdWSAgcJGTUx
	 3/mOFr/LhruZrrSBG3vzG4SKHcbTaSYQJ+oxLiVOEpKRvqywwE0B6CppgTL1agxOCL
	 uinLx32Xpna4CPahtn9GbhRKZ1b2LrCHJv9wvOLMuRHHKpfPeNZzekpUsSRakb+DGG
	 cQxERGqqS6DLQ==
From: Lee Jones <lee@kernel.org>
To: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, aaro.koskinen@iki.fi, 
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org, 
 tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com
In-Reply-To: <20250206173725.386720-1-s-ramamoorthy@ti.com>
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
Subject: Re: [PATCH v5 0/5] Add TI TPS65214 & TPS65215 PMIC MFD Driver
 Support
Message-Id: <173928615760.2233464.12306998726512431222.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 15:02:37 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 06 Feb 2025 11:37:20 -0600, Shree Ramamoorthy wrote:
> TPS65214 and TPS65215 are Power Management Integrated Circuits (PMICs) that
> have significant register map overlap with TPS65219 and each other. The
> series introduces the 2 new PMICs and restructures the existing driver to
> support multiple devices.
> 
> - TPS65214, TPS65215, and TPS65219 each have 3 Buck regulators
> - TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
> - TPS65214's LDO1 maps to TPS65219's LDO3.
> - A key difference between TPS65215 & TPS65214 are the LDO current and
>   voltage output ranges and the configurable options available.
> - TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
> - TPS65215's LDO2 maps to TPS65219's LDO3.
> - TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
> 
> [...]

Applied, thanks!

[1/5] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
      commit: 85e7aef57a9e057545017d55b02073e3c4756b2c
[2/5] regulator: dt-bindings: Add TI TPS65214 PMIC bindings
      commit: 34beb3c87cbb8747f521db5cf1b2a608833f3967
[3/5] mfd: tps65219: Remove regmap_read check
      commit: 5342c8a9e04fc05f485a3886605b803a5180bd64
[4/5] mfd: tps65219: Add support for TI TPS65215 PMIC
      commit: ebcbd21550853b16f307d7da8c846b862e138a98
[5/5] mfd: tps65219: Add support for TI TPS65214 PMIC
      commit: c9878d8d9ac2ecfadfa4fa3543730026c66ad843

--
Lee Jones [李琼斯]


