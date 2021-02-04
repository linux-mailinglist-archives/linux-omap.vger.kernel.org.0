Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35ED930F60E
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237167AbhBDPUd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237018AbhBDPTr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:19:47 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A64C0613D6;
        Thu,  4 Feb 2021 07:19:07 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id sa23so6008346ejb.0;
        Thu, 04 Feb 2021 07:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f6iWFEAYRCiS0CjNBB4+1Bs58fQyu4Ujqibyp6Xzunk=;
        b=g8JjPr8Og6MOjlid6yiCVvuvoywGwnt6hVt9ISTETXyI+cqnUNkwfKCWwunTCT9Iy+
         k5U13HLU7smUIPdEYk6N2bBfLH4CgiHTN+jFupnKsldM+I5QaYaEVHwJjuCzJ/Uap6PI
         AUp4wtfFJZCndMJC1DOrzn7NElv4g77c0ZuLLyAH8tvNfw184ZUl0ybtfylYbSyVMWBy
         zb1BSAvAEB6xuRKDftnfiOF4LJ6z03NR7i+vu8dsx+zzHNxv4rHKBhtjn4mHrJa6qRc5
         7TVvd3w0+q1zLYwPqui0FLPUCy3zjimIjBjI1pZPsuN78Mofy8kytbZ5Y2QuRexk0KIC
         WoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=f6iWFEAYRCiS0CjNBB4+1Bs58fQyu4Ujqibyp6Xzunk=;
        b=oCgv3SFvwBujrcYL/9fdeuaYiJJ7Cgn40QSYTbcaJDOBh5fysYv8eS1fJJgvJmX8a7
         t/qrUcp8BYZv7ix1kFirJXm46UHeebAqOcVU0XNQrIE8FypvPNcJ+HkTH5emJwiZOVOf
         Yu59HW4cHw8ZtqOFeFoJeNRc04MFuSqOB93uB6cSTfWU0RkFucnJZIFmm9GCKsgiBT1U
         bCIBPTcCZSoaMxbFmkjEUAHRjfEzS3MebHiSmQNZGi3L63bDZmMR+d2q6Sf7ydoLYfPU
         CMzE5WetupUBm8fITKAtP3/wScnkA45WGBc5AHICWHqeNnOWvmqhBhmsAQwHd726/PsG
         CWlQ==
X-Gm-Message-State: AOAM531HO6ldk9+CxQhS/eR8BjGjDWby3wy0bJYuDpE17PbT8dFeLmNi
        MFZ/a1hERh0hxk6fg4y5kB1OFKJp1sH+1VYE
X-Google-Smtp-Source: ABdhPJz3Q4QIVCuc3EgJ+sTEXLy5VS0DEZI5CscTUcmPq9rkUY+3j7YXO3u+jmN1MedN4mHikAL2uw==
X-Received: by 2002:a17:907:35ca:: with SMTP id ap10mr8479505ejc.451.1612451946279;
        Thu, 04 Feb 2021 07:19:06 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:05 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Ben Dooks <ben-linux@fluff.org>, Alex Dubov <oakad@yahoo.com>,
        Bruce Chang <brucechang@via.com.tw>,
        Harald Welte <HaraldWelte@viatech.com>,
        Pierre Ossman <pierre@ossman.eu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] drivers: mmc: Update trivial tasklet_init() callers
Date:   Thu,  4 Feb 2021 16:18:38 +0100
Message-Id: <20210204151847.91353-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This updates callers of tasklet_init() in drivers/mmc to the new API
in commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

All changes are made by coccinelle using the following semantic patch:

@ match @
type T;
T *container;
identifier tasklet;
identifier callback;
@@
	tasklet_init(&container->tasklet, callback, (unsigned long)container);

@ patch1 depends on match @
type match.T;
identifier match.tasklet;
identifier match.callback;
identifier data;
identifier container;
@@
-void callback(unsigned long data)
+void callback(struct tasklet_struct *t)
{
	...
-	T *container = \( (T *)data \| (void *)data \);
+	T *container = from_tasklet(container, t, tasklet);
	...
}

@ patch2 depends on match @
type match.T;
identifier match.tasklet;
identifier match.callback;
identifier data;
identifier container;
@@
-void callback(unsigned long data)
+void callback(struct tasklet_struct *t)
{
	...
-	T *container;
+	T *container = from_tasklet(container, t, tasklet);
	...
-	container = \( (T *)data \| (void *)data \);
	...
}

@ depends on (patch1 || patch2) @
match.T *container;
identifier match.tasklet;
identifier match.callback;
@@
-	tasklet_init(&container->tasklet, callback, (unsigned long)container);
+	tasklet_setup(&container->tasklet, callback);


Emil Renner Berthing (9):
  mmc: atmel-mci: Use new tasklet API
  mmc: au1xmmc: Use new tasklet API
  mmc: dw_mmc: Use new tasklet API
  mmc: omap: Use new tasklet API
  mmc: s3cmci: Use new tasklet API
  mmc: tifm_sd: Use new tasklet API
  mmc: uniphier-sd: Use new tasklet API
  mmc: via-sdmmc: Use new tasklet API
  mmc: wbsd: Use new tasklet API

 drivers/mmc/host/atmel-mci.c   |  6 +++---
 drivers/mmc/host/au1xmmc.c     | 14 ++++++--------
 drivers/mmc/host/dw_mmc.c      |  6 +++---
 drivers/mmc/host/omap.c        |  7 +++----
 drivers/mmc/host/s3cmci.c      |  6 +++---
 drivers/mmc/host/tifm_sd.c     |  7 +++----
 drivers/mmc/host/uniphier-sd.c | 14 ++++++--------
 drivers/mmc/host/via-sdmmc.c   |  9 +++------
 drivers/mmc/host/wbsd.c        | 35 +++++++++++++++-------------------
 9 files changed, 45 insertions(+), 59 deletions(-)

-- 
2.30.0

