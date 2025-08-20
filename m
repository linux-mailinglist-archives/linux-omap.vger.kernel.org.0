Return-Path: <linux-omap+bounces-4305-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F0B2E7FD
	for <lists+linux-omap@lfdr.de>; Thu, 21 Aug 2025 00:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6811E1CC15E2
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 22:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6992D9EE2;
	Wed, 20 Aug 2025 22:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5FB1aSb"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331A2D3749;
	Wed, 20 Aug 2025 22:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755728264; cv=none; b=VCq15tOyN4CAs/M4xPOL6eVT6/XstBWpeLgHowYa6ASR4qOSPgNL0g4HX3lUdUyPB3WThHkGvS9j5aljj5y/w+qYJKm7ngPELwS1P+H0mbf/WB+mNcwVaHEi+vtyMSm9fL8k8w0nwMp+KJNgq8+cmvVLEIK3VrHl/90TwFt0a0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755728264; c=relaxed/simple;
	bh=NIGjmvVU8M1e+ixa0lF6Va3Ega4zYBMltJN60T9Tr+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PkgcC3cmJO40HthS0YUBNvsPA9qHCMbaSGgT/LptplQhzzeNkb15hlXrE8Q73MVKWog9ChCIoM8vNQvbfNa3/az/cY9Q7lQIIUS9HXpsIb7ox2gDZyISaHcphg9/SORUf87dYDbTfJSgiWP3sCdClhCVIAElL3qGQSWUI5B5YHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5FB1aSb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF35C116C6;
	Wed, 20 Aug 2025 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755728263;
	bh=NIGjmvVU8M1e+ixa0lF6Va3Ega4zYBMltJN60T9Tr+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S5FB1aSbCZQeLXevEo7lCKaC/6dC03HmYZWIwuPMMNp33qvb8Bf5Eiv6hEzOcdQSj
	 bNX8FFHwxikg/eqrRxyVH4mRoIUI+XqRi3nCh+j1QAnsvlg6PXqJ0yXg6W7KkmlIty
	 5SH13qWxCYu1c7Z5i0pu+PVRwv8FRQMrFBb7LwGY3FDxmvUvpkboUdpzuzsHx89wjZ
	 qhtkSMQ3fy3p3v5xEwZWTFHk3vTmlK6M125u49z6X5vvAbsIc9hbJk/AKzXTFt1oWR
	 iUcVFvpaWYxlRXCOHN3RVGCIoI8k4ORuREXLxhGszYvHe6wcOTCV4YQw51l7teuJ+Q
	 0WuPVdGIawcbQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, 
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: peter.ujfalusi@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org
In-Reply-To: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
References: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH v4 0/2] ASoC: dt-bindings: Convert TI TWL4030 sound
 bindings to schema
Message-Id: <175572826140.300376.10438251274472224671.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 23:17:41 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 19 Aug 2025 22:13:00 +0200, Jihed Chaibi wrote:
> This series converts the legacy TXT bindings for the TI TWL4030
> sound-related modules to the modern YAML DT schema format.
> 
> This work was previously part of a larger series but is now being sent
> as a focused submission for the ASoC subsystem.
> 
> Link to v3 discussion:
> https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: ti,twl4030-audio: convert to DT schema
      commit: 04113322406b4763677922f80ba5ab44a8dae7bb
[2/2] ASoC: dt-bindings: omap-twl4030: convert to DT schema
      commit: c232495d28ca092d0c39b10e35d3d613bd2414ab

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


