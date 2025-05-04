Return-Path: <linux-omap+bounces-3636-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99842AA8360
	for <lists+linux-omap@lfdr.de>; Sun,  4 May 2025 02:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFFD25A0DAA
	for <lists+linux-omap@lfdr.de>; Sun,  4 May 2025 00:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217A22914;
	Sun,  4 May 2025 00:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/Ha57fX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0CA32;
	Sun,  4 May 2025 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746317004; cv=none; b=hlt/X8Y9EpBKizanOunHrfiUMBuZM0R9LYQLx70uhF0sY0p6Qq/dDoFkBIiqJCeL4JF0pHhs6cQ7IzNw868/v0tTnH1dEyLNAKd9/8H8lygnNa/hQAwgagFOsABbuYx8JFvdTb1bMrHS9n0UtXEjnhJRFdn7nxHZQYbBMgOVBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746317004; c=relaxed/simple;
	bh=Mno4SLcszCX6FGKxxppDC/J9CWohXjwvG7MA1LQb/14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lj7nvQ4WapmNkdNL6ipvvGI96JcX0KVUghthHGEsLnbA28D44Ycnx5K0RtzDeEW6mEYxmih/FMzrvp5GdPkjnT8/Q/UflI1Iz+IVeQu4c0xNEZrW9HsOFO1KhW4sDVwrw6pZO5uvrOL5dGBpXfo7Y2rkJhwN7GAhdQeHgk55i8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/Ha57fX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4439C4CEE3;
	Sun,  4 May 2025 00:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746317004;
	bh=Mno4SLcszCX6FGKxxppDC/J9CWohXjwvG7MA1LQb/14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k/Ha57fXypMH8X92xBkrS25DfVd/YvnkdLdhgwMxftUNgYmSNjTp8OnjIZNkkUAHn
	 7VXIsqqKp51qXaFgiPcwLMicbg5jEDSxO5xZbMEBsjOfg/fKHfdjMxHcfhB0EDl+xc
	 6siILwsAZB4QA4pqsB5aSVGUcMX2lFHV23xcU8J4t4PHFxDBEwJqHKrqWwN4e5LE+q
	 tbc+Xy1X2FR9SNcxDf60I+v4482cSxrdPuje63vtYwsycsJOm+H7PoU7zmZJzc2t70
	 jfyo0CGBss2czmmv/o1cL+cq6x5OT2pROFdCXB+gWZg3dsaKNt9y/mM2ME0D/0dIVJ
	 cATUZdCYqCXbg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, aaro.koskinen@iki.fi, andreas@kemnade.info, 
 khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com
In-Reply-To: <20250425205736.76433-1-s-ramamoorthy@ti.com>
References: <20250425205736.76433-1-s-ramamoorthy@ti.com>
Subject: Re: [PATCH v7 0/4] Add TI TPS65214 & TPS65215 Regulator Support
Message-Id: <174631700028.4095183.1037286484966079333.b4-ty@kernel.org>
Date: Sun, 04 May 2025 09:03:20 +0900
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 25 Apr 2025 15:57:32 -0500, Shree Ramamoorthy wrote:
> Rebase patch series for 6.16 cycle. The related MFD series was integrated
> in mainline during 6.15 cycle [0].
> 
> TPS65214 and TPS65215 are Power Management Integrated Circuits (PMICs) that
> have significant register map overlap with TPS65219 and each other. The
> series introduces the 2 new PMICs and restructures the existing driver to
> support multiple devices.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] regulator: tps65219: Update struct names
      commit: 8c04144e156b49980a786e80c855e41f6c71685c
[2/4] regulator: tps65219: Add support for TPS65215 regulator resources
      commit: 3f2e457efdad5af4164f155bd7ac902258a9b1ce
[3/4] regulator: tps65219: Add support for TPS65215 Regulator IRQs
      commit: 38c9f98db20a649a1f8454f507608b6aef0c9297
[4/4] regulator: tps65219: Add TI TPS65214 Regulator Support
      commit: f1471bc435afa31c8c0c58551922830dc8f4b06b

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


