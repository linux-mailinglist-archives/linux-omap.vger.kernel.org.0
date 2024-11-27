Return-Path: <linux-omap+bounces-2741-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4319DAF9E
	for <lists+linux-omap@lfdr.de>; Thu, 28 Nov 2024 00:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0D7282049
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2024 23:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834C1204089;
	Wed, 27 Nov 2024 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="7xHVRgNr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD426200132;
	Wed, 27 Nov 2024 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732748446; cv=none; b=XW7OuAgct/YgRZ/E048q1nxgPhSkr86DNJLXNVgWe0rsIMGe0AIEzAfkNoLMPRenF3C3+XLvm01V4Z3LR9P/SVgVvZghcj/lElfSksd9Fwuw8FRbNIyfOB9b0xT/3ebXyjAA3SAywxPyvH7xPfbH2F8Yvi4xDRtlG2Qbbh3JGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732748446; c=relaxed/simple;
	bh=zStXecvmU4rqFqJQo/vWiHKnyPjwrzOoN6jGOCJpMgs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jfUWKrj5JQqEbtv07MY0qKFVGAaki8sjrJy7KL51LvbQscA3LGw6YHTEYUY8JmBeO8ZsqZ22tTH9CYiI7vm452coyh3YmoYKTh9oZQrlDhU6luRbGJ8AiC3+cB+97FJy/YSWRB88B3QQOf4goxEoNTiT2tsmBg1xahYHPQ6qSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=7xHVRgNr; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=v7j+46Y7C79/elhptioQhfAS8mTYTmGKvj6E/KHywy8=; b=7xHVRgNreK6FF8xKovw8C3k9YK
	AW2Qq7fXNNCwc6DumrwroJZnGKwXNvYaHp0QtGaihZy1NGEPy3Gv5SowfNbP/7LSsWvCVnzY89kjC
	pkZyY5BSi7Kmu1abbzK51oFikpfgLNT6mOqpqFwpw216FoH7OOxM1b7kh5LkZMUfvsJdcBjy+Z1oX
	I/4LQBAKIAMfQ/mIvZx1Wy+Bbf4EdynGR+cs/2QdMJwKEJInkThpzAkQXLoE0HlWbU3PJYp0OLzaU
	N/h81BA9wd+rKzJeVNRTSehYnd62K+bb3hm6uHM0AxYauHUphyAfiF5ZanrfNFc8ms6MOuUbxb6+r
	n3He1NGg==;
Date: Thu, 28 Nov 2024 00:00:28 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andreas@kemnade.info, hns@goldelico.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, khilman@baylibre.com,
 rogerq@kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: ti/omap: gta04: fix pm issues caused by
 spi module
Message-ID: <20241128000028.1db436c8@akair>
In-Reply-To: <20241116211549.2020727-1-andreas@kemnade.info>
References: <20241116211549.2020727-1-andreas@kemnade.info>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sat, 16 Nov 2024 22:15:49 +0100
schrieb Andreas Kemnade <andreas@kemnade.info>:

> @@ -459,6 +460,15 @@ OMAP3630_CORE2_IOPAD(0x25fa, PIN_INPUT_PULLDOWN | MUX_MODE3)	/* etk_d15.hsusb2_d
>  		>;  
>  	};
>  
> +	mcspi3hog_pins: mcspi3hog-pins {
> +		pinctrl-single,pins = <
> +			OMAP3630_CORE2_IOPAD(0x25dc, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d0 */
> +			OMAP3630_CORE2_IOPAD(0x25de, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d1 */
> +			OMAP3630_CORE2_IOPAD(0x25e0, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d2 */
> +			OMAP3630_CORE2_IOPAD(0x25e2, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d3 */
> +		>;
> +	};
> +
mode7 is not safe mode in this special case, need mode 4 (gpio),
so this patch is broken.

Regards,
Andreas

