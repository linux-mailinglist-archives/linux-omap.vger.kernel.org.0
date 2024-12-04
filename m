Return-Path: <linux-omap+bounces-2773-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88619E47CE
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2024 23:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00B181652A9
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2024 22:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A931DF748;
	Wed,  4 Dec 2024 22:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXXzMH4T"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9C192B8C;
	Wed,  4 Dec 2024 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351180; cv=none; b=F3KxBltHMcqttx8dddOHYTN8j0YiyOXRFBXmcQE8Ly7zS4oOSPedbWpZlc14cOmwS6zkjhhqKD+2mVuiSklVZdqW3Et/0Oqvw+q2JPJ0ExqdyiYcBeEAU9OcHh9stN93GAGsq7JYwn+x7LdplG7eCReNzLoFtGg8GOE/TgQyiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351180; c=relaxed/simple;
	bh=2T7sODf+o+w83r4IZxWNgLjY7Y0Zrd5ODJ4R2F4/7l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mm5mu+/qfjOr4m3YIeTY7OnwhSocyAxlxtPsmT+5pMoWHn+dGOh7XH7hLgXAfaluFcQY2QXdT1XiClS70heRZVFtqIwTENHkzvCN6W5a7AWAuSAMMJDYH1aPZxDZ+jau0W1bvdc0QhM8PAaUDzl2J9CRWT1J9scNmbkupKItPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXXzMH4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7132C4CECD;
	Wed,  4 Dec 2024 22:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733351177;
	bh=2T7sODf+o+w83r4IZxWNgLjY7Y0Zrd5ODJ4R2F4/7l0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pXXzMH4TTm+2pWSLhzWINWQIybRyfKac/m8pH6oFzDryA60moDprk6gOrkyFwAnDo
	 pG+z3jxfyG7H5T1p4NeeK6XClMrehTTf6CNAjf2cgDHLtspmQWAFuVt4zvsDpMeIq+
	 L5Lp/slniWgIRw22G6Yh4p5HtqsgsaXMhWNhZcV3h+oC8hewz+/TFrkSC9xZ84sAmH
	 4btbRC6uP9qabd11c1QCIO/kzmA9twDmK6lJ0gCYqxEGPPho7LIKQdgBLu4UelcBdq
	 07S5diBr1JAb3etHoxfc/Z7bGWY2tKeDw77TRpzi8sBL8h9YhSaCYJNY1alizGcok2
	 t4aHUEs/lncHQ==
Message-ID: <90d27f95-4747-4a67-96ee-4c865ded66eb@kernel.org>
Date: Thu, 5 Dec 2024 00:26:12 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
To: Andreas Kemnade <andreas@kemnade.info>, tony@atomide.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, hns@goldelico.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, khilman@baylibre.com
Cc: stable@vger.kernel.org
References: <20241204174152.2360431-1-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241204174152.2360431-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/12/2024 19:41, Andreas Kemnade wrote:
> Despite CM_IDLEST1_CORE and CM_FCLKEN1_CORE behaving normal,
> disabling SPI leads to messages like when suspending:
> Powerdomain (core_pwrdm) didn't enter target state 0
> and according to /sys/kernel/debug/pm_debug/count off state is not
> entered. That was not connected to SPI during the discussion
> of disabling SPI. See:
> https://lore.kernel.org/linux-omap/20230122100852.32ae082c@aktux/
> 
> The reason is that SPI is per default in slave mode. Linux driver
> will turn it to master per default. It slave mode, the powerdomain seems to
> be kept active if active chip select input is sensed.
> 
> Fix that by explicitly disabling the SPI3 pins which used to be muxed by
> the bootloader since they are available on an optionally fitted header
> which would require dtb overlays anyways.
> 
> Fixes: a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage")
> CC: stable@vger.kernel.org
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


