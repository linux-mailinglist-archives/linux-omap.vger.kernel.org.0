Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B5B274910
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 21:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgIVT1Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 15:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgIVT1N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Sep 2020 15:27:13 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889A0C061755;
        Tue, 22 Sep 2020 12:27:12 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so19267139lfi.12;
        Tue, 22 Sep 2020 12:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NbcGmvqhnphoPmR7CaniRcqoPJY6GHjvr9+YPIOk8PY=;
        b=briIm7ams8JEYWcKhFZF6BbdX6SluBpcE6wdfJB7P5oTI08s3ZlKFhPePPKkrK4vkv
         xnb8Y+VIkV6/Z6V4zLPtm4t4LxAVqKWLYn+9Q9Pxxs7e/JCQo8ffLR23luoHO0glJzZO
         9ki/6omZUHPpzoxk7HvpIq6S9eG6bMwxuG2i4olsLXFKY9kUXLC1x5uHXBjGwQTd5fHD
         cEmXEnhCo4Rf/t3h9zphbbho/BN5XS8QnLtgUBLHd+c/nGS7eKv1wIqh18m6Ttf9yjDT
         X4+hek4KRpfPUvNHDVzMkQ3NS8jwzF82BSxMbGd21/fHB7pFwEX/263rHG77bIoefw0a
         YPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NbcGmvqhnphoPmR7CaniRcqoPJY6GHjvr9+YPIOk8PY=;
        b=gZzWlMywuWZzF7miAazQBY5Ak3mwVUzgRPGQlFZgxKA4N0XV4A5Rs7ol+RfzV1o8sS
         KoGDqTRrZr0Gp1O1czRuZ+YctQTby9/MmkASFjw0wwxSc6/WWygYsahOx9PabDUyz6HC
         atdOwgM5f8Kk+Eao1pQ7j/KYC8lUJyaU9v8e8pRUUCbaC+vSBV5d9ESD01qMavXBxD7T
         KhnSQ8p3CFMV8TiuqIKOnfklbFOTFBwL4ga4A/atzgs37113RDPtu1JLYaOEkyWasMDX
         JI0OB+fli6rGOLvCir0nd5KA1YZv3xnsvercsmPELZ8xk9RpprUF3YvfqaQ/psjhxAU0
         QN5w==
X-Gm-Message-State: AOAM533kn5zPeslFJ+K7Px7ENZC0RlhWLk1rZiHuDIIrvHl5EtWozUiZ
        KKWBo6UEXvHoKHV2oMBdHWo=
X-Google-Smtp-Source: ABdhPJyrLNQKicoq9YMzcwFoTg4/l6hDQQtNG+zyha3uMjomg3CvCJ6n8lvvnx/v0NTha5c4GGLUog==
X-Received: by 2002:a19:c147:: with SMTP id r68mr2009041lff.381.1600802830972;
        Tue, 22 Sep 2020 12:27:10 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id r132sm3770013lff.167.2020.09.22.12.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:27:09 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 3/8] mfd: Constify static struct resource in OMAP2+ drivers
Date:   Tue, 22 Sep 2020 21:26:54 +0200
Message-Id: <20200922192659.14535-4-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
References: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Constify a number of static struct resource. The only usage of the
structs are to assign their address to the resources field in the
mfd_cell struct. This allows the compiler to put them in read-only
memory. Done with the help of Coccinelle.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/mfd/tps65217.c | 4 ++--
 drivers/mfd/tps65910.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index 2d9c282ec917..8027b0a9e14f 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -33,12 +33,12 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps65217.h>
 
-static struct resource charger_resources[] = {
+static const struct resource charger_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65217_IRQ_AC, "AC"),
 	DEFINE_RES_IRQ_NAMED(TPS65217_IRQ_USB, "USB"),
 };
 
-static struct resource pb_resources[] = {
+static const struct resource pb_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65217_IRQ_PB, "PB"),
 };
 
diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..a6c28df7aa38 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -21,7 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-static struct resource rtc_resources[] = {
+static const struct resource rtc_resources[] = {
 	{
 		.start  = TPS65910_IRQ_RTC_ALARM,
 		.end    = TPS65910_IRQ_RTC_ALARM,
-- 
2.28.0

