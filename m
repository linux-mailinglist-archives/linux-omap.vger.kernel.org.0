Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22B1246053
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgHQIfn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgHQIfi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:38 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D366AC061388;
        Mon, 17 Aug 2020 01:35:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 17so7877418pfw.9;
        Mon, 17 Aug 2020 01:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V+IY+0oce77n1O9F863vvzmAh9cNOoW4gGZxQ9nHc9A=;
        b=e1rw46Ln24gbKIg1ppq0fzzVXv+VpHghXbf9lAKfxsr2UawmfLW2T3Xl68u/n+z6UG
         Yk6eKFTOewcDwbK7nj37Yi28tnPWUMuM8Zdi4LhoBtd/xVsrG4qMTxyDZMRuAFByZDT8
         pO3mIG7wYETBil7GuCzpqOCMZ5OL3obKg7vcxk1RHnAaWZqzoW8eoW4NIXeChY/nwTBL
         dt+GgPbOBnmtOVgUsKR2Mpa3w7qYVsJy7/pzvaPTEqwLHImusixvOmei2RLFxo1E5vcx
         O5Na8zNOJ910dHmJggjQYKZfa+cfdwTQD5a6v03q8SDH4/5kD98zLOYkNu4O5y7z9+fg
         X1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=V+IY+0oce77n1O9F863vvzmAh9cNOoW4gGZxQ9nHc9A=;
        b=hnDYnOK1obVuWZfT5Aj2q/oZepkzpOMYIf1b99otDmA+ue6uE5BbQgMC8lCF3Zr5Uo
         jD8yToI9aY3qqAO5laQmDjUc670yuIMeFZzWl941THabeHbSvferkCWxSRCuRJ6nV84R
         e84JU9Pu1MJ5ZLNMVPlBvRYWg236RTOfGs3JjWzSAHQksfEjWUkiufvBNPszPcqDuMEn
         r5uFfa4QSCMqLQmOTG8BqgWxc9dISMmBgWELEq8rqQ8PN3WjimkN96mx6ius/Jkm/iNX
         ymy1JTtEiaQMSaZqGiQGg84yTO4V/zAeII5aOyPnBdbpSpkAlhNCNVesKFJk4dr0yFPf
         cWeQ==
X-Gm-Message-State: AOAM5338W8OzyCfDBbjEKjuw3dOV3vr2IFcZgSlcj8Fyjw++6akW6QA8
        EEew97AdikSLbT+HXOBW3qE=
X-Google-Smtp-Source: ABdhPJxdR0X4pzjphQ0xJ24hWd4Gij3HiSYXjTekxa2x2+d2jVKzh0raQSM/vy36I48/+J21wkO35g==
X-Received: by 2002:a63:2fc3:: with SMTP id v186mr9030009pgv.158.1597653337480;
        Mon, 17 Aug 2020 01:35:37 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:37 -0700 (PDT)
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
Subject: [PATCH 03/10] mmc: cb710: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:01 +0530
Message-Id: <20200817083508.22657-4-allen.lkml@gmail.com>
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
 drivers/mmc/host/cb710-mmc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/cb710-mmc.c b/drivers/mmc/host/cb710-mmc.c
index e84ed84ea4cc..3e8fd2850794 100644
--- a/drivers/mmc/host/cb710-mmc.c
+++ b/drivers/mmc/host/cb710-mmc.c
@@ -646,11 +646,12 @@ static int cb710_mmc_irq_handler(struct cb710_slot *slot)
 	return 1;
 }
 
-static void cb710_mmc_finish_request_tasklet(unsigned long data)
+static void cb710_mmc_finish_request_tasklet(struct tasklet_struct *t)
 {
-	struct mmc_host *mmc = (void *)data;
-	struct cb710_mmc_reader *reader = mmc_priv(mmc);
+	struct cb710_mmc_reader *reader = from_tasklet(reader, t,
+						       finish_req_tasklet);
 	struct mmc_request *mrq = reader->mrq;
+	struct mmc_host *mmc = mrq->host;
 
 	reader->mrq = NULL;
 	mmc_request_done(mmc, mrq);
@@ -718,8 +719,8 @@ static int cb710_mmc_init(struct platform_device *pdev)
 
 	reader = mmc_priv(mmc);
 
-	tasklet_init(&reader->finish_req_tasklet,
-		cb710_mmc_finish_request_tasklet, (unsigned long)mmc);
+	tasklet_setup(&reader->finish_req_tasklet,
+		      cb710_mmc_finish_request_tasklet);
 	spin_lock_init(&reader->irq_lock);
 	cb710_dump_regs(chip, CB710_DUMP_REGS_MMC);
 
-- 
2.17.1

