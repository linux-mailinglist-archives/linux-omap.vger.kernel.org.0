Return-Path: <linux-omap+bounces-603-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A4855E32
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 10:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C05B3B25F76
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 09:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDCB1B81B;
	Thu, 15 Feb 2024 09:25:50 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EBD179AE
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989150; cv=none; b=eZ7aZSUJtycLVNggfINMwYjKIIBGtpVUckzUvN+0LELaoFokiV3n5ZBdSNz2/K+zYZ60dvwb360dw46vU+tHLDcF3x731PTZvJodgBQFKuCIMD6vb7GQl1o+WUw3MkWmto9Ay/5v0CkDiMwwRZV8DHJubCktbSJpatFSe5brpPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989150; c=relaxed/simple;
	bh=WW+WFmDnH2V+1GQsgAFG07eSRILRm8Qu3HVR57TR4a4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hwsOqKoSO+LCdIvaNRrloeomtz2Neb8CMk6q+34+Dgt+ESH6gJh+Nn9gRg6ZC/ieLKXNHW0q0ywzCluOkPp7VitlANhp+esrFpsV83cC+P8FpsU5Hb/elWwix9lAh76vFyCukMtGNw4z1xwslsuS0p2hopMoERgPUTZooDKk6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 15 Feb 2024 17:55:46 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO ?10.178.36.63?) (10.178.36.63)
	by 156.147.1.121 with ESMTP; 15 Feb 2024 17:55:46 +0900
X-Original-SENDERIP: 10.178.36.63
X-Original-MAILFROM: chanho.min@lge.com
Subject: Re: [PATCH 3/6] arm64: dts: Fix dtc interrupt_provider warnings
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lee Gunho <gunho.lee@lge.com>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
From: Chanho Min <chanho.min@lge.com>
Message-ID: <f5aeffed-9365-b1db-4c32-4ed6da208ea0@lge.com>
Date: Thu, 15 Feb 2024 17:55:46 +0900
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24. 2. 14. 4:34 Rob Herring wrote:
> The dtc interrupt_provider warning is off by default. Fix all the warnings
> so it can be enabled.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

>   arch/arm64/boot/dts/lg/lg1312.dtsi                  | 1 -
>   arch/arm64/boot/dts/lg/lg1313.dtsi                  | 1 -
Acked-by: Chanho Min <chanho.min@lge.com>


