Return-Path: <linux-omap+bounces-3198-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB725A1A769
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 16:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2703A2D59
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE5E2135CB;
	Thu, 23 Jan 2025 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzktvbAy"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CDC2135A6;
	Thu, 23 Jan 2025 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647867; cv=none; b=rBlKwtW283ygD/rh3iRtmAmQuRO9pWQH51yNI6Xkp5gfh+mK7DCO7Md7mRAqyLf83MXd4DPRnREJPwF1CgEDyQQzhd5uE37hSn90dC+kbZTRBr0skp6nPLsgBAsKbf5GA6rfo1UkvO8dneuZBHjfmk4Yn6kWPRsKyEp3Hgfu4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647867; c=relaxed/simple;
	bh=GUvLO3EyPNRiEJwMh2o6ziaZ7spo5fOgcMs1C7CHn/k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=C4JXNG8t8AEV+1XnMFmPQe7AVMAMIupPgKaAYu5+jfa7XixRLSa7BSf8iWQrGNN++wlIbOJOj4r+54MEeRXLsh9NoFjhmuTtbfRRopVTmzRcfz5zrTndgRN6S15A5lQwQRPxJZGSWBOhJUdF9pE8o0lSF/tU+LZ1ti4N8MskixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzktvbAy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9B5C4CEDD;
	Thu, 23 Jan 2025 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647867;
	bh=GUvLO3EyPNRiEJwMh2o6ziaZ7spo5fOgcMs1C7CHn/k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UzktvbAyd/DF8F4TEzkyQuh4J2X8DTiOLClDGP9VVOY/MiQL+CST0pmlkZowuZBc4
	 LtJ0DgQhHFbpLM3tNau6rFGnbcJx2+iI1b2Z2AuHcAKR8xFCqo0b2js3CYbeBlcoBB
	 umV8TlRCVhc6RWuGaR5fagEGtbb6w//IQFQIzkf2b/goaLyc+ZK1SNirX1veUBLEpX
	 P/aiGFaHY0BCCo4dIdUDPF4B/1hsKeVCHY9QuLSk+Bh2zsditUzKIcVpdt0mLqgQGW
	 n+4jLbRTJiS1uOW7MKoKrDh3lpxxpSf4+gGza/i8RmKrpwdsmHbcO2p5OfP2zofv6d
	 uL8b8k1rHM5Wg==
Date: Thu, 23 Jan 2025 09:57:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Tony Lindgren <tony@atomide.com>
To: Tom Rini <trini@konsulko.com>
In-Reply-To: <20250121200749.4131923-1-trini@konsulko.com>
References: <20250121200749.4131923-1-trini@konsulko.com>
Message-Id: <173764775069.3793491.1320038672918259827.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties


On Tue, 21 Jan 2025 14:07:49 -0600, Tom Rini wrote:
> When moving the model and compatible properties out of the common
> Pandaboard files and in to the specific boards, the omap4-panda-a4
> file wasn't updated as well and so has lacked a model and compatible
> entry ever since.
> 
> Fixes: a1a57abaaf82 ("ARM: dts: omap4-panda: Fix model and SoC family details")
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Given how long this has been broken it's entirely plausible no a4
> hardware even exists anymore and so dropping this file instead makes
> sense. I only found this because scripts/make_fit.py crashed on these
> properties being missing.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/ti/' for 20250121200749.4131923-1-trini@konsulko.com:

arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /: failed to match any schema with compatible: ['ti,omap4-panda-a4', 'ti,omap4-panda', 'ti,omap4430', 'ti,omap4']






