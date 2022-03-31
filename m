Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7464EE33E
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 23:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236298AbiCaVWd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 17:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233592AbiCaVWc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 17:22:32 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5758519FF6E
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 14:20:44 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id b130so747784pga.13
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=svILDDP1tn6CI+Hh0Pw/4JOxvuo1xmY6BRPzOQqbKnA=;
        b=2dfB71F+F3N1BfKx9Kxqczba2opQxpo/zINYmDd4Z6PXHpdG5z2OzDAKxa1LzSAN2o
         NZLwgyOtjG/8lurrH8qFyWYJV/Pg95fgv1vkBH2wPWnMFodh1pxrb7sCjZ6AMm0C2V7O
         z/1UUrjoDa0wF4nnzTPdb0nvS31OJRD1YTaLoQdKSVtJ4JIXkbY9xXcNpR1d6bHeYUPT
         7xvX+7bMr+eTg1335pFdVFu79Vct8E2pml6eurl7lCseWgAjgQT4KckXOOq2T42BOX2U
         gIADtfu8r/GOugPUZh0BI1NVBb2CplcsFq3nFEC1dAZBfPu07+6dfq8NJx6JOwT3NRTv
         4HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=svILDDP1tn6CI+Hh0Pw/4JOxvuo1xmY6BRPzOQqbKnA=;
        b=47fT+52sNAKevC0wCPKdXu7AFTgM27h+yuDFM/TAFor2DSMKoxgfd+3TxSL0DS2JLQ
         4VtNacXMIF7u1fkR5txeVsNv3OJkh7K/IgRsd91+g0nK/m3W7CzJ5XczlBGRkPIGcfQG
         s21wigYj14eXNB7BB5asdAKVqHF014G5lmk8eiHRYoGTKvl3g4HOchbkz7Bz5za2OU2h
         MHxlaAlxnGXw2BQms/9LDrsqUENzPrL9fGL3SxJ61tmqXYJ6AojXJNyf5oW0voEhhIlX
         hETmb8E0wky2qUggk2yHEJBbTNy/tnF0pQIpvHXMUD+7RnSCD1sXPfPeR/y3WnCMEhDl
         Q7hg==
X-Gm-Message-State: AOAM530qXZkRM+Ca2QBh0dQZ/uKhw5SlNayR0bhWw0FpTiYoogklUBTR
        MB85qQfkgcjUwvAP4/t7mDJsRhXd9DJWJQ==
X-Google-Smtp-Source: ABdhPJzbez47Mwv9eEJvyiKoQURSHppbrNG51hRYs1H49hqvBOEANdZiWlr9GFjGFb4JMXLR453jBA==
X-Received: by 2002:a63:fb01:0:b0:398:bb8b:5796 with SMTP id o1-20020a63fb01000000b00398bb8b5796mr5246092pgh.351.1648761643753;
        Thu, 31 Mar 2022 14:20:43 -0700 (PDT)
Received: from x1 ([2601:1c2:1001:7090:d825:f497:99ce:fdac])
        by smtp.gmail.com with ESMTPSA id d18-20020a056a0010d200b004fa2e13ce80sm405829pfu.76.2022.03.31.14.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 14:20:43 -0700 (PDT)
Date:   Thu, 31 Mar 2022 14:21:30 -0700
From:   Drew Fustini <dfustini@baylibre.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Suman Anna <s-anna@ti.com>, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/omap: Fix regression in probe for NULL pointer
 dereference
Message-ID: <YkYbWiKH1bSu2VkR@x1>
References: <20220331062301.24269-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331062301.24269-1-tony@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On TLhu, Mar 31, 2022 at 09:23:01AM +0300, Tony Lindgren wrote:
> Commit 3f6634d997db ("iommu: Use right way to retrieve iommu_ops") started
> triggering a NULL pointer dereference for some omap variants:
> 
> __iommu_probe_device from probe_iommu_group+0x2c/0x38
> probe_iommu_group from bus_for_each_dev+0x74/0xbc
> bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
> bus_iommu_probe from bus_set_iommu+0x80/0xc8
> bus_set_iommu from omap_iommu_init+0x88/0xcc
> omap_iommu_init from do_one_initcall+0x44/0x24
> 
> This is caused by omap iommu probe returning 0 instead of ERR_PTR(-ENODEV)
> as noted by Jason Gunthorpe <jgg@ziepe.ca>.
> 
> Looks like the regression already happened with an earlier commit
> 6785eb9105e3 ("iommu/omap: Convert to probe/release_device() call-backs")
> that changed the function return type and missed converting one place.
> 
> Cc: Drew Fustini <dfustini@baylibre.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Suman Anna <s-anna@ti.com>
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Fixes: 6785eb9105e3 ("iommu/omap: Convert to probe/release_device() call-backs")
> Fixes: 3f6634d997db ("iommu: Use right way to retrieve iommu_ops")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/iommu/omap-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1661,7 +1661,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
>  	num_iommus = of_property_count_elems_of_size(dev->of_node, "iommus",
>  						     sizeof(phandle));
>  	if (num_iommus < 0)
> -		return 0;
> +		return ERR_PTR(-ENODEV);
>  
>  	arch_data = kcalloc(num_iommus + 1, sizeof(*arch_data), GFP_KERNEL);
>  	if (!arch_data)
> -- 
> 2.35.1

Mainline with omap2plus_defconfig now boots ok on my BeagleBoard-X15
with the TI AM5728 SoC after this patch is applied.

Tested-by: Drew Fustini <dfustini@baylibre.com>

thanks,
drew
