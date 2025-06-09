Return-Path: <linux-omap+bounces-3782-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF84AD2762
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 22:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA221884FD9
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 20:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D362221268;
	Mon,  9 Jun 2025 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="sX454X3b"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658872206B3;
	Mon,  9 Jun 2025 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499705; cv=none; b=Ga7YcZ7FVATLHNu0rodegvOBx6/HEhvsOHnTBp0ft711bA/yRsXTwNjEc1yZlC9SBz2tvXKiKuYVaQooIf+EJ5/N1gu2Kf8oOAMkPrg5qvkOthiazCtvZiGJiMa5FblT+059UiEzFFUY6eywQBsjoE9Oy4bSyOsufUKhHfsh3v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499705; c=relaxed/simple;
	bh=bISZ39T7g33UOVTUn90Qhg8Z3LoOJf8gq665Zv3e/UE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KUCZGee9OmUc7GGManPQDttgB/O/44p+DcAgo/7JhkUCL5/dzmn2Hx+VFV5cZftWsYP3iqeTIjfGe61FsDMVxF7GeooQmjRhIvAyWxOXM/BWO1bAZpsDqasrXmNwnWGB4Dr/1NwZ6M9Px89lBX8/+So+RLJ9l9fK99M1GHZTVZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=sX454X3b; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Ye5wQq/17F3f3Ad7df566VpkbCoCxX5baHaNJBzH+k8=; b=sX454X3bGLYVmDpUq9WP/jZM9w
	vyuwNPHZ0rObBf78uOjcS0m9EHGJe2PL6UsbQgQXW2bqOUVTOXVX5QCnRXwikjEcUH7ci17fFTfYq
	hkvc8KyIxlzBkcVKq+uWr7f1zOiu7rpIz7Iqze4x0snHkD48+WMgmWgv36Zrw+AnW41tviibuWzJ4
	MsBQ7vIfB8YtK4aWc4hX9Uhth4oNidMlEZwLO6ywkijr6hPb2XN8d7R6EBBUwiUfezCjM8rwoMfGG
	xViMHFrLJaJfgXPjCAhOzckKCfZ4J+WGh0mKAndOJDtTaPVdHF8a9uZQHET5shOTJ3Zj4rdnnBXa9
	p/glL+SA==;
Date: Mon, 9 Jun 2025 22:08:09 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250609220809.3a488972@akair>
In-Reply-To: <20250609-bbg-v2-1-5278026b7498@bootlin.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-1-5278026b7498@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 09 Jun 2025 17:43:51 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> Several device trees incorrectly included ti,am335x-bone-black or
> ti,am335x-bone in their compatible lists without including the
> corresponding bone-black-common or bone-common device tree files.
> Remove these incompatible strings to fix the inconsistency.
> 
thanks for cleaning up some mess.

> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - New patch
> ---
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts          | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts     | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts       | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-shc.dts                | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> index a4f5b5262645..fb88eebb8c5d 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> @@ -11,7 +11,7 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone Green Wireless";
> -	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone", "ti,am33xx";
>  
this looks like too much cleanup, also according your omap.yaml stuff,
ti,am335x-bone-green should still be included.

Regards,
Andreas

