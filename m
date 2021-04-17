Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283A5363237
	for <lists+linux-omap@lfdr.de>; Sat, 17 Apr 2021 22:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236772AbhDQU1e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Apr 2021 16:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236718AbhDQU1d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Apr 2021 16:27:33 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B0FC061574
        for <linux-omap@vger.kernel.org>; Sat, 17 Apr 2021 13:27:06 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id q123-20020a1c43810000b029012c7d852459so6620367wma.0
        for <linux-omap@vger.kernel.org>; Sat, 17 Apr 2021 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AdYOtsymQBe0dfr3b8Id4us8oWt9C5nKhfs9IDFjSEo=;
        b=rMrfs14pmY8OEWkvXP8jeOW6TJx6dxXO3sHP4a2arhfalxgestvDV7QMd+t1szSoM/
         G0J9Fe+xrwFZzbzaXZ04KX3TRaKXAx7xiM3VMYFU/DmHNKtc+Kvshk1pGMLKEARsEG9v
         iAYepUqE3IxUxQkbdRiiPdplmBKI3w248pfD1+YZSMVc1+kOHfsv11GghXxpS2Spgbul
         SSVOhZFT9HMMvxvlg5DrZnSM3fOtRCC3/Olh+c0PuUSjxq+iXF597FqHtk9lDFPsd/Ti
         zmHLt9Iv54UKFObupO3Sih8gVCrurY3snFbhvZfSM6Eg0K0AkryucGiJzfYekRTMvR+l
         jq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AdYOtsymQBe0dfr3b8Id4us8oWt9C5nKhfs9IDFjSEo=;
        b=LjvVIjEtLix2jMEvTwPbikVP0yI+WK2JaeeOu7DcOrahNkJJHlIVRKPJeHNJZF4x/o
         43mnN5tNGn5+TRTwH4Wy/vXrukDczB+EcgVzujuxgihGyurpJ0DsTn8woiO6lCw+gK6S
         MTUOLhvMcFWjoPOPrQUI5wZzzlC0Ie2AUl0J2Koef9EfCXz2w1CM3k65maQPHg3hXeff
         WnAuKaDs6HqmtgbcnfyrfCj3bT4qDry2vCd22eoGyaqJU2kWe7+zLJqHd2pM4uBVO7gM
         U1xfoufIE7gQ402JGvGZI3f34UdWeOrZs2wcnfekH50voctCYDbifSK09BJMsKlwjYn8
         mJ/Q==
X-Gm-Message-State: AOAM533VFuUpzqDu8J4WXlNdNjMKMMIEsnmVMjNDbMSSy85zhJFSmtSq
        lFFb5UnLZHwSMYRbDAQfQfXfSXbbDk4=
X-Google-Smtp-Source: ABdhPJwr+HQ5/ODHzLK6jPDy+4OyHbeq9eTL9vEa6J2QpDxgGo2IaJ9R6dZs6kWjMsiybrjuU0N9oA==
X-Received: by 2002:a1c:bb46:: with SMTP id l67mr13805151wmf.103.1618691225589;
        Sat, 17 Apr 2021 13:27:05 -0700 (PDT)
Received: from tp440p.steeds.sam ([41.84.246.164])
        by smtp.gmail.com with ESMTPSA id a72sm13623905wme.29.2021.04.17.13.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 13:27:04 -0700 (PDT)
Date:   Sat, 17 Apr 2021 22:27:00 +0200
From:   "Sicelo A. Mhlongo" <absicsz@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/2] ARM: omap2plus_defconfig: Add WL1251 and WEXT modules
Message-ID: <YHtElA8dbBqMKCMg@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Nokia N900 uses a TI WL1251 chip for WiFi. Enable support for it
as a loadable module.

In order to be usable and connect to networks, it needs wireless
extensions, so enable WEXT support in the kernel.

Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
---
 arch/arm/configs/omap2plus_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index f250bf1cc022..a0249e06104a 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -127,6 +127,7 @@ CONFIG_BT_MRVL_SDIO=m
 CONFIG_AF_RXRPC=m
 CONFIG_RXKAD=y
 CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
@@ -225,6 +226,8 @@ CONFIG_LIBERTAS_DEBUG=y
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_USB=m
+CONFIG_WL1251=m
+CONFIG_WL1251_SPI=m
 CONFIG_WL12XX=m
 CONFIG_WL18XX=m
 CONFIG_WLCORE_SPI=m
-- 
2.31.0

