Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C395762556D
	for <lists+linux-omap@lfdr.de>; Fri, 11 Nov 2022 09:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbiKKIgm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Nov 2022 03:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbiKKIgl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Nov 2022 03:36:41 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC52654D3;
        Fri, 11 Nov 2022 00:36:40 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id y16so5504598wrt.12;
        Fri, 11 Nov 2022 00:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LdKiDa3X5sRwQrkwBd9fsnonVBgPFP/Q0DkSX0juAw=;
        b=bfRj7QxjEbM/niJkaWqqiz0trKfDz4MiqicdQJwv9oRoVzm47d0EGJ6eXu3tHaQiHE
         Ugyp05pCuAD2GFL2AicQM4tQggjVqrtd6r7PLcEk9LnbEYS/tOWV2G7Wd0OFORhQVYmZ
         xJdmnSEnqlRfLV1oM+XGa2TXnhaG7GV6AvDQPBEfOaRM4iMPqonz4npkO4OW/c31H6wI
         EhZkO2HnbPHCzog7XSelGYmpU6litGhPVm7emL1lpyiDl1t4EE09MqAHO/Qsd3JO/4uI
         kCFOXDuOVO3hpZu8G8Wl/izyHLYno8ymnqgnJDxpLL8SlgNPimorIW11tLEp03pPzHFI
         BOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LdKiDa3X5sRwQrkwBd9fsnonVBgPFP/Q0DkSX0juAw=;
        b=kHfIBfmVdkpRybFB9xzu1QVqHPIEsESNNt88DVIlo5zNJknor6ZFiS4F4u3sSUAaWd
         F6whm5MupSzwFFFw751qQl5fkd1uyV/tyJ90Y25ePqGEuAVNEcHYPgSIbOdVc5LixJIT
         sCFCptz9ATvFvT+GB/ZRpwxHIUZ7mOGjPY94P73062QoTpaRRJGv7iit925xpTyrJiO6
         lmJfRgsxlmjct3ttFUm9CzBwL7gCCCiMgRNUGnYqhSIVoNbSIF4vLIbocYEgDhvFAMx9
         CoH+5trO9rRhaSl45mKcnS8f0HM84XmWjw/UfqxFQWL+WmBRZYNaCTur/GPmZ5cx+SDy
         6LYg==
X-Gm-Message-State: ANoB5pmLyhZ9FxeTUgGzR/QoYSamwgzx2JlH3hbMSD4EYH1F1XEfmuSP
        lsSJDe+FNVZOiRezQw6sBRc=
X-Google-Smtp-Source: AA0mqf5zJnBWSewYJi5CZXCHSfIqp/EIZEL1KUO2jeV1UtAmzpZYjV0gKz5oXlS+9igqzhly82U9UQ==
X-Received: by 2002:a5d:538d:0:b0:236:6b8e:3a3f with SMTP id d13-20020a5d538d000000b002366b8e3a3fmr577678wrv.159.1668155798966;
        Fri, 11 Nov 2022 00:36:38 -0800 (PST)
Received: from tp440p.steeds.sam ([69.63.64.50])
        by smtp.gmail.com with ESMTPSA id k7-20020a05600c1c8700b003c6b7f5567csm12067507wms.0.2022.11.11.00.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:36:38 -0800 (PST)
Date:   Fri, 11 Nov 2022 10:36:33 +0200
From:   Sicelo <absicsz@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        maemo-leste@lists.dyne.org, Felipe Balbi <balbi@kernel.org>,
        phone-devel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Rob Herring <robh@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [maemo-leste] USB PHY Initialization Fails on Nokia N900 Since
 5.19
Message-ID: <Y24JkS3tykIZRH+A@tp440p.steeds.sam>
References: <Y0PhEOl+MwlQ8HAD@tp440p.steeds.sam>
 <Y0UBindrJa1ptyR0@atomide.com>
 <Y0VI+/XJs8nsazwE@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0VI+/XJs8nsazwE@tp440p.steeds.sam>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 11, 2022 at 12:44:11PM +0200, Sicelo wrote:
> On Tue, Oct 11, 2022 at 08:39:22AM +0300, Tony Lindgren wrote:
> > To me it seems that we now somehow have a probe issue for musb depending
> > on how it gets probed depending on the following line:
> > 
> > device_set_of_node_from_dev(&musb->dev, &pdev->dev);
> > 
> 
> Thanks for the suggestion. However, 239071064732 does not fix it for me.
> With that in place, there is no trace created automatically, but dmesg
> shows:
> 
>   [    1.389648] musb-hdrc musb-hdrc.0.auto: error -ENXIO: IRQ mc not found
> 
> I wonder if there is something to update on the N900 dts perhaps, in
> connection with the recent musb changes?
> 

Good day

Just for further testing, I added the very ugly patch below. Applied on
vanilla 6.1-rc3 (i.e. containing 239071064732), USB works normally on
the N900.

I copied the irq numbers from omap3xxx.dtsi. Does this give us any hints
regarding the cause and resolution of this issue?

Regards
Sicelo




diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 03027c6fa3ab..440c917c0133 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2613,7 +2613,8 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 static int musb_probe(struct platform_device *pdev)
 {
        struct device   *dev = &pdev->dev;
-       int             irq = platform_get_irq_byname(pdev, "mc");
+       //int           irq = platform_get_irq_byname(pdev, "mc");
+       int irq = 92;
        void __iomem    *base;

        if (irq <= 0)
diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index 7acd1635850d..6c03a5301d01 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -416,7 +416,8 @@ musbhs_dma_controller_create(struct musb *musb, void __iomem *base)
        struct musb_dma_controller *controller;
        struct device *dev = musb->controller;
        struct platform_device *pdev = to_platform_device(dev);
-       int irq = platform_get_irq_byname(pdev, "dma");
+       //int irq = platform_get_irq_byname(pdev, "dma");
+       int irq= 93;

        if (irq <= 0) {
                dev_err(dev, "No DMA interrupt line!\n");



