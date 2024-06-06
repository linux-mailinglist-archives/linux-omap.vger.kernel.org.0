Return-Path: <linux-omap+bounces-1491-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 522488FF13C
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 17:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39F21F25761
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 15:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02F1197A7D;
	Thu,  6 Jun 2024 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfm0e36W"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEEF1DFF5;
	Thu,  6 Jun 2024 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689089; cv=none; b=YrusXQC5doj4/f3Xe8i4AKv3gJEr4VfWXC/diebVD3BIqI8PbxnYsJmvVcR4GlmSTmvcZrrOUvdeKxYkwRAX4KBUoxaVEznjsHGgeUDWJdwCFTMaJISjtV4lGT+buuHPSu0sst5jWBS1v3r4vWfp+51FJ/6cuYl4iYNi9n2kX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689089; c=relaxed/simple;
	bh=GcFNAmn5q2SQG9ldkPPs/kFK2F060SQDna50tRROVUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eIEpQ3zcD5uxp1QtZr1Jk967tx4klBVXO8e7KXJ+9ude4k97QQ0E4ARiSgsPCypZZtMWNod79PxNK01n8xPKYgguTeijWvX1/MMTISIAogxIxzaGHcF5MLPYN40D2ht5ix1+NB6GY6zFnT7Zqz6QZTUkBiCVjVLkFSAMq2wkYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfm0e36W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50819C32781;
	Thu,  6 Jun 2024 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717689088;
	bh=GcFNAmn5q2SQG9ldkPPs/kFK2F060SQDna50tRROVUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pfm0e36W1lHrjgTBGj09xQLmplWLKzxPwOay0nMmQCB7oGVHPxwJtUqvzNaxGt08+
	 kD/oHJP+6fuuC+dboGpztGQ3qFi9sZy2Wwle93ic9Zx51o8mrzj2LJ56k8gRElTgPe
	 MXtVScbNyLbglN4HM2Hcd3LVIQj1JBYwNmGppx/H+MDCK6OBrap7/lRBnaU1ZrKnxh
	 6jjHWSTOgyin2HtNrqmDhg9ca91BBEFjiFTMYawpSvjVzoFHhTXbc11JrX1gdFuycw
	 QWXZZNQnOOMFhH+s6Riunb4fFF5awWQ4qAqTowYqyLFCP4u8fOey80iPBhDm4yy/EG
	 MHo3mtfd40ICA==
From: Mark Brown <broonie@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240606111611.371463-1-andreas@kemnade.info>
References: <20240606111611.371463-1-andreas@kemnade.info>
Subject: Re: [PATCH v4] dt-bindings: regulator: twl-regulator: convert to
 yaml
Message-Id: <171768908601.1590050.10143046251745662528.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 16:51:26 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 06 Jun 2024 13:16:11 +0200, Andreas Kemnade wrote:
> Convert the regulator bindings to yaml.
> 
> Drop one twl5030 compatible due to no documentation on mfd side and no
> users of the twl5030.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] dt-bindings: regulator: twl-regulator: convert to yaml
      commit: 62e4f339619701c4e16b47438ae7529532c28e23

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


