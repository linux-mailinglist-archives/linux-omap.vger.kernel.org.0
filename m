Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61353081BE
	for <lists+linux-omap@lfdr.de>; Fri, 29 Jan 2021 00:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhA1XPq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Jan 2021 18:15:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51458 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbhA1XPp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Jan 2021 18:15:45 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10SNEi7K109853;
        Thu, 28 Jan 2021 17:14:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611875684;
        bh=bq6iSGP/RE+Xm/ja0Wbs/DCk32U/HkC//x7/CEJGZe8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZT5EefVFKHK9BOOOdRJyV+PZz1+M8bb0HKt1acgOTo5RtCGDywmh552hEi+1OSxER
         RBZPE7xmxkOJe7WL3IjmPOs+Ujg3+QA752ISPqOcQZA11J7ZF8wDABRGHqaPP35li3
         HO6FEVls/LrLVMCSOnKe6gXJ7179hyJhK9EQkWII=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10SNEiNA047036
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 Jan 2021 17:14:44 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 Jan 2021 17:14:44 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 Jan 2021 17:14:44 -0600
Received: from [10.250.35.71] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10SNEhHq097772;
        Thu, 28 Jan 2021 17:14:43 -0600
Subject: Re: [PATCH] remoteproc/wkup_m3: Drop legacy platform data no longer
 needed
To:     Tony Lindgren <tony@atomide.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Dave Gerlach <d-gerlach@ti.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20210128084402.1832-1-tony@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ec2b5581-b207-f7ed-2f0d-09e5b5d9dfaa@ti.com>
Date:   Thu, 28 Jan 2021 17:14:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128084402.1832-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 1/28/21 2:44 AM, Tony Lindgren wrote:
> We have v5.11 booting am3 and 4 with ti-sysc interconnect target module
> driver and genpd. As part of that conversion, wkup_m3 driver got converted
> to optionally use reset driver instead of legacy platform data with
> commit 57df7e370d2a ("remoteproc/wkup_m3: Use reset control driver if
> available").
> 
> The related SoC calls already got removed with commit b62168e516da ("ARM:
> OMAP2+: Fix am4 only build after genpd changes").
> 
> We can now just drop the legacy platform data for v5.12 or later, there's
> no rush to do this for v5.11.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Dave Gerlach <d-gerlach@ti.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/mach-omap2/pdata-quirks.c    |  1 -
>  drivers/remoteproc/wkup_m3_rproc.c    | 37 ++-------------------------
>  include/linux/platform_data/wkup_m3.h | 22 ----------------
>  3 files changed, 2 insertions(+), 58 deletions(-)
>  delete mode 100644 include/linux/platform_data/wkup_m3.h
> 
> diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
> --- a/arch/arm/mach-omap2/pdata-quirks.c
> +++ b/arch/arm/mach-omap2/pdata-quirks.c
> @@ -21,7 +21,6 @@
>  #include <linux/platform_data/hsmmc-omap.h>
>  #include <linux/platform_data/iommu-omap.h>
>  #include <linux/platform_data/ti-sysc.h>
> -#include <linux/platform_data/wkup_m3.h>
>  #include <linux/platform_data/asoc-ti-mcbsp.h>
>  #include <linux/platform_data/ti-prm.h>
>  
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -19,8 +19,6 @@
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
>  
> -#include <linux/platform_data/wkup_m3.h>
> -
>  #include "remoteproc_internal.h"
>  
>  #define WKUPM3_MEM_MAX	2
> @@ -56,37 +54,15 @@ struct wkup_m3_rproc {
>  static int wkup_m3_rproc_start(struct rproc *rproc)
>  {
>  	struct wkup_m3_rproc *wkupm3 = rproc->priv;
> -	struct platform_device *pdev = wkupm3->pdev;
> -	struct device *dev = &pdev->dev;
> -	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
> -	int error = 0;
> -
> -	error = reset_control_deassert(wkupm3->rsts);
>  
> -	if (!wkupm3->rsts && pdata->deassert_reset(pdev, pdata->reset_name)) {
> -		dev_err(dev, "Unable to reset wkup_m3!\n");
> -		error = -ENODEV;
> -	}
> -
> -	return error;
> +	return reset_control_deassert(wkupm3->rsts);
>  }
>  
>  static int wkup_m3_rproc_stop(struct rproc *rproc)
>  {
>  	struct wkup_m3_rproc *wkupm3 = rproc->priv;
> -	struct platform_device *pdev = wkupm3->pdev;
> -	struct device *dev = &pdev->dev;
> -	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
> -	int error = 0;
>  
> -	error = reset_control_assert(wkupm3->rsts);
> -
> -	if (!wkupm3->rsts && pdata->assert_reset(pdev, pdata->reset_name)) {
> -		dev_err(dev, "Unable to assert reset of wkup_m3!\n");
> -		error = -ENODEV;
> -	}
> -
> -	return error;
> +	return reset_control_assert(wkupm3->rsts);
>  }
>  
>  static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> @@ -128,7 +104,6 @@ MODULE_DEVICE_TABLE(of, wkup_m3_rproc_of_match);
>  static int wkup_m3_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct wkup_m3_platform_data *pdata = dev->platform_data;
>  	/* umem always needs to be processed first */
>  	const char *mem_names[WKUPM3_MEM_MAX] = { "umem", "dmem" };
>  	struct wkup_m3_rproc *wkupm3;
> @@ -171,14 +146,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
>  	wkupm3->rsts = devm_reset_control_get_optional_shared(dev, "rstctrl");

We should no longer be using the optional variant now that this is what is
expected. Otherwise, rest of the changes look good. Any reason to use the shared
variant, I need to take a closer look at how the resets are represented.

Do I need anything else or I should be able to test this patch on latest 5.11-rc
or master?

regards
Suman

>  	if (IS_ERR(wkupm3->rsts))
>  		return PTR_ERR(wkupm3->rsts);
> -	if (!wkupm3->rsts) {
> -		if (!(pdata && pdata->deassert_reset && pdata->assert_reset &&
> -		      pdata->reset_name)) {
> -			dev_err(dev, "Platform data missing!\n");
> -			ret = -ENODEV;
> -			goto err_put_rproc;
> -		}
> -	}
>  
>  	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
>  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> diff --git a/include/linux/platform_data/wkup_m3.h b/include/linux/platform_data/wkup_m3.h
> deleted file mode 100644
> --- a/include/linux/platform_data/wkup_m3.h
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * TI Wakeup M3 remote processor platform data
> - *
> - * Copyright (C) 2014-2015 Texas Instruments, Inc.
> - *
> - * Dave Gerlach <d-gerlach@ti.com>
> - */
> -
> -#ifndef _LINUX_PLATFORM_DATA_WKUP_M3_H
> -#define _LINUX_PLATFORM_DATA_WKUP_M3_H
> -
> -struct platform_device;
> -
> -struct wkup_m3_platform_data {
> -	const char *reset_name;
> -
> -	int (*assert_reset)(struct platform_device *pdev, const char *name);
> -	int (*deassert_reset)(struct platform_device *pdev, const char *name);
> -};
> -
> -#endif /* _LINUX_PLATFORM_DATA_WKUP_M3_H */
> 

