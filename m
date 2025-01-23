Return-Path: <linux-omap+bounces-3197-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA9A1A716
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 16:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD6BE3AAC89
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 15:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE34213252;
	Thu, 23 Jan 2025 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kssc1V+c"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E3A212FAD;
	Thu, 23 Jan 2025 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646172; cv=none; b=Rw13CB5MJIN9QNVZGIgL0e47r0i+7DjdAyGMgkV2Y3bHX3dQRfz4p3zHuzS1HeNDwNgF7194VW6mLAkCYJHaZaAFYvN02XMDx3chjEcb4nwKFUdFqjRl2UdFagIZdFYroi8kXIScsSSwD1bK0yQFX2jqqav2Wxr1zEnaPb1dOsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646172; c=relaxed/simple;
	bh=CT3cLcnuTc1g2DiNQyJkYqxPz5U05+lBbGrNRmKtXJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s5cCwfk0cIzn0JS9JsaTk0p1OLXV++e2sj2iNKOHtnZVC2kO7PdIybNyMRjy6R4mfEshrbK9SfHF9QG0bqw+Avz9YxZuk5e1P5lS+wp0/Cnu7DMA/iZbMfeGXG1LCaNB6Sf+4Hz5GJogTbGBdv1lVvlkVJns4xcGo15ewg2e7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kssc1V+c; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFT4Ug390550
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 09:29:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737646144;
	bh=CRkGB3GceLUeejR3dcVm7Hu3nWcnMD2L4Z0M3mLfQKE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kssc1V+cCJobwWgTufYIHAO98RyROnvVXJj0+kdQJYYqCKhfS1QJHXQJpauS3jOIO
	 69jx9Oz//RrEoH75a0KwnweVDXWohmJZK3reXvanhDJ/5jMu+wGTfqIS+A7xWH5AFy
	 L0ct/JcVukcUOfyBUdzSpjO+PX469wXAmp26n2JA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFT4ko004948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 09:29:04 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 09:29:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 09:29:04 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NFT3qU084061;
	Thu, 23 Jan 2025 09:29:03 -0600
Message-ID: <f1e6f49c-71e2-4c6f-b78f-7608739530c9@ti.com>
Date: Thu, 23 Jan 2025 09:29:03 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: arch_k3: Replace select with imply for TI
 mailbox and TI SCI
To: Guillaume La Roque <glaroque@baylibre.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <khilman@baylibre.com>,
        Mattijs Korpershoek
	<mkorpershoek@baylibre.com>, <vishalm@ti.com>,
        Nicolas Frayer
	<nfrayer@baylibre.com>
References: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/23/25 6:12 AM, Guillaume La Roque wrote:
> In order to build TI mailbox and TI SCI as modules, replace
> select with imply.
> 
> Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> Changes in v4:
> - rebase on master branch
> - Link to v3: https://lore.kernel.org/r/20241016-timodulemailboxsci-v3-1-0e7f7a6de97d@baylibre.com
> 
> Changes in v3:
> - rebase with master
> 
> Changes in v2:
> - Use imply instead of removing select altogether and dropped
> patches 2/3 and 3/3 from previous series as using imply makes
> them redundant
> ---
>   arch/arm64/Kconfig.platforms | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 02007256709e..a6e4bfffc09d 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -133,8 +133,8 @@ config ARCH_K3
>   	select PM_GENERIC_DOMAINS if PM
>   	select MAILBOX
>   	select SOC_TI
> -	select TI_MESSAGE_MANAGER
> -	select TI_SCI_PROTOCOL
> +	imply TI_MESSAGE_MANAGER
> +	imply TI_SCI_PROTOCOL

I really don't like "imply" in general, and this will be the only
instance of it now in the whole file..

Your v1 of this series was the right way to do this IMHO. The only
issue was patches 2/3 and 3/3 should have been first in the series to
prevent bisect issues. And they had to go to two different maintainers
so it shouldn't have been a single series in the first place.

Andrew

>   	select TI_K3_SOCINFO
>   	help
>   	  This enables support for Texas Instruments' K3 multicore SoC
> 
> ---
> base-commit: 21266b8df5224c4f677acf9f353eecc9094731f0
> change-id: 20241016-timodulemailboxsci-412e2a6458fc
> 
> Best regards,

