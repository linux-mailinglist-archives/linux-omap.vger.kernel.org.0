Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359C94EDC2C
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 16:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237878AbiCaO5f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 10:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbiCaO5e (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 10:57:34 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7E94FC6A
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 07:55:46 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id d65so16421971qke.5
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N7LizCHnjlNbTA7L5oo06xRIVouidWsWp/Muu8IQBaI=;
        b=bbuvSgDp27kFRs5kUzXlzygSwI7UT/O0wqkGn5Nc8LhaA2AECwG/JssJQabxdos/4d
         HaWXO9broK+ktqf3/iD4ocQd1QR805aj1GyXgmoXlryjP/ctlK9v99kDJrInxmNmzaOy
         RgiGwf6lZ69twj0tu2VynkLbE11gXaL07HNMRwrIBJLufXB95vgs7J7fjuOMt2zz7xe9
         vktnW0aPLuLc1X9bXkZSHjtzoifZgPG9N49S+ptKRAUq12u3CwtKK/YoJc/UlVP7kDZ+
         VQd1D95r4SCX8k7rqsNe2VAxmOCqsRZk/jr7YQ3wQ+Zo60KAn81MyYqbHvQ8nQtCXU0s
         pQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N7LizCHnjlNbTA7L5oo06xRIVouidWsWp/Muu8IQBaI=;
        b=TFMYpJ9V4vWaRRCc0TDyxdJc629qMMf1wpyfiP+KffEn4+WwFm1SICQi8Lh6PbXC4E
         ulBxBxTckE/vXLnpFJceSjF7/GVCBkiXBWuNlYBvnX2pqsITqmu5iZ03WBrZdnQSDouU
         j/WM2akSxYYrajF0YkQKgltSjyIKBFOoB45doCzUme9mQGCvsmyEzMs/y1Rj9inuEhYn
         jylDIjZzWJuKCShcUsp5iKsapHDNaAzbzJQRbft9dQPJXrba5/NrYr+QPtrOGeoKLj3V
         WlywAbW3S5EjWTwQ2/SbGN/GOvY/aulqRxMgtWW27vc18aafieKuKRLfZKEUA+HgPQVF
         +cEQ==
X-Gm-Message-State: AOAM5334NoX2ZLgl0Az1ghXKngmwGPt/sKogqoEzJUJbflg/AbUkqX5X
        N6/qehi70QebIQPJNpmQIH6WPw==
X-Google-Smtp-Source: ABdhPJy5034ceSRr34bKxO0lTD6+//Dl0Iw4VbZPHrTjnUkOt1ayzWxy1rlNeo/zszGJibqXu6Y5xA==
X-Received: by 2002:a05:620a:22cf:b0:67e:e43:239d with SMTP id o15-20020a05620a22cf00b0067e0e43239dmr3636919qki.299.1648738545555;
        Thu, 31 Mar 2022 07:55:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id h8-20020ac87d48000000b002e1c6faae9csm19564317qtb.28.2022.03.31.07.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 07:55:44 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1nZwD9-009v5U-0t; Thu, 31 Mar 2022 11:55:43 -0300
Date:   Thu, 31 Mar 2022 11:55:43 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Drew Fustini <dfustini@baylibre.com>,
        Suman Anna <s-anna@ti.com>, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/omap: Fix regression in probe for NULL pointer
 dereference
Message-ID: <20220331145543.GN64706@ziepe.ca>
References: <20220331062301.24269-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331062301.24269-1-tony@atomide.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Mar 31, 2022 at 09:23:01AM +0300, Tony Lindgren wrote:
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
