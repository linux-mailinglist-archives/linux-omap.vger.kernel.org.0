Return-Path: <linux-omap+bounces-3279-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C6A2C49F
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2025 15:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C0B3ADF41
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2025 14:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AC6221D9C;
	Fri,  7 Feb 2025 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTO3fmSk"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41842206BC;
	Fri,  7 Feb 2025 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936958; cv=none; b=EsQ/70TRU99As7OWunSxCSM/V4GpadzDQaddNW9YrZ2UB9aRfKm6hL6e0IvNMfiPplHRzx51i7pRqZPxmORnz5vqT5PnSrEdECswzToQY9BbdMinG3NQoJjbzeYBtEbPGiTxegAyfIkPU9L5RZxJ8yUCF4Tmbnk1yYTtJofWTJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936958; c=relaxed/simple;
	bh=pmfXU9Wsj09/R+t75sQ7ZBh1nlvJb+h+a5nQHQlBvH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pa7N1+VwoQ5JWPYDcBZpDPDe2nfd3W0RwmhPBIVQtnFPye4BiRbKFUOJ2B+xPLL11Fhqb1Xg7/BD4JeCiJDdeXTaDz1vOxztlkJFX1/2ptysGODvf7xuOgd25nSROfjdCt/Hi67pNv8EYngCafNJFnYhluebXUeZvJAVxW8+2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTO3fmSk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44BCC4CEE5;
	Fri,  7 Feb 2025 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936957;
	bh=pmfXU9Wsj09/R+t75sQ7ZBh1nlvJb+h+a5nQHQlBvH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YTO3fmSkx5+FiwGCNcLVn1Sq99nOd9KIgtRZSbaC0UwBYEFga40XetPxhTmrnSRxw
	 ZUalM7nCPGq8sWhRYNNQHG2xNRYsLtGqppjUqxLsei0y7pUXm6NKM1bDSRjNDM0yYf
	 bIAmJ4aDi3a2sbQWBc/KPrW50GmHHTc7oCPdQXBgLgXbneFka2wMnnb16RLfnNA3aw
	 j9eEyinVRmU/CTil1wEuYfWGMWx+mwpUfVzIE7thOhNoSZjncSmENeW818Vpr5D90t
	 CoXEehMKtCMS4dWW1sCfrzmiXmnaVgT+o+0cO43DHCgytSFdPBi+vEGRJrORZ/Hf7s
	 Rhd7d39wJffFQ==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
Subject: Re: (subset) [PATCH v2 0/5] ASoC: cpcap: Implement jack headset
 detection
Message-Id: <173893695439.35212.2551382819515781818.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:34 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 22 Jan 2025 18:41:24 +0200, Ivaylo Dimitrov wrote:
> cpcap audio codec found on cpcap PMIC supports headset detection
> and PTT button through its 3.5 mm jack. This series implements
> support for those capabilities.
> 
> Changelog:
> v2:
> - cpcap.c: fix a typo
> - dt-bindings: fix interrupts description and alignment
> - motorola-cpcap-mapphone.dtsi: fix interrupts alignment
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/5] ASoC: cpcap: Implement .set_bias_level
      commit: 5b4288792ff246cf2bda0c81cebcc02d1f631ca3
[3/5] dt-bindings: mfd: motorola-cpcap: Document audio-codec interrupts
      commit: 02d4a97ce30c0494ce6a614cd54d583caa0f8016
[5/5] ASoC: cpcap: Implement jack detection
      commit: 7ed1b265021dd13ce5619501b388e489ddc8e204

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


