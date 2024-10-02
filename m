Return-Path: <linux-omap+bounces-2289-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3198CBB2
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 05:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C68352862FB
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 03:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3C31862F;
	Wed,  2 Oct 2024 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCs0diqF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC717BA9;
	Wed,  2 Oct 2024 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727841127; cv=none; b=GIpVP1YIJoFR2LfSCTp41cbZVF3tW+Aote0NIzl36nxmmBRg7vAWZ4PSF7quFxj1Pk9veaGduy/IIz4AvvzqEzAfUkwsk5Zkpa2PJn8FV07vgZAvxLRlZ9xDzgBJh8BwK37EbhdJDc9CayJxdoB1ZFQ2l//tG1cDZhoqXQphvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727841127; c=relaxed/simple;
	bh=3xJOu5iktuqnaWaWf8Klgeog0P15S8PfmFdpNl+zCB0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=p5zZV603L0+QSSmmU7KnwJu9y/Zv8wL8W6ZXO5l9TgBE+AJdu8Ex6/ReK7uV89lQkzd2hVzy82UGiSLK/NzSGhE8UhUzKHMeLZPCUUK2872PorZvXDndw1hgRg8UeY4o5JqgNuEFAmU30Jg3ppbBZ7n+9N8y7gOp+NSp/kYg9Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCs0diqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11359C4CEC5;
	Wed,  2 Oct 2024 03:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727841127;
	bh=3xJOu5iktuqnaWaWf8Klgeog0P15S8PfmFdpNl+zCB0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YCs0diqFs4nI9Pz/RB0v3/8kJO5gOkFbdHo0vutjnTZasKXzGJX35QmUjaMVqblWB
	 vc51Bm5n2pQKRWlonzaLl99DWuHFOmpjnqRXFuigfT0bXS8v0+Npkm37MPlT0xk+wG
	 fRz8e8XrgqBNrRnsgUEScLeH0lfmbvH74V3V8bRzC9gxBzvez0OQwCQX5SzyFfuJ4L
	 8s3/xW5hxsFDBAcYl6XI/+VztaWm/N0u7rduoLYGH8yzIFBD7pZ62Fb6u3NJJ17VYN
	 7X9GVC/UW9u/xDJavWE7ou7BlAJYmcRsO+Dk58EDjR6pyea5HnQTTexvZzIyLXJkg3
	 xzpjQWX0pzobQ==
Date: Tue, 01 Oct 2024 22:52:06 -0500
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
Cc: Conor Dooley <conor+dt@kernel.org>, khilman@baylibre.com, 
 tony@atomide.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-omap@vger.kernel.org, aaro.koskinen@iki.fi, rogerq@kernel.org
In-Reply-To: <20240930213008.159647-1-andreas@kemnade.info>
References: <20240930213008.159647-1-andreas@kemnade.info>
Message-Id: <172784021601.525825.18405282128990798038.robh@kernel.org>
Subject: Re: [PATCH 0/4] ARM: dts: omap: omap4-epson-embt2ws: misc gpio
 definitions


On Mon, 30 Sep 2024 23:30:04 +0200, Andreas Kemnade wrote:
> Bring the system into a more defined state and do not rely
> on things being initialized by bootloader.
> 
> Andreas Kemnade (4):
>   ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
>   ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
>   ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
>   ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
> 
>  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 175 +++++++++++++++++-
>  1 file changed, 171 insertions(+), 4 deletions(-)
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


New warnings running 'make CHECK_DTBS=y ti/omap/omap4-epson-embt2ws.dtb' for 20240930213008.159647-1-andreas@kemnade.info:

arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 74, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[115]], 'interrupts-extended': [[1, 0, 74, 4], [116, 260]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[118, 119]], 'interrupts-extended': [[1, 0, 73, 4], [116, 220]], 'bluetooth-gnss': {'compatible': ['ti,wl1283-st'], 'enable-gpios': [[120, 25, 0]], 'clocks': [[121, 1]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#






