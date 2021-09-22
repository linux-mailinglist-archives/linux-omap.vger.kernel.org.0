Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FCC414CEA
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 17:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236319AbhIVPYu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Sep 2021 11:24:50 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53728 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhIVPYt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Sep 2021 11:24:49 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18MFNFhR038602;
        Wed, 22 Sep 2021 10:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632324195;
        bh=gIbemJ+kywr0NJwH0hZD9O0Ys2noMM7/Eq9Bx7iJ8QM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xM99oYcYNdc28qoQpm8sht76OjTnlscceA4FzroL5d/DA+kt0v7vpfIXYBs6ohrYq
         QU4MdOXIUAX1n4s5ufrmefRn/AsELv2y1F20PlRHKeKM9qfsyswiI1ZMKLJq6i3ob3
         nU5aYfPIy2KEY2Crq93RiYWUs7KgFC2hOWnnflWY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18MFNFSe038491
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Sep 2021 10:23:15 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Sep 2021 10:23:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 22 Sep 2021 10:23:14 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18MFNAIq028062;
        Wed, 22 Sep 2021 10:23:11 -0500
Subject: Re: [PATCH 5/5] mmc: sdhci-omap: Configure optional wakeirq
To:     Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20210921111600.24577-1-tony@atomide.com>
 <20210921111600.24577-6-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <eafa3743-1f73-8a6e-bcb4-d97405dcdb11@ti.com>
Date:   Wed, 22 Sep 2021 18:23:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921111600.24577-6-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 21/09/2021 14:16, Tony Lindgren wrote:
> Configure optional wakeirq. This may be optionally configured for SDIO
> dat1 pin for wake-up events for SoCs that support deeper idle states.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/mmc/host/sdhci-omap.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -12,8 +12,10 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_device.h>
> +#include <linux/of_irq.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/sys_soc.h>
> @@ -117,6 +119,7 @@ struct sdhci_omap_host {
>   
>   	struct pinctrl		*pinctrl;
>   	struct pinctrl_state	**pinctrl_state;
> +	int			wakeirq;
>   	unsigned long		context_valid:1;
>   	unsigned long		is_runtime_suspended:1;
>   	unsigned long		needs_resume:1;
> @@ -1360,6 +1363,21 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>   	sdhci_omap_context_save(omap_host);
>   	omap_host->context_valid = 1;
>   
> +	of_irq_get_byname(dev->of_node, "wakeup");

No assign to omap_host->wakeirq

> +	if (omap_host->wakeirq == -EPROBE_DEFER) {
> +		ret = -EPROBE_DEFER;
> +		goto err_cleanup_host;
> +	}
> +	if (omap_host->wakeirq > 0) {
> +		device_init_wakeup(dev, true);
> +		ret = dev_pm_set_dedicated_wake_irq(dev, omap_host->wakeirq);
> +		if (ret) {
> +			device_init_wakeup(dev, false);
> +			goto err_cleanup_host;
> +		}
> +		host->mmc->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
> +	}
> +
>   	pm_runtime_put_sync(dev);
>   
>   	return 0;
> @@ -1385,6 +1403,7 @@ static int sdhci_omap_remove(struct platform_device *pdev)
>   
>   	pm_runtime_get_sync(dev);
>   	sdhci_remove_host(host, true);
> +	dev_pm_clear_wake_irq(dev);
>   	pm_runtime_put_sync(dev);
>   	pm_runtime_disable(dev);
>   	sdhci_pltfm_free(pdev);
> 

-- 
Best regards,
grygorii
