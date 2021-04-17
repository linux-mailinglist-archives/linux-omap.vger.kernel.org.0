Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD08363239
	for <lists+linux-omap@lfdr.de>; Sat, 17 Apr 2021 22:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbhDQU2t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Apr 2021 16:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236718AbhDQU2t (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Apr 2021 16:28:49 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31AD3C061574
        for <linux-omap@vger.kernel.org>; Sat, 17 Apr 2021 13:28:22 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n4-20020a05600c4f84b029013151278decso4773800wmq.4
        for <linux-omap@vger.kernel.org>; Sat, 17 Apr 2021 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=PDoeLW1JlEi5g/BMOfPJ+0TbY3SFPny86cv5WjDX+HA=;
        b=H10IAqQHDjdKtfOhZaNmXPr+We2Cnt8V4dEffiI0N+MchKuU05pzoM7lkaRRQKf3oG
         em34WBatSK7Sw2coYljQP/jVNKC1x8lxtJN6a6lBXM/y1ju9htHILhWpofkW7SSMP6Gl
         6ScmAi5o5aRpllGJhhJ2okND8Na1Qz1Cyz/EbxjlOVvSufCsj9K0PxJ/LEZ3y47406py
         DDBCvbyd/oZ+H2+EoI6aAaw2NMrhtrdl7YZ1l4gObpSy2dpjQxtmSojapFffAoXeivs8
         knVidSvmZjqh2NftZI6BRclmCRKiayPBO9cwetHM1ZYpylEmGUMxASHaVFtGVUh8sTa8
         vjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=PDoeLW1JlEi5g/BMOfPJ+0TbY3SFPny86cv5WjDX+HA=;
        b=C17Q0s+2hbJmlD1XKm2qoHm7a3uiXPdAv9elZXqhVeprM4vOF5uQcMlI/B3CcLG8ry
         u8/YyduIs6DvA4J52geZS7tvfl0o8cfbdHobsRJ4HNrxYMArnBum9pRa80ZjIMneo/jw
         Bc//2KPgd3pRvqc6fEZpMBhXr0UfY6ZxKZts0wexRzCSVyLRg+NhhSt0SrV2ff1Zhf95
         ZAIW1zxfncVDwaiyNF2pUt7HPUQ6p2s1nv2/a0bw19otFxrpab4YjAZrq9v8B4zHKS1K
         XQBouFawvw6pfmEQ8DJ1cJJTEMlYIKic6IYFWpwWqMX+uaV5JWJYPydNwU0HxgUNa+u1
         Q8Xg==
X-Gm-Message-State: AOAM533Gj2MDGBoFxXJma4VXHT8SVV2HyEPJNy+hzUq4SAPMaDxt1tuN
        tRe7/mQMubqWZFViwazB83MrMnLexXo=
X-Google-Smtp-Source: ABdhPJwXxpnQjTDuM4yrmi3blOmKe8D9+lCc1ByvqKJT2hnUfggkKfi5uDCYQbtqQ+5p2PByvrDeEA==
X-Received: by 2002:a1c:6a01:: with SMTP id f1mr13957425wmc.144.1618691301047;
        Sat, 17 Apr 2021 13:28:21 -0700 (PDT)
Received: from tp440p.steeds.sam ([41.84.246.164])
        by smtp.gmail.com with ESMTPSA id q126sm3723124wma.6.2021.04.17.13.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 13:28:20 -0700 (PDT)
Date:   Sat, 17 Apr 2021 22:28:16 +0200
From:   "Sicelo A. Mhlongo" <absicsz@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/2] ARM: omap2plus_defconfig: Add LP5523 LED driver
Message-ID: <YHtE4KSuack3R31o@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Nokia N900 has an LP5523 driving the RGB LED and the 6 keyboard LEDS.
Enable support for it in omap2plus_defconfig.

Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index a0249e06104a..c0bc0f30637e 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -471,6 +471,8 @@ CONFIG_LEDS_CLASS=m
 CONFIG_LEDS_CPCAP=m
 CONFIG_LEDS_LM3532=m
 CONFIG_LEDS_GPIO=m
+CONFIG_LEDS_LP55XX_COMMON=m
+CONFIG_LEDS_LP5523=m
 CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=m
 CONFIG_LEDS_TRIGGERS=y
-- 
2.31.0

