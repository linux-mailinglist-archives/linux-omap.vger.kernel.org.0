Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21B7B127396
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 03:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfLTCoK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 21:44:10 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57984 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfLTCoK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 21:44:10 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBK2i9re108129;
        Thu, 19 Dec 2019 20:44:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576809849;
        bh=XrL+lkvSptcyfruvE92Sj2A7lcMkgZ64kMa54ko5wHA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KA97jGRSbnRSgg2q0+jKAouP5BsYQOg1/Zf7VWpltQbKar4taQJ8A7fBIdz0aoI9d
         ATwdylyxCMXblSiqTXzCGma/TvlVr//L5CIgfJKsxQSMAEtxFH/cHdQz/gsuBShY3C
         ZllH9JhcEUHS9uAoWVdaJDR2Ba4SrKbKs5nCILW8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBK2i9TB022794
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Dec 2019 20:44:09 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 20:44:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 20:44:08 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK2i7j1106631;
        Thu, 19 Dec 2019 20:44:07 -0600
Subject: Re: [PATCHv3 08/15] remoteproc/omap: Remove the unused fields from
 platform data
To:     Tero Kristo <t-kristo@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-9-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <abc17f7b-7664-9064-2e48-4b429847b105@ti.com>
Date:   Thu, 19 Dec 2019 20:44:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191213125537.11509-9-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 12/13/19 6:55 AM, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The following fields: .name, .oh_name, .oh_name_opt, .mbox_name,
> .firmware, .ops and .set_bootaddr, are removed from the platform data,
> as these are no longer needed after the addition of DT support to the
> OMAP remoteproc driver.
> 
> The .name field was used to give a name to the remoteproc, and this
> is replaced with the device name. The .ops field was never used by
> the OMAP remoteproc driver. The .mbox_name was used to define the
> sub-mailbox node used for communication with the remote processor,
> and is retrieved using the 'mboxes' property in the DT node. The
> .firmware field is encoded directly in the OMAP remoteproc driver and
> is retrieved using driver match data. The .set_bootaddr ops was used
> for using a OMAP Control Module API to configure the boot address for
> the processor, and is now implemented within the driver using a
> syscon property.
> 
> The .oh_name field is used to define the primary hwmod for the processor
> node, and is represented using the 'ti,hwmods' property in the DT node.
> The .oh_name_opt field was primarily defined to identify the hwmod for
> the second cpu in a dual Cortex-M3/M4 IPU processor sub-system. This
> hwmod entry is no longer defined usually, but rather a single hwmod
> representing both the processors in the IPU sub-system is defined.
> A single firmware image (either in SMP-mode or a combined image for
> non-SMP mode) is used, with both the resets released together always
> as part of the device management. Any power management and recovery
> aspects require that both the processors be managed as one entity due
> to the presence of shared MMU and unicache within the IPU sub-system.
> 
> The OMAP remoteproc platform data structure is eventually expected
> to be removed completely once the other dependencies with the
> mach-omap layer are met.

This patch was a cleanup patch with DT using hwmod, and some of the
description is pertinent to that. Now that you have converted to ti,sysc
& reset with no dependencies against hwmod, the time for removing the
structure is here. Some of the patch description is no longer correct as
well since there is no 'ti,hwmods' :)

> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  include/linux/platform_data/remoteproc-omap.h | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
> index 7e3a16097672..6bea01e199fe 100644
> --- a/include/linux/platform_data/remoteproc-omap.h
> +++ b/include/linux/platform_data/remoteproc-omap.h
> @@ -2,38 +2,23 @@
>  /*
>   * Remote Processor - omap-specific bits
>   *
> - * Copyright (C) 2011 Texas Instruments, Inc.
> + * Copyright (C) 2011-2018 Texas Instruments Incorporated - http://www.ti.com/

%s/2018/2019 when you do update the patch.

regards
Suman

>   * Copyright (C) 2011 Google, Inc.
>   */
>  
>  #ifndef _PLAT_REMOTEPROC_H
>  #define _PLAT_REMOTEPROC_H
>  
> -struct rproc_ops;
>  struct platform_device;
>  
>  /*
>   * struct omap_rproc_pdata - omap remoteproc's platform data
> - * @name: the remoteproc's name
> - * @oh_name: omap hwmod device
> - * @oh_name_opt: optional, secondary omap hwmod device
> - * @firmware: name of firmware file to load
> - * @mbox_name: name of omap mailbox device to use with this rproc
> - * @ops: start/stop rproc handlers
>   * @device_enable: omap-specific handler for enabling a device
>   * @device_shutdown: omap-specific handler for shutting down a device
> - * @set_bootaddr: omap-specific handler for setting the rproc boot address
>   */
>  struct omap_rproc_pdata {
> -	const char *name;
> -	const char *oh_name;
> -	const char *oh_name_opt;
> -	const char *firmware;
> -	const char *mbox_name;
> -	const struct rproc_ops *ops;
>  	int (*device_enable)(struct platform_device *pdev);
>  	int (*device_shutdown)(struct platform_device *pdev);
> -	void (*set_bootaddr)(u32);
>  };
>  
>  #if defined(CONFIG_OMAP_REMOTEPROC) || defined(CONFIG_OMAP_REMOTEPROC_MODULE)
> 

