Return-Path: <linux-omap+bounces-3640-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C19AA9354
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 14:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864051777EB
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 12:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92506250C07;
	Mon,  5 May 2025 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qvDbs6wj"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16769250BED;
	Mon,  5 May 2025 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448608; cv=none; b=eEDxQGiUNgSryJNoYPxHXn9EHrbwJsk6OeAwcg3x0ehgceokm9aqlOnb9lRL//C0LYfcy7T2yir2iZQhHrVUb5k5pgNRw5JSUQXPyf8wJ8B74WUYXMjldSFc5rpwR8FgvWg07P2L7Xd25uC1n53SOzwnyZLCVz3LHrvr38dqKrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448608; c=relaxed/simple;
	bh=Z8eMr+Bv+hUuW5u678MIaYoSAnshxRhttiL6WgsLRAQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inEdQ7+tEw2FnU7WpeoCpgY6sVQY8BFusJe9PrzXSEIf9IbK4lPK26ctjccu8k9tcevIG581QoSBBU7J7XCAJH8o9yB1xdxCbVYDlZbpaeeaJNPc/WsTPIrFO01YQttlLrbj4xABapCaFY4YZwfC8+FyahvM3hwRg04v+3sEfwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qvDbs6wj; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545CaFTc245758
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746448575;
	bh=U80q0hzQWb189zleA5rq0bDksV/4Kegvk1geyPQh0Ow=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qvDbs6wjymtJHDViK9gI15el8zjzDwELIN6Xuwjay5RSoozV0BUWsUBowDqo7yKmX
	 XA9lum/jaw+/uwdKdrmjxaXx4K75RTUE3fFH6zH6L+CMXaehwKey0PJhXfIeKpkM3k
	 NU9eZu1UDi1Z9BVSP6zsw5yckNFq5Bt6AsHmd2q4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545CaFGi029225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 07:36:15 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 07:36:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 07:36:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545CaFY1123903;
	Mon, 5 May 2025 07:36:15 -0500
Date: Mon, 5 May 2025 07:36:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Davis <afd@ti.com>, <vishalm@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Message-ID: <20250505123615.yqzdv7dlel7kyojf@degrease>
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 13:24-20250504, Guillaume La Roque wrote:
> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> select on ARCH_K3 are not needed anymore.
> 
> Remove it and give possibility to enable this driver in modules.
> 
> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  arch/arm64/Kconfig.platforms | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 8b76821f190f..5b63a42c4dff 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -138,8 +138,6 @@ config ARCH_K3
>  	select PM_GENERIC_DOMAINS if PM
>  	select MAILBOX
>  	select SOC_TI
> -	select TI_MESSAGE_MANAGER
> -	select TI_SCI_PROTOCOL
>  	select TI_K3_SOCINFO
>  	help
>  	  This enables support for Texas Instruments' K3 multicore SoC
> 

While at this, is it possible to remove MAILBOX and PM_GENERIC_DOMAINS
from select and make them as modules?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

