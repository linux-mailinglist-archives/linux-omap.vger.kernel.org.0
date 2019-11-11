Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BDEF83A5
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 00:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfKKXhj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 18:37:39 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35044 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKKXhi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Nov 2019 18:37:38 -0500
Received: by mail-pl1-f195.google.com with SMTP id s10so8521291plp.2
        for <linux-omap@vger.kernel.org>; Mon, 11 Nov 2019 15:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dbubxE0xgSr5ksKDTw0XJflMoEKnD/vPTnArmSwuz/c=;
        b=XJiQM6izQ3EdqFpU//vf0g9TJrNjK30LoEEuLytoDpf77SVn8DVbJB4Y/TQ98XuZ5/
         +hUyHJiV/pvgVcZGWn2c9XIZZU5k68LxG9mwDk6gIWUV0/hryUUP3L9RYb5KU9lKmQTU
         UQOYCiHzlc5GI3hp2xaXxE5kxl2fwyWUte1KnTEJZyKTjZnn/j5h/JAoI0Gc4TClmrLu
         QjK+Dw/PFCQhXffjGRv9G+WOpgHO4a9HaCq6qC8fUzABPJayGC98ROMMYjGNsX7wZE3J
         vAWjUq5Up3oz5LZ4R6h2vxZLk5ewC1cr/NqsiseriRWe1/3RhWoNvkPbVAaT3RQxuYal
         +hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dbubxE0xgSr5ksKDTw0XJflMoEKnD/vPTnArmSwuz/c=;
        b=AOLVQbxknREymhRTVdJSd8Ghu/gyDGMJ9YL5ap6u1ZrFIcleltEkXmxV1y6IU0Qt5X
         k9432OXXyE/Hytxtmnjy4oEDyot2BBPTc694eAW5kCRqZYIUftMv/Ia98+nsYcs7a+5+
         mpBjcPL8balLTLNWDSZeU8J7NXGEyjFXKuaAMrgCj3EcSLyMm2jgCNQ4G2OzXVkr+eYt
         8h+CxxUf4i7igeLLwXckXxcNuOGJUSmOHRiBInUDo3DFJcgsVuNSpdeF7d05MLWKxrpP
         Bn239E0EDu4u7TnRtJVgwe29CshfaA4KjA/nu6Euf6d4KC7ozdNdARU4qe8EhvLIAHln
         fSVA==
X-Gm-Message-State: APjAAAVul/7Pgp0OBe9MvWwfpmoX2apBygDjeEHq4rLDmY6x6xCcU3ZL
        pywQy+ie8ddFRVN9TQX9qEi/Fw==
X-Google-Smtp-Source: APXvYqwfI6yk/1FEF/2vNfst6ZSXex8XDaA76VJ8X196QzpGAQV6zXVmCwB0tL3GCfovb3hs7VCIAw==
X-Received: by 2002:a17:902:d891:: with SMTP id b17mr16154772plz.256.1573515457439;
        Mon, 11 Nov 2019 15:37:37 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e17sm16216877pgg.5.2019.11.11.15.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 15:37:36 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:37:34 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 09/17] remoteproc/omap: Remove the unused fields from
 platform data
Message-ID: <20191111233734.GK3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-10-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-10-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

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
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
