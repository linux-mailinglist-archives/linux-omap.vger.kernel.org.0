Return-Path: <linux-omap+bounces-5088-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F30C97458
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 13:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 802F1344176
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 12:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC0D30DD37;
	Mon,  1 Dec 2025 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrZtoTkp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A59130CD8F;
	Mon,  1 Dec 2025 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592021; cv=none; b=HzCT5WqYUyFjth9C2ZwCy4UyqqgorEMB/ILrRQ8MzG0QU1Pn2TXn3ZX66JA4tbfDBP2FqrrLIV28RdL6JXc2x+kZlSBbKdlPi6SanGEiuqMVkDY6aw8cHJyreoavRwif0pxC3xYkuiUPqz1yhXq3gpUH6kGpFKm/Aw7oO8nZqxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592021; c=relaxed/simple;
	bh=gRyzElpB9rKrXj4NtzAYAks2mLFjK7Onpiq5H/1Hdd0=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IUYIXYkeePSOggxgOrlLQnHoTTJ+eeadphwY07XNRa03lHoODKRo7dNxOlvJOXaPD26x0lRuOuRquI5BuRaEtU8x35TfZHRVZ+7QKnY/63uYhwCwGFDVsU1+xLVMNL68VMew7HYABABGQJYsUu4L0Mot1ZQgpYZG8/wiTcj1l9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrZtoTkp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F376C4CEF1;
	Mon,  1 Dec 2025 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764592019;
	bh=gRyzElpB9rKrXj4NtzAYAks2mLFjK7Onpiq5H/1Hdd0=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=RrZtoTkpXsrkGn5OfIvrHipULEjQSzC7DCZuQLtjYOkrdB1KdUSpgbEVtkIaL3iXa
	 jBM4DzrmBz1qU8A0A6VosO4NbhVb9zwhQdXwRCk5Vn0A0xOziiq+41C3411xq7vv5x
	 dTG7ZhJr/lbKw6IvOahhSo+o5pkO726tf1XmVAAJN+asbohLWo6akvHVxiL8PsOdJo
	 zpANyOOqFMPyU2z9JkXxerxMncL0kokyK/iwNajYTisCl0dJ1Z4g8cUH98RN+oVeEt
	 AAprTXfeau6yuaWUWnYFXAWQVeLtKfM15+z3YGeB2umR0srgFx+uVNe42iXi4b6DuV
	 ZFEmTzGXkal2A==
From: Rob Herring <robh@kernel.org>
Date: Mon, 01 Dec 2025 06:26:58 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, dakr@kernel.org, 
 andreas@kemnade.info, rafael@kernel.org, lee@kernel.org, arnd@arndb.de, 
 broonie@kernel.org, rogerq@kernel.org, tony@atomide.com, 
 linux-omap@vger.kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
 khilman@baylibre.com, linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi
To: Richard Weinberger <richard@nod.at>
In-Reply-To: <20251129142042.344359-1-richard@nod.at>
References: <20251129142042.344359-1-richard@nod.at>
Message-Id: <176459099531.2908787.4175488657404358940.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add tooling to disable debugfs on OMAP based
 systems


On Sat, 29 Nov 2025 15:20:38 +0100, Richard Weinberger wrote:
> It came to my attention that commands such as `grep -r / -e ...` can cause
> crashes on an AM572x based system.
> An investigation found that reading from various files in /sys/kernel/debug/regmap
> causes imprecise async data aborts.
> 
> One of these register maps is the CTRL_MODULE_CORE register map at 0x4A002000.
> It contains various registers marked as reserved, but the manual indicates
> that read access is still allowed.
> On said system, reading from most registers seems to work, but for some
> an async data abort happens. So it's not entirely clear what registers are safe
> and which are not.
> 
> So, add tooling to allow disabling debugfs access to such dangerous registers.
> Splitting the register map definitions in the device tree seemed less practical to
> me since it would unnecessarily make the device trees more complicated.
> 
> Richard Weinberger (4):
>   dt-bindings: Document new common property: has-inaccessible-regs
>   regmap: Allow disabling debugfs via regmap_config
>   syscon: Wire up has-inaccessible-regs
>   arm: dts: omap: Mark various register maps as dangerous
> 
>  .../devicetree/bindings/common-properties.txt        | 12 ++++++++++++
>  arch/arm/boot/dts/ti/omap/dra7-l4.dtsi               |  4 ++++
>  arch/arm/boot/dts/ti/omap/dra7.dtsi                  |  1 +
>  arch/arm/boot/dts/ti/omap/dra74x.dtsi                |  1 +
>  drivers/base/regmap/regmap.c                         |  2 ++
>  drivers/mfd/syscon.c                                 | 10 ++++++++++
>  include/linux/regmap.h                               |  3 +++
>  7 files changed, 33 insertions(+)
> 
> --
> 2.51.0
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
 Base: tags/v6.18-rc7-1539-gff736a286116 (exact match)
 Base: tags/v6.18-rc7-1539-gff736a286116 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/ti/' for 20251129142042.344359-1-richard@nod.at:

arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@400 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@c00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@500 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml






