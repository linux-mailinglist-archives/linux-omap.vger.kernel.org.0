Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02DF14ACE1
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jan 2020 00:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgA0X7k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jan 2020 18:59:40 -0500
Received: from vern.gendns.com ([98.142.107.122]:49676 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgA0X7k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Jan 2020 18:59:40 -0500
X-Greylist: delayed 1120 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Jan 2020 18:59:39 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3Cnuq19Xwl7haKLZpaPTEJKb0hDaQOWCuXCekp4VNfM=; b=l0sAfEczAKEPYs1aRPoEgcniDM
        PQj672CVbH2XvtXnD7+M+J5osaZIajyo2dUruscPmy03mpZ76qkoe5KDWeO0tdsD57Dw1LOjjTAsC
        Gu1CuHebCZX2+Kg7c1wuKXumS6AXAVhwku/jLr9AkK9f/Trb5sDWTVtGLhR/X/rdcdHRhtw8TD6WV
        cf8qn/J+/E8eHVifCAOfzUDBqsAkwTcDVy5Gm0zGOpoLa23CRVo8Cr7mbc1LNWx7D8S29Dw07Q2qs
        5yVyB0wMZzGkAOfw2XeYNEJThvSjGnJo9LljKCOGzq7fyYtcT4vYko+wWKSvhX/sKva1zMV+yOx/U
        S1H4nBYw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:56512 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1iwE01-0003wj-IZ; Mon, 27 Jan 2020 18:40:57 -0500
Subject: Re: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
To:     Suman Anna <s-anna@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20200127231208.1443-1-s-anna@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <217993e5-5e1d-79a1-7684-c6bb964379f0@lechnology.com>
Date:   Mon, 27 Jan 2020 17:40:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127231208.1443-1-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 1/27/20 5:12 PM, Suman Anna wrote:
> The DT node full name is currently being used in regmap_config
> which in turn is used to create the regmap debugfs directories.
> This name however is not guaranteed to be unique and the regmap
> debugfs registration can fail in the cases where the syscon nodes
> have the same unit-address but are present in different DT node
> hierarchies. Replace this logic using the syscon reg resource
> address instead (inspired from logic used while creating platform
> devices) to ensure a unique name is given for each syscon.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: Fix build warning reported by kbuild test bot
> v1: https://patchwork.kernel.org/patch/11346363/
> 
>   drivers/mfd/syscon.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index e22197c832e8..f0815d8e6e95 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_clk)
>   		}
>   	}
>   
> -	syscon_config.name = of_node_full_name(np);
> +	syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
> +				       (u64)res.start);

Would it make sense to also include the node name along with the
pointer address so that the name is still easily identifiable?

>   	syscon_config.reg_stride = reg_io_width;
>   	syscon_config.val_bits = reg_io_width * 8;
>   	syscon_config.max_register = resource_size(&res) - reg_io_width;
>   
>   	regmap = regmap_init_mmio(NULL, base, &syscon_config);
> +	kfree(syscon_config.name);
>   	if (IS_ERR(regmap)) {
>   		pr_err("regmap init failed\n");
>   		ret = PTR_ERR(regmap);
> 

