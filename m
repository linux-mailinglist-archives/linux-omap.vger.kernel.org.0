Return-Path: <linux-omap+bounces-4409-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F189B3BD8A
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29AD6A60848
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 14:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41A53203A0;
	Fri, 29 Aug 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mnW7oRCJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040B32039B;
	Fri, 29 Aug 2025 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756477567; cv=none; b=XVjVT4YdnyKcoosJJSEOp6MI18wQCGfIQOhE4Ep0jLLLSiXSYwaq6ybVaSC4QHpHBLpmhJeBEgXpWaK38Jd6/4+a61dGgfAZYpuyx0MDxXroeJIy8VpBqkHjq0T+udvjGvA55fm68fQuCk1FuQkYq5wVmasPyKUjK8C7JYsmlzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756477567; c=relaxed/simple;
	bh=ytJh8ZCy8tEaP76386T3hFJ2OXwDtsERk0uOeSU53jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hAKBNM6e5jKq4NdkJgsJcn/vTyC/KAjjAli9aga0n0eVQjF4e+5LNGYijmO7Kw3izN5jH2Vgbn6NzJtx4gXnaSVDctwZkLuzj8anpBpEm+6B/DQ6Tqhaza69yJovWG5ZZ9+K3LzRjrY0HxxrtI8IadcKRvZcxHwCvtqA9QCacCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mnW7oRCJ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57TEPeK62231821;
	Fri, 29 Aug 2025 09:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756477540;
	bh=gbrsqx4gDML3+k24eHm3pe6l6WAxFCQb8s7HbzOlaxk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mnW7oRCJ4ahfphYVqeap1E7m+qt+4GpsOSMK2pL9/GnuqLUhIM8tM+SMeQjelwySO
	 rHUmTxKFn5ELJHHt6pAItRGxECrMDg68G/TQPcGDTqar+bhz6g1hPK9fUmz7fXZak5
	 j2be4mmkBnlK3piuSHUsFrqWoMTnyjDm3GqZ1DiU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57TEPeBE3704761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 09:25:40 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 09:25:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 09:25:40 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57TEPaJ12196116;
	Fri, 29 Aug 2025 09:25:37 -0500
Message-ID: <bea3ce38-b78a-4ed2-a128-3f6643308adb@ti.com>
Date: Fri, 29 Aug 2025 19:55:36 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm: dts: Use DMTimer as Clocksource instead of
 counter_32k
To: Anurag Dutta <a-dutta@ti.com>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
References: <20250829092947.855974-1-a-dutta@ti.com>
 <20250829092947.855974-3-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250829092947.855974-3-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 8/29/2025 2:59 PM, Anurag Dutta wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>

Please check subject of patch


> Clock drift of approximately 500 ppm is observed with 'counter_32k'
> as clocksource. Clock drift is seen because 'counter_32k' is running
> with 32786Hz frequency instead it should run with 32768Hz. Use DMTimer as
> clocksource, which is running at 32768Hz to fix the clock drift issue.
>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts | 9 +++++++++
>   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi          | 2 +-
>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts
> index 0a8b16505ed9..83009883277e 100644
> --- a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts
> +++ b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts
> @@ -36,3 +36,12 @@ &mmc2 {
>   &phy1 {
>   	max-speed = <100>;
>   };
> +
> +&timer12_target {
> +	ti,no-reset-on-init;
> +	ti,no-idle;
> +};
> +
> +&counter32k {
> +	status = "disabled";
> +};
> diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> index ba7fdaae9c6e..a6ac4fd43b54 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> @@ -4439,7 +4439,7 @@ segment@20000 {					/* 0x4ae20000 */
>   			 <0x0000c000 0x0002c000 0x001000>,	/* ap 29 */
>   			 <0x0000f000 0x0002f000 0x001000>;	/* ap 32 */
>   
> -		target-module@0 {			/* 0x4ae20000, ap 19 08.0 */
> +		timer12_target: target-module@0 {			/* 0x4ae20000, ap 19 08.0 */


you can reduce tab between { and comments


>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>   			reg = <0x0 0x4>,
>   			      <0x10 0x4>;

