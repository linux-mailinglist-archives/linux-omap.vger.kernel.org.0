Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB97B38AEF4
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 14:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243080AbhETMst (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 08:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242984AbhETMrV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 May 2021 08:47:21 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8A0C0610EA
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:28 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so5291810wmk.1
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IzzcFdbD299bYbwkVjVetsnIw1bNC8GFwst6cjVWrUI=;
        b=GMXi6xLdlhRxj0ZIB1xJP0ro7foTWy5f6rDTrF79SNKxRw/Ulol5tDv96DQh4RJ9fq
         iArkR5oVuBatDWEuJ8fkPz4DbaxcRoyNC6Uj5gUTtjGYxdHIAYs3NSJzVo4h2bltPeB5
         F1CHD/3AEmSVoiokmjfCa6WqlP9WmcKGFuvUsTod5wBv7EiiA+LmfrkSpOevzKZFeZp5
         P+22u0KIz9mXnSQzn/tWbF9q8QGRo0y13m6kx8hHmKkcXnlEhtkBafAfTSq8oxBb3d0V
         ga1xKH197qzhQqg0Aie4OLoNBj8gt/wnTzk9q+tHw3UFMXB4WHwABMDXJHoAIXrV0Q93
         7E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IzzcFdbD299bYbwkVjVetsnIw1bNC8GFwst6cjVWrUI=;
        b=unsg2RHODzaAbLPRRP5CSVENo8nsoAr+j6aF6mDpPAhBIRDVnVhYo4Ls/DDu/NzNu8
         B5RoSxz07HnqspGJBHPgXuS1xatEMMhmNoZPwh/My0cVyVl/5k7jqSsBGCb+RuevoqF9
         CLnIVyWlax3tPaDngfZaksuVMvxHEuqvsuFMj9XYlhJB2ooWY75tNEve50/71GTleF6H
         1NdIU4e8FpXi8m53Zd19UwwOR9BQxV9SfpTv45NqEp2RStrB6YH84R9P7bg6RM28FR11
         me2Tn+BTYZjTIaF+dsbeFIgFj0I7PFSlQMYkRkBVGlyvbMGVbizZGL6iTyx8LslPSiTm
         Gxrw==
X-Gm-Message-State: AOAM532d2PJ9fV1o8BBRVAS3mazFBIMKFSy60fhKTfTolLxywX/cw66e
        s4VhHVEE0VM3AH0LFWt1cqQsiA==
X-Google-Smtp-Source: ABdhPJxuF4aX0+PhDCmXQm7mNZdGIXuxQ38HMj2nIMfGim4EPcpJ4+uPYl1dIPCzCDraZwGAgZWrOw==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr3797852wmj.22.1621512506912;
        Thu, 20 May 2021 05:08:26 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id r7sm2237170wmq.18.2021.05.20.05.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:08:26 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Roger Quadros <rogerq@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 4/7] mfd: omap-usb-host: File headers are not good candidates for kernel-doc
Date:   Thu, 20 May 2021 13:08:17 +0100
Message-Id: <20210520120820.3465562-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120820.3465562-1-lee.jones@linaro.org>
References: <20210520120820.3465562-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/mfd/omap-usb-host.c:26: warning: expecting prototype for omap(). Prototype was for USBHS_DRIVER_NAME() instead

Cc: Tony Lindgren <tony@atomide.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Keshava Munegowda <keshava_mgowda@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/omap-usb-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index 2a3a240b4619a..787d2ae863752 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * omap-usb-host.c - The USBHS core driver for OMAP EHCI & OHCI
  *
  * Copyright (C) 2011-2013 Texas Instruments Incorporated - https://www.ti.com
-- 
2.31.1

