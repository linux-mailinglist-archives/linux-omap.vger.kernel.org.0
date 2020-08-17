Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F4924605F
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgHQIfv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgHQIfs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:48 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A0DC061389;
        Mon, 17 Aug 2020 01:35:47 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t10so7139120plz.10;
        Mon, 17 Aug 2020 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IwFOYY367ULZT1BN2OrQmrKwLru5AbIHU/lvBoUtbvI=;
        b=PX4S+d8SSzqmcDvaTTsGyA2ivQ3CN5X25wDtmjJVfFwuC6bz5NXD3ayhO28oMCUbDO
         MUqFNlrjccbTVa7mJEjGjRjoKHHDjjb+sFzt4o1G4Hxsvv/AqTP3OMgAhUaz79u9aB8Z
         Gr79ENBofDZokJfNqjT+lmbmlNmUlR0ZZOw12uQXnw0fGlYkn7xD9QZjZ6NsGUHKSfRa
         cyMpT73GX9xDM53F+/nqaSYDLHmLabAJJ7rTdp+WL2aSNwO1f0GfwwpZGiV0oxAVM8EW
         4pYtF71te6SFr2uNpao8D98UE3ueunxEu56vEUuGDYzn0sUPXGemS9DgUSWJ/i3hQEbT
         /DXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IwFOYY367ULZT1BN2OrQmrKwLru5AbIHU/lvBoUtbvI=;
        b=WZV/dXv6jMmVOboHg/i2QVS3gAwsiPwXzdH6PeRpRRmSbfmz1fs+pcgz8+6oxhS0wp
         Ku2EMcYvhjLZacXyS2JbnPQPSD/4K9ilcE7Sw8n7B435WAbtKRPRibDYWVXNuzR6Rv51
         Ui46qSLP2J8suFQu80g9n59eB9g+WQYvBWy7cLITMRNvS7dT54+FFouVxVNN5we5+VCT
         a9viKxez1B/QOh9ul5Sj4OGCanEEsjYO2WuCsH1xx/M63B/FHvNpYRSdu9t8jugUfrbm
         8PVlFN97vxhIClgwtE1GuKJN5OXZ3A27fNcAa20x4c7v4kjW1u4ttCkVIK3fXdTtp5Ch
         ZHLw==
X-Gm-Message-State: AOAM530sP4QySvBE6fvAYt7EnPuDog4UnZKr43JvMXh3+W0PluHgVi24
        jPkbeuPCe2IBAypeAZI8BMc=
X-Google-Smtp-Source: ABdhPJzuuZWms7RUMkI6+RPWhuqqeB3lLRfxRvIP7v4EbXz/ZUmf08sunStIEL/0sx81A2cvBjvJvw==
X-Received: by 2002:a17:902:441:: with SMTP id 59mr10581843ple.282.1597653347062;
        Mon, 17 Aug 2020 01:35:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:46 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     ludovic.desroches@microchip.com, ulf.hansson@linaro.org,
        manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl,
        jh80.chung@samsung.com, oakad@yahoo.com,
        yamada.masahiro@socionext.com, brucechang@via.com.tw,
        HaraldWelte@viatech.com
Cc:     keescook@chromium.org, inux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 05/10] mmc: omap: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:03 +0530
Message-Id: <20200817083508.22657-6-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817083508.22657-1-allen.lkml@gmail.com>
References: <20200817083508.22657-1-allen.lkml@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/mmc/host/omap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 33d7af7c7762..9852263cef4d 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -878,9 +878,9 @@ static void mmc_omap_cover_timer(struct timer_list *t)
 	tasklet_schedule(&slot->cover_tasklet);
 }
 
-static void mmc_omap_cover_handler(unsigned long param)
+static void mmc_omap_cover_handler(struct tasklet_struct *t)
 {
-	struct mmc_omap_slot *slot = (struct mmc_omap_slot *)param;
+	struct mmc_omap_slot *slot = from_tasklet(slot, t, cover_tasklet);
 	int cover_open = mmc_omap_cover_is_open(slot);
 
 	mmc_detect_change(slot->mmc, 0);
@@ -1269,8 +1269,7 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
 
 	if (slot->pdata->get_cover_state != NULL) {
 		timer_setup(&slot->cover_timer, mmc_omap_cover_timer, 0);
-		tasklet_init(&slot->cover_tasklet, mmc_omap_cover_handler,
-			     (unsigned long)slot);
+		tasklet_setup(&slot->cover_tasklet, mmc_omap_cover_handler);
 	}
 
 	r = mmc_add_host(mmc);
-- 
2.17.1

