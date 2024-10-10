Return-Path: <linux-omap+bounces-2390-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E766E9989E5
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 16:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E1E1C23DFF
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68971F473D;
	Thu, 10 Oct 2024 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raHaHj/T"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407461F4729;
	Thu, 10 Oct 2024 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570611; cv=none; b=kSvQV49g8l993/XdUe3SBPZLjI0qOZqatbphY3c4OAjcDi7QXIovO0E2FLNqn+AYo2qioFcHlrm6/7VbrPpNen0mfj3dcG6ubK4qVD0VMw3Y1wnHzgF9rULIDX0IOEYiHFmAntIG60R+zkuhy2oDEc4nJ+PJ1nsFsUoQOXJFBYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570611; c=relaxed/simple;
	bh=xoxOhi2+OpIb75Sn+0Qqr2+/Un7nZwXxykLiEyYmRfY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=S2ZY4EevoLn6MvrzmnIHrZoUm6lhb8rrRSxJhYYj57F7mlrhJviH+mTIBHm3vb8gaFduN/u6Ot0yXkOVtcRAspMY5nSHoZ6aDn3uGHAWUjiAKKMHiVtft7tjSDXt5Wpbyb4PUdZ1ZFLNYIfdiN1daR69n/+zM/fPAILZOGk7E1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raHaHj/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D98BC4CECC;
	Thu, 10 Oct 2024 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728570610;
	bh=xoxOhi2+OpIb75Sn+0Qqr2+/Un7nZwXxykLiEyYmRfY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=raHaHj/TeyeMwvTxB9+w+e12JIQM/CVRC995kLr+E/56CClE7HjYxfT8mc2mtenNS
	 MAXNMmPfhx0HpMzYOdmjhf6SyNm82Cuq4gba7pQ8ox+lulf6AcgFXHPwVZw/iSLTmg
	 +3rCbKPmCV+vFT6Qt7gdj1z/ipRbsS2v5kM9MyvJtvizm0NG7d1TnnWVpZjtR+rGhI
	 WauwOYOa9DQQA9SQXeUdRSKSsK2244VIDo4YfJb0tRXF8GFs5POMH9xUaHRXbr6fID
	 +DoWxaWS1u3kDR+1dDbI/eO8sPjG0foikrdzyxjRy4L1WwIN+30ScABnlfkSSmuid4
	 Ee+IzC6SKotNg==
Date: Thu, 10 Oct 2024 09:30:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, tony@atomide.com
In-Reply-To: <20241010122957.85164-1-andreas@kemnade.info>
References: <20241010122957.85164-1-andreas@kemnade.info>
Message-Id: <172857036157.1533290.9663617637580743712.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] ARM: dts: omap: omap4-epson-embt2ws: misc gpio
 definitions


On Thu, 10 Oct 2024 14:29:53 +0200, Andreas Kemnade wrote:
> Bring the system into a more defined state and do not rely
> on things being initialized by bootloader.
> 
> Changes in V2:
> - better comment strange GPIOs
> - proper names for regulator nodes
> 
> Andreas Kemnade (4):
>   ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
>   ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
>   ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
>   ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
> 
>  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 183 +++++++++++++++++-
>  1 file changed, 179 insertions(+), 4 deletions(-)
> 
> --
> 2.39.5
> 
> 
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


New warnings running 'make CHECK_DTBS=y ti/omap/omap4-epson-embt2ws.dtb' for 20241010122957.85164-1-andreas@kemnade.info:

arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 74, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[115]], 'interrupts-extended': [[1, 0, 74, 4], [116, 260]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[118, 119]], 'interrupts-extended': [[1, 0, 73, 4], [116, 220]], 'bluetooth-gnss': {'compatible': ['ti,wl1283-st'], 'enable-gpios': [[120, 25, 0]], 'clocks': [[121, 1]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#






