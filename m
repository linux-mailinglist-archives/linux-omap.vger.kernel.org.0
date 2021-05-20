Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4680C38AF00
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 14:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241899AbhETMuq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 08:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242676AbhETMsM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 May 2021 08:48:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6913AC0610ED
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:29 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id z85-20020a1c7e580000b029017a76f3afbaso2543037wmc.2
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kCBLMzuQbvWIIxV/Uh23/ofTYghtWWx6fmZPEVfbqUs=;
        b=W0UxQbCMoh7ozIPaB4xgclOP4qIPBKZpsNs3mU8PnMBeh3mMqX0AyrvqCfKSIKGEk3
         L2VLd9YFFoqp7HzpuWqjcjtULSva7RdxdPZRDXv63rJNc63nBW2W763QQm0Cohw5WUHJ
         3e3SEu7LIZZ3uZmgsl35VGKaUXEgluBB225OpPBLrWDviTl0FJi8b8m8ronq5KEt30a/
         qcIXJrN79LPjheSZ4P36TJe8i3jbbscXu8sEuQHprMJEyGrq8J7qs7F+s5dHWRSNAdR/
         za2Tuy0jxSR5ONgA66W6lgkk8r4TxrPVYt5rczxEC4MzHWR0zw+EFyyTGWoj4vNV1n4g
         S//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kCBLMzuQbvWIIxV/Uh23/ofTYghtWWx6fmZPEVfbqUs=;
        b=oXP58RqDr+YHpFSfJYsoh/gtjY7r40UGUam6XpE2VR56IZ2B+cW4LZBMFLUgDFuk2Y
         l/t7t0S/NHYUPgkvvnTZhulME+szo0clzrAyr919kT1H8z/9Yrbow9F/MAwiDUGVYXjA
         Zz4n2xZ6cf63QEt+6eXiSbPe/6VRmmwFEprxgaEfH9HE+knGTzt2WGsG70kHK/tS6Bbp
         com52IA4/UxrDX7tuRxjakD+d796sEMczw8v0Y+NgKbsm7ZDCDp+90FeUVCSB129Z6Cj
         uWxxYOTT1RIk9UTzE5G06IhPZDJMvGwpqlOqgy0wklXaKDUcddCyiv+rCyVgCLuTSJFR
         tYWA==
X-Gm-Message-State: AOAM5314HU0vE07KlB1EzjPnb62nxhAVyi1oHEH8/9lzzltBu9hQoY0a
        +LoKNchx+7rK8XIvJHazfCYPRQ==
X-Google-Smtp-Source: ABdhPJyn1I5Qqpv+0461h5b7rEh8xQAwo76tkUILS0j71czO3qPqm1S5kDOlDeeo3c8xPyzkABIHug==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr3328725wml.188.1621512508044;
        Thu, 20 May 2021 05:08:28 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id r7sm2237170wmq.18.2021.05.20.05.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:08:27 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Roger Quadros <rogerq@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 5/7] mfd: omap-usb-tll: File headers are not good candidates for kernel-doc
Date:   Thu, 20 May 2021 13:08:18 +0100
Message-Id: <20210520120820.3465562-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120820.3465562-1-lee.jones@linaro.org>
References: <20210520120820.3465562-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/mfd/omap-usb-tll.c:24: warning: expecting prototype for omap(). Prototype was for USBTLL_DRIVER_NAME() instead

Cc: Tony Lindgren <tony@atomide.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Keshava Munegowda <keshava_mgowda@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/omap-usb-tll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 16fad79c73f1f..080d7970a3774 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * omap-usb-tll.c - The USB TLL driver for OMAP EHCI & OHCI
  *
  * Copyright (C) 2012-2013 Texas Instruments Incorporated - https://www.ti.com
-- 
2.31.1

