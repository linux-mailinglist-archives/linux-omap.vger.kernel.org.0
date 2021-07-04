Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DB03BAD92
	for <lists+linux-omap@lfdr.de>; Sun,  4 Jul 2021 17:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhGDPFR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Jul 2021 11:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhGDPFR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Jul 2021 11:05:17 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F3CC061574
        for <linux-omap@vger.kernel.org>; Sun,  4 Jul 2021 08:02:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq39so15068421lfb.12
        for <linux-omap@vger.kernel.org>; Sun, 04 Jul 2021 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
        b=jljnPUsIyYOmIs1bcRM6CvDvrOai3kZAakwwBlqQGntYOUgSgs47WylFH1qIKsYKC+
         iU9LykHae1u+S7IqAysYp+1ZlZaYg6M90MSh5/Tfa3gno5yh5Y5pIM8cg736BKUnW6qg
         M7Gjmkcufn7kSA6Xc2+R6UdnScZR8L7Ks2hASqfoZtYOP5LnwOEzHTyqMJ71VSjMGOBL
         LlTkxPu6vx1yMjxrU6DFX24mcAhD0VFRtluDUVKoQL8As0bAFL+sliNnFfj+oStLwvmX
         I1TNoqtIY9hvHjCvidimX8g3KcrpvCTQbAHlytH4yigB+9gceTykGoDA2sls4CiximuB
         gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
        b=kOtsWtv3i5wkvvVEoUvDnQquIpP3BFghFnrAuXKQEujLKybLLII9QKClrAYbI9iFun
         wYDajdNJ2O7R+Qi44m0QktegZ3SVgptzPJckqqFmeiwahypxGUHmTuHkmXkqrWritEhO
         K3LJSP+UbsjlsKtZG+nwjWNzERHPXgUObZm1NSaqaU12xP4JHq1eqwAjfa8LnAXVXNz1
         jRI/Su/XwRPwgKGinahAco83TjVN6OwpYjwTqb6I53UeYn2e1QkKZdf1FQKD/ox/yJNW
         Gq9aw98bFa7iQmu42+LZyn/d1sREibw/WkQUGqUNkL8abvD71eZaGs7x6wqcsd8YScDA
         C2JQ==
X-Gm-Message-State: AOAM5330EKSW/n+JEGJ71IocICci7eJ7I5GreeiFGjn/CCPGqj3x3fxt
        1PCKRsxhQ4VMkYs/xo21EDU=
X-Google-Smtp-Source: ABdhPJy/JwI2YxTZ5dPeQTWsPh0lR7ycVqDTEoEwS3GApRiGqTq3JCPt4v2abR45jWzVMBV38Jyf0w==
X-Received: by 2002:ac2:5d23:: with SMTP id i3mr7091606lfb.523.1625410960022;
        Sun, 04 Jul 2021 08:02:40 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:02:39 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH 4/5] ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
Date:   Sun,  4 Jul 2021 18:04:49 +0300
Message-Id: <20210704150450.20106-5-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

McASP only supports  Force-idle, No-idle and Smart-idle modes

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index a9573d441dea..8287fdaa526e 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -192,8 +192,7 @@ target-module@28000 {			/* 0x40128000, ap 8 08.0 */
 			reg-names = "rev", "sysc";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
+					<SYSC_IDLE_SMART>;
 			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
 			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
 			clock-names = "fck";
-- 
2.32.0

