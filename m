Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A27209A0C
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 08:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389501AbgFYGrK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 02:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390159AbgFYGqe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jun 2020 02:46:34 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8B0C061799
        for <linux-omap@vger.kernel.org>; Wed, 24 Jun 2020 23:46:34 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b6so4579158wrs.11
        for <linux-omap@vger.kernel.org>; Wed, 24 Jun 2020 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TE9kOk1Eo+Xge5t3lOhgSjVuYsSynXXEjCl45jZ/BE=;
        b=pGhwHR37tt09Kl/bFu1zOX6lNU6Dnj8LyCDuRPVubE+Z3M1gSrffbY1VbW9qfSaXiE
         CNdyWz9lJ0fYj2v5+22h8s0YXCpzND9580Dayad1kycUDReg+D/IhrDU/NO5omUJyCSS
         xU0riBAU+Vh4SJ/wHhIK/ZIpZTtQ5Onz2zI56sZxmVNSSRIV4b4DZ8c9HqWT7dlLN5sz
         Y7Aq86j9bH3VV4sB9SdCoQ8+MSmCO8TU6TZDLq8+hT02COCOq7IXFrO0ZftW8FWes2gN
         zulTt3y1vQ7kc9cNSnHlyPIHjPzBedtVnrUfpSSW0Y0qv6ls8pctACHJYSlHtWv6s8iz
         bjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TE9kOk1Eo+Xge5t3lOhgSjVuYsSynXXEjCl45jZ/BE=;
        b=KCesVQ/Ug5iVpimlpgoxaq38sAI18tjP7YZ7GsP8Zeda6S+nZ+m9ELr0rllgN/JWxG
         /4+qbOnjWG4X10ALgaJZR0qEuEKL2MRSTjFPvOCyT/h2V8ECVQ6u6RxbvyBcOGhwrAQe
         iKYZahbYVQZsp9PEhb/t/xRnjKM1Jzd7BCdu76HugG2D1SSenazCHmOzXxvLCOdYLUO5
         uEyYqs2puSEB0fvMwMYgPGR5ixWL1Q0nhZt3gcFhvmUlMBJpOFX0viCADKCF6hFkQOMk
         Mep/orP8aE1JG4WJj2FwpoXLmFABougdzaZkn9YltbHMofOGjmJv4neEUsXXuiSpLFjc
         T0OQ==
X-Gm-Message-State: AOAM531TurvunDP3kzkl+YbVUaNF7uHuD3DEGOzkj833UlpdrXYEAiDQ
        hu0xvFKg/ndnHM83RqjBF2TFPA==
X-Google-Smtp-Source: ABdhPJytxUMgGBVPUzM3IOR72zdB3gVcybqT84W3fTE4JkO2L+7Fo++7itDizMNwfNXl2gA3TPz5/A==
X-Received: by 2002:adf:e749:: with SMTP id c9mr37817613wrn.25.1593067592886;
        Wed, 24 Jun 2020 23:46:32 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id c20sm27235363wrb.65.2020.06.24.23.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:46:32 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Roger Quadros <rogerq@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 06/10] mfd: omap-usb-host: Provide description for 'pdev' argument to .probe()
Date:   Thu, 25 Jun 2020 07:46:15 +0100
Message-Id: <20200625064619.2775707-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200625064619.2775707-1-lee.jones@linaro.org>
References: <20200625064619.2775707-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Kerneldoc syntax is used, but not complete.  Arg descriptions required.

Prevents warnings like:

 drivers/mfd/omap-usb-host.c:531: warning: Function parameter or member 'pdev' not described in 'usbhs_omap_probe'

Cc: <stable@vger.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Keshava Munegowda <keshava_mgowda@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/omap-usb-host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index f56cdf3149dc0..aca5a160c1b24 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -526,6 +526,8 @@ static const struct of_device_id usbhs_child_match_table[] = {
  * usbhs_omap_probe - initialize TI-based HCDs
  *
  * Allocates basic resources for this USB host controller.
+ *
+ * @pdev: Pointer to this device's platform device structure
  */
 static int usbhs_omap_probe(struct platform_device *pdev)
 {
-- 
2.25.1

