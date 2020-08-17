Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB18224604D
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHQIfZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgHQIfY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:24 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E332EC061388;
        Mon, 17 Aug 2020 01:35:23 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f5so7139579plr.9;
        Mon, 17 Aug 2020 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RTg2ZMt185zzvUgaMnfoRgnvAtOybCl6nq3HlbjwXIo=;
        b=np1DZOoVOiJmzQfi5gIFqZ65oL1RRtYC/68KC3rInxkaZDqqFb/7z2Lfa/8VuU5mxt
         hKEecv7OPaClrMrl2IIyG7rQQkOidWxYQokK7lg9P1SL5ycFolrW7nHdGNTyIfWBa1ZR
         zx2obDmU6/uhiHeOwGDeTg4RpWMMKRCvc9qaB0/Bm544JouhDftKId5XsiqtXOuArMgl
         hPUrI1znMdzk/abSdiSO/zFiyTwS1HMfRTC9XTg7ymAhtc8PIZmzLYvAp/w7o+O6tvfT
         O8CHuhs55HOCj2GicPc7wDhsybyic+UH/GEEGAJkk8oFkKe0Yq06697J9pl0eG35Fhui
         d6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RTg2ZMt185zzvUgaMnfoRgnvAtOybCl6nq3HlbjwXIo=;
        b=rxxaFcTV88t36call5yacylSsg3UOC1xN70AfcpCiA6Y3dYu2gCCbniFX0yPhOz3Xy
         CccC0AnWeGSmSmiY9wZgT82/X7KbeSLFXV50tXRWvfhi7AZXnZOgIY8/XmY11YEKJgz8
         ne8hwFR1rhlUPWWXGO6SOnDkkjtfJGamV7ckjt6U4lFKy2DQoYUgYhSTRtdgQVLE13wb
         cWA0WxyHbzMiB79zjkxkxJ7wa4GZMijcnZ7cJbo5aS0F8L71V6SOCkGCIc/h9JTNpMRX
         zHOZ6OkCkzVxppz9UtATrOSAlHtSDJNpGG+lvYjX0HvIK7eNxkrV4S1cRvlGaq/4Splo
         g6ow==
X-Gm-Message-State: AOAM533w/jy3dR+vYwpZ1+EasA3NjLp+kNq/joFrv6MZvb/Y83FHG9Yf
        sT2KoqzILBYcLYe3DvNr6Ik=
X-Google-Smtp-Source: ABdhPJx8MPEZVqt1qfF75/O368PzmZucttE6ZMqC8OTPwo0zJWTrr5MWUzU7fT3D2F2oBQlTv6nlCw==
X-Received: by 2002:a17:902:c286:: with SMTP id i6mr9995341pld.219.1597653322315;
        Mon, 17 Aug 2020 01:35:22 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:21 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     ludovic.desroches@microchip.com, ulf.hansson@linaro.org,
        manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl,
        jh80.chung@samsung.com, oakad@yahoo.com,
        yamada.masahiro@socionext.com, brucechang@via.com.tw,
        HaraldWelte@viatech.com
Cc:     keescook@chromium.org, inux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH 00/10] mmc: convert tasklets to use new tasklet_setup()
Date:   Mon, 17 Aug 2020 14:04:58 +0530
Message-Id: <20200817083508.22657-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the mmc drivers to use the new tasklet_setup() API

Allen Pais (10):
  mmc: atmel-mci: convert tasklets to use new tasklet_setup() API
  mmc: au1xmmc: convert tasklets to use new tasklet_setup() API
  mmc: cb710: convert tasklets to use new tasklet_setup() API
  mmc: dw_mmc: convert tasklets to use new tasklet_setup() API
  mmc: omap: convert tasklets to use new tasklet_setup() API
  mmc: renesas: convert tasklets to use new tasklet_setup() API
  mmc: s3cmci: convert tasklets to use new tasklet_setup() API
  mmc: tifm_sd: convert tasklets to use new tasklet_setup() API
  mmc: uniphier: convert tasklets to use new tasklet_setup() API
  mmc: via-sdmmc: convert tasklets to use new tasklet_setup() API

 drivers/mmc/host/atmel-mci.c                  |  6 +++---
 drivers/mmc/host/au1xmmc.c                    | 15 ++++++--------
 drivers/mmc/host/cb710-mmc.c                  | 11 +++++-----
 drivers/mmc/host/dw_mmc.c                     |  6 +++---
 drivers/mmc/host/omap.c                       |  7 +++----
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          |  2 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 20 +++++++++----------
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  9 ++++-----
 drivers/mmc/host/s3cmci.c                     |  6 +++---
 drivers/mmc/host/tifm_sd.c                    |  7 +++----
 drivers/mmc/host/uniphier-sd.c                | 14 ++++++-------
 drivers/mmc/host/via-sdmmc.c                  |  7 +++----
 13 files changed, 53 insertions(+), 58 deletions(-)

-- 
2.17.1

