Return-Path: <linux-omap+bounces-2854-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E7B9F681D
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2024 15:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC34B1891C96
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2024 14:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D38198A3F;
	Wed, 18 Dec 2024 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8YrRmTw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3B35948;
	Wed, 18 Dec 2024 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531615; cv=none; b=d8Bob+wz2apM2omCE1lQbta9Iqiytx2ufdxynzL+AQ74g0Qze7V9J44BYEZ43dIgIRJBu8Czv8VurN6G+qhFCITMRMmF/BneqSuBDQUR9YvzhqzNIn66j3teG80OW44EZkMtLEeFzg43akhRfNhJX6geDSeNRYn7Maq4wOCA8To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531615; c=relaxed/simple;
	bh=vAbDtGtRPsSW+lImJkngmNW70nALlf/K/innemhiBL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ocfZdThbKCKzrZMLPI4TpvNwUok7TlRZq69iHCCGf7sQkLTTPlTlcWGXiEdrImhczZfOHHRCkgdZIuwqoEDjusi+Iir2jIVVUAW9SirXjaC5LnbhL1vrOWH5KatnPRbV5VGCSpKBcOqujLOM5C4IaKfL94ssCl/aHKOiQ57hi1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8YrRmTw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C87C4CECD;
	Wed, 18 Dec 2024 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734531614;
	bh=vAbDtGtRPsSW+lImJkngmNW70nALlf/K/innemhiBL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j8YrRmTwWJqLFEixRuFyilwgfqhbKnUC6DVznbHxOxcxtt/Iamz1jW0HiO6fXXWbD
	 g2Jg/9ZJrUlHnwK9Z8Dz7l9rHeRtAV4ulPwIZMpsfmu3bCuEvpN37SoaNLPRtmQsJv
	 E/MMZmnLfF/ejlWb3r4qA/fWRgGoRHb+XNKUfXkYDA/Ud/UFI0mEI1oR+/jdPUtOSf
	 W+SM+J8dlhi0unUWZH1mXPyMoQbcQ0dxNKS9CACJcBECwTpy5vz24cbzIE+puOikBM
	 7n3bQwVVpIFCA3LciRD07wbPkge9X9NJvpLohcZU9IUUw8inTwkLjbNpDIOe/6ZH8B
	 MUlcA36iqu/yw==
From: Mark Brown <broonie@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, lgirdwood@gmail.com, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com
In-Reply-To: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
References: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
Subject: Re: [PATCH v1 0/4] TPS65219 Regulator Driver Cleanup Series
Message-Id: <173453161253.102936.10383553575204986057.b4-ty@kernel.org>
Date: Wed, 18 Dec 2024 14:20:12 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 17 Dec 2024 14:45:22 -0600, Shree Ramamoorthy wrote:
> This series is in preparation to add 2 PMIC devices to the TPS65219 driver.
> 
> The changes involve using dev_err_probe() for instances that have a chance
> of returning -EPORBE_DEFER, remove redundant code, and follow other PMIC
> regulator driver naming conventions. The intention is to remove unnecessary
> noise from the new PMIC device patches added to this driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] regulator: tps65219: Use dev_err_probe() instead of dev_err()
      commit: e7ce0437709552a5f5e577c29f3dfde620153913
[2/4] regulator: tps65219: Update driver name
      commit: 2ef8310c464cac41a024fc6fd2910e51f10a38e7
[3/4] regulator: tps65219: Remove MODULE_ALIAS
      commit: ca321ef98b80eb282a4dcdd5231f666c610b0575
[4/4] regulator: tps65219: Remove debugging helper function
      commit: 64a6b577490c1c71f1a3bbdb3844717815214621

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


