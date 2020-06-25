Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCE420A2FF
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 18:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406275AbgFYQcR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 12:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406179AbgFYQbh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jun 2020 12:31:37 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D119C08C5C1
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 09:31:37 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so6501180wrc.7
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SPm1NIoii4wp9HC9Gj5qfuMICtlvrSHRycc3QSZfRtM=;
        b=Oc6Gltle84A86QA8gNtOqEV/3yAOQ2so8xkE1d2LdYXT4/k3U5+r2QEFnPWiDUAccm
         Uar3DxQDE6xpe12o0ztoVfC2w4xJlXQy7OjCKQS1nQc3oWmmIcUQ47SqdWmiSz1Ljif7
         34wb61IwWDSmV4datUbi2+aSRTQOQIur0agRCRZVkF/UfvLN02otdpR+TPEyceLkmtHk
         KXHe4u9ly4IXJZAxe7yi2jK7szMHLCFvfVFcOJnV5lQgE0I2bF1TQpsNfEL4zFqNrH/x
         fr+jLI6l5RfgtVC7SIsW6zeZMON74CmOvWC2kLyD4PSsoJG7VjMpUehREXD5+rs/X6UR
         PZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SPm1NIoii4wp9HC9Gj5qfuMICtlvrSHRycc3QSZfRtM=;
        b=gJCMKjwuSEeMzIuC08qFwl7HNIYUCxs/SIlyb/fVmmMG7oc2jTBtNAOfoitTn8ukDE
         +CTHYpvZSpHvBQ1DYXQwKmC2iZ6Xp/x4d+Z89++ODmiR+9tEWzQSt+BrZMtDUny6IIRZ
         XOO+3MQQ91SnvRgPZJWE9KKOooY2jsoPjSnftgwlK5cEGPlPo20DOhFRr9ezUs1Udxia
         TjmRR9u0sYBoOY7HXmPFpIKRO1atd7fzLMbkqD2OLcQvUnq05QyZlizPAST/p8Lhy/J2
         B8FVmB1fv43wGTvDKLjW0rftINDeOGfJWcTBKA3RfCCfxtwVFw7OaUyyPvP81ePvLaev
         FWbg==
X-Gm-Message-State: AOAM533a89vV3oFVJbepRjJ9i60+PVTvEqLMN8icn2XbJwz6GpTVGCHx
        Cd0llMXDUm68naT8BYr+KROzxg==
X-Google-Smtp-Source: ABdhPJwES1XecqH4cBXo1fQeYPsxoZ0MTBumS6wvW98Pi31ZCdSAaVU/3Nqdi5GIDI6t+uULaWzFkg==
X-Received: by 2002:adf:8168:: with SMTP id 95mr37262827wrm.104.1593102696010;
        Thu, 25 Jun 2020 09:31:36 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id l8sm32090847wrq.15.2020.06.25.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 09:31:35 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>, J Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 02/10] mfd: tps65218: Repair incorrect function argument name 's/tps65218/tps/'
Date:   Thu, 25 Jun 2020 17:31:19 +0100
Message-Id: <20200625163127.4000462-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200625163127.4000462-1-lee.jones@linaro.org>
References: <20200625163127.4000462-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The kerneldocs for both tps65218_reg_write() and tps65218_update_bits()
describe their first arguments as 'tps65218', when in reality these are
simply called 'tps'.

Fixes the following W=1 warnings:

 drivers/mfd/tps65218.c:58: warning: Function parameter or member 'tps' not described in 'tps65218_reg_write'
 drivers/mfd/tps65218.c:58: warning: Excess function parameter 'tps65218' description in 'tps65218_reg_write'
 drivers/mfd/tps65218.c:90: warning: Function parameter or member 'tps' not described in 'tps65218_update_bits'
 drivers/mfd/tps65218.c:90: warning: Excess function parameter 'tps65218' description in 'tps65218_update_bits'

Cc: Tony Lindgren <tony@atomide.com>
Cc: J Keerthy <j-keerthy@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/tps65218.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
index a62ea4cb8be7e..d41dd864b472b 100644
--- a/drivers/mfd/tps65218.c
+++ b/drivers/mfd/tps65218.c
@@ -48,7 +48,7 @@ static const struct mfd_cell tps65218_cells[] = {
 /**
  * tps65218_reg_write: Write a single tps65218 register.
  *
- * @tps65218: Device to write to.
+ * @tps: Device to write to.
  * @reg: Register to write to.
  * @val: Value to write.
  * @level: Password protected level
@@ -79,7 +79,7 @@ EXPORT_SYMBOL_GPL(tps65218_reg_write);
 /**
  * tps65218_update_bits: Modify bits w.r.t mask, val and level.
  *
- * @tps65218: Device to write to.
+ * @tps: Device to write to.
  * @reg: Register to read-write to.
  * @mask: Mask.
  * @val: Value to write.
-- 
2.25.1

