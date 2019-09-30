Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106A6C23FB
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 17:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731868AbfI3PK2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 11:10:28 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51700 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731867AbfI3PK2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 11:10:28 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UFA4sE077672;
        Mon, 30 Sep 2019 10:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569856204;
        bh=IobouB3hSryccexn6r91cxD5nyqRsWZvzcNZNBzoyec=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nKoKcVPcm2Q8kdM6uUzxj+PkdqX7uI8MEFWjPgOAYTdwzRfKgQ47+b0i8HIxz0NUW
         7ZSz3XiDsUBI8n/CnilkQtRSgTiul+h5vgzHe/osdaNHDqSDc59jmOD1ho9oWSsB22
         toHoH4x7KqR5sNtW8nRK9Gsr2VWU9Ov6mEaFZATo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UFA4hJ033545
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 10:10:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 10:10:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 10:10:04 -0500
Received: from [172.24.190.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UF9xbO027057;
        Mon, 30 Sep 2019 10:10:00 -0500
Subject: Re: [PATCH v2 linux-next 2/4] arm: configs: davinci_all_defconfig:
 Change CONFIG_REMOTEPROC from m to y
To:     Keerthy <j-keerthy@ti.com>, <arnd@arndb.de>, <olof@lixom.net>,
        <t-kristo@ti.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <tony@atomide.com>
CC:     <s-anna@ti.com>, <hch@lst.de>, <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190920075946.13282-1-j-keerthy@ti.com>
 <20190920075946.13282-3-j-keerthy@ti.com>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <e48c767f-6153-a8d5-b88d-f74927921ae2@ti.com>
Date:   Mon, 30 Sep 2019 20:39:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920075946.13282-3-j-keerthy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/09/19 1:29 PM, Keerthy wrote:
> Commit 6334150e9a36 ("remoteproc: don't allow modular build")
> changes CONFIG_REMOTEPROC to a boolean from a tristate config
> option which inhibits all defconfigs marking CONFIG_REMOTEPROC as
> a module in compiling the remoteproc and dependent config options.
> 
> So fix the davinci_all_defconfig to have CONFIG_REMOTEPROC built in.
> 
> Fixes: 6334150e9a36 ("remoteproc: don't allow modular build")
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  arch/arm/configs/davinci_all_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index b34970ce6b31..01e3c0f4be92 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -228,7 +228,7 @@ CONFIG_RTC_DRV_OMAP=m
>  CONFIG_DMADEVICES=y
>  CONFIG_TI_EDMA=y
>  CONFIG_COMMON_CLK_PWM=m
> -CONFIG_REMOTEPROC=m
> +CONFIG_REMOTEPROC=y

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
