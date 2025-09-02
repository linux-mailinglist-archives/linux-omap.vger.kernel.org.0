Return-Path: <linux-omap+bounces-4470-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8BB4029F
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 15:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1343B188C543
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 13:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4883093B8;
	Tue,  2 Sep 2025 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D15DdxP8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC8C3054E6;
	Tue,  2 Sep 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819104; cv=none; b=fX+olIjPVH+hedQPUSPy0NdRlqTrefmPi1RjVQuYVqOxb/+LHVY1E+GyWlpIwMJzcEdx8NZn7/v/9c4FwiQWkAPXthwbTOjPHKJFKtbRbR2a2ObxHMcFQ518kDscek0OrKlr569qLfTi/Dk5sm0503LIbax8UAEo2HN268m9/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819104; c=relaxed/simple;
	bh=pxvrqysOOoKqI9I+KTJC9i/jW9YZYq9VAnn8Rz0UXLU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tBy3FtH1X0dBGdaA26zs2MVZLjblodUOVDx1WI53PCbhekmV+iDRXhzJAOU4byAM+V92LK9UFo/LPT3zIeLpSl1mjB9b3Ul+MPiipDVgI3NsxZavHpIni/w8CPSsS+ADkXsNQY7fp3qtPLbKuNWqfQOknCYmucoSXkT+aerbx6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D15DdxP8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE23C4CEED;
	Tue,  2 Sep 2025 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819103;
	bh=pxvrqysOOoKqI9I+KTJC9i/jW9YZYq9VAnn8Rz0UXLU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D15DdxP8SeI9EQl5M7JfcRrBRPvnfeYiorL3aDE01p9e+lOV3T8A7H+efeqmjE4lM
	 IiWM3Nh0U1MHMhEq/tNLYaXzrDX95+zPQaSAo8hOueZAkzT1ysk7ievz2XLd848vvR
	 UWrmZ9nuPcoIve5PDAhKCho4qHvUIsZGvSn+nkDaktl7oysEU4kZJhiGqrq6C3ghOJ
	 P5KSxSCCqJwOEw2F985PmRaZEllhHxD4/O1pMLiyZqROU6sGJvzOlEvzbUJK2B5qSQ
	 fpY+HJBosPRXFC9k3+7L7n8Exe4eAGJuMBkeQM+UhrWg/mJEL/bSaAf9CfAAvIHDOB
	 h0X5wJc4QOiAQ==
Date: Tue, 02 Sep 2025 08:18:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tony@atomide.com, u-kumar1@ti.com, linux-omap@vger.kernel.org, 
 andreas@kemnade.info, linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, 
 rogerq@kernel.org, khilman@baylibre.com, vigneshr@ti.com
To: Anurag Dutta <a-dutta@ti.com>
In-Reply-To: <20250901101525.1090334-1-a-dutta@ti.com>
References: <20250901101525.1090334-1-a-dutta@ti.com>
Message-Id: <175678731411.878123.6451560095367275756.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] AM57 timer fixes


On Mon, 01 Sep 2025 15:45:23 +0530, Anurag Dutta wrote:
> Hi all
> This series introduces a couple of fixes for the am57 board viz.
> 1. Add DRA7 SoC matching to avoid probe failures for timers
> 2. Use DMtimer as clocksource to avoid using 32k counter due to
> incorrect frequency.
> 
> logs:
> https://gist.github.com/anuragdutta731/9366b4e582f7adb86e40ede1add1c79c
> 
> Changelog: v1:
> 1. Modified commit messages and subject according to review comments
> 
> Sinthu Raja (2):
>   bus: ti-sysc: Add DRA7 SoC matching
>   ARM: dts: ti: omap: Use DMTimer as Clocksource instead of counter_32k
> 
>  arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts | 9 +++++++++
>  arch/arm/boot/dts/ti/omap/dra7-l4.dtsi          | 2 +-
>  drivers/bus/ti-sysc.c                           | 3 ++-
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> --
> 2.34.1
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250829 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/ti/' for 20250901101525.1090334-1-a-dutta@ti.com:

arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: serial@0 (ti,dra742-uart): {'compatible': ['ti,dra742-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 69, 4]], 'clock-frequency': 48000000, 'status': ['okay'], 'dmas': [[153, 53], [153, 54]], 'dma-names': ['tx', 'rx'], 'interrupts-extended': [[1, 0, 69, 4], [154, 1016]], 'phandle': 390, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: serial@0 (ti,dra742-uart): {'compatible': ['ti,dra742-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 69, 4]], 'clock-frequency': 48000000, 'status': ['okay'], 'dmas': [[153, 53], [153, 54]], 'dma-names': ['tx', 'rx'], 'interrupts-extended': [[1, 0, 69, 4], [154, 1016]], 'phandle': 389, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/dra76-evm.dtb: ocmcram@40400000 (mmio-sram): $nodename:0: 'ocmcram@40400000' does not match '^sram(@.*)?'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#






