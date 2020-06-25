Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81474209A09
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 08:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390151AbgFYGrE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 02:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390163AbgFYGqf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jun 2020 02:46:35 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F72C061796
        for <linux-omap@vger.kernel.org>; Wed, 24 Jun 2020 23:46:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q5so4599635wru.6
        for <linux-omap@vger.kernel.org>; Wed, 24 Jun 2020 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPkLe9A2c/a37hUly+zrhj0g8oPWNS5BWdFQdlxMTw8=;
        b=L97XwVALwtGB8lb0Ydl/Uxoxe8raykVlOYBYqzU4heUsw5RqxnPa3z8xLxPGWvfAbA
         plswBX//r6jz0dXg4KLn3wKD4CaHKrhY7iF7sZeT+RbpUrmY42yepOoZx+MVPjI225VO
         nNLGFSiojX+A97815KN5agb2E/kLbUdBcCIdOvBxdrbFrtff1TdCLeB8peWn7SoyItYh
         +VcxpYleMeIQH9oOuZf7wTN5wh42l2Ev54zBug8m3GmfyWSt07q2LFyenksyBaHsSM77
         EfhCIV6FZbyzHXCZ9HClXrK8R8qZxKM4nHdlXz4ut6uL1CY+62i4UYro1xNOXDO4L9dY
         IyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPkLe9A2c/a37hUly+zrhj0g8oPWNS5BWdFQdlxMTw8=;
        b=Hvk9rRGjRw+guEuWcM3K8feNCXz82gc+WfdsJVpo3ua+VKo5g2RxNCn6RrZwhYgrzu
         W3Nt9Cw95AGXyq6CLcxXkpoJoDwAdDqE6RRhUp+i91n1yVNTzpa87qNYAMN+ij8ri//P
         QOu4wD4fdl773utKZJFp67yfKsyJ4QpzbWcyff7q1P8xhrzChDjEq79kT7vG0/80AG6V
         5DaHIz3sgZRE6SYooQUJLnCkFDr0zCvkD5xbRmoDYjCkvRWy2JRGAWciflV0QAx4TD/+
         MooK1KsEqJTcvdWIeUAc+uGxtVAkRSKQTYI7Lv6Cc3o/sk03jv+TsQtwWz5eqoMr/fxn
         9T7w==
X-Gm-Message-State: AOAM533nQCLFmPGYkBmOtVyksP5oJGemUPFNroVaDIU5IGUiFe7dsb/f
        DE9pvJPOJWoPZpCOL7VmkFAj2Q==
X-Google-Smtp-Source: ABdhPJx0uw9TCSRR+V93tjiW3ToHdg6Sqq5aiNebHk420Mimxl1+ayhEO9bw8440/cK3hU1Save1sw==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr19439037wrp.206.1593067593835;
        Wed, 24 Jun 2020 23:46:33 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id c20sm27235363wrb.65.2020.06.24.23.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:46:33 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Roger Quadros <rogerq@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 07/10] mfd: omap-usb-tll: Provide description for 'pdev' argument to .probe()
Date:   Thu, 25 Jun 2020 07:46:16 +0100
Message-Id: <20200625064619.2775707-8-lee.jones@linaro.org>
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

 drivers/mfd/omap-usb-tll.c:204: warning: Function parameter or member 'pdev' not described in 'usbtll_omap_probe

Cc: <stable@vger.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Keshava Munegowda <keshava_mgowda@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/omap-usb-tll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 4b7f73c317e87..04a444007cf4e 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -199,6 +199,8 @@ static unsigned ohci_omap3_fslsmode(enum usbhs_omap_port_mode mode)
  * usbtll_omap_probe - initialize TI-based HCDs
  *
  * Allocates basic resources for this USB host controller.
+ *
+ * @pdev: Pointer to this device's platform device structure
  */
 static int usbtll_omap_probe(struct platform_device *pdev)
 {
-- 
2.25.1

