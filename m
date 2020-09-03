Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CDF25C8E2
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 20:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgICSmC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 14:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbgICSmB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Sep 2020 14:42:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E220C061244
        for <linux-omap@vger.kernel.org>; Thu,  3 Sep 2020 11:42:01 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w14so4989485ljj.4
        for <linux-omap@vger.kernel.org>; Thu, 03 Sep 2020 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ojv6Zk70N0pbknpw71ulfKg+oLfuRBwxeCEgVk52nEg=;
        b=PmgHUg7YwZYRfk8fy/b0qtwKor1VLNxaFACT9pq1qIzXr2izp251+LS8lUqZSW7KL4
         5nwmyMNkpkK3MOGxCBuG5EOMPLbBC6i06CLYfIFGAUxlxB7PA6LhjSIhAxeIQj5HcP1L
         TQVChQztEpkR+z9iYfObgEE2kwzmqBt6IbYh/nrWhls/JIl0a1LTZ3Squ09s4yCSDmCs
         H9++MGcmnALDUa7TrAXiPOHq/rwYV1dylFsbvi3MxWg1umXtYNUXKBj32uWGeenwVs/+
         TS8h4wSP606ZJLXugzKPGigTVTQdOBCu+R0Y1eNP6XzyZLo9dDFFZ4w9/eyQnpSDvnJg
         mWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ojv6Zk70N0pbknpw71ulfKg+oLfuRBwxeCEgVk52nEg=;
        b=UrTs2GKUg4gsSEw6ZTCGQle6JXGqv5osmWSJtS5YFG5HBG9GoYv33IKqpV5uTNKlUB
         VL34OX0yk3sw0d45cculR45dXyK4T9Us/NKxng5rRu2PCNNTciVLmGoAjapUF8lePiJy
         jzBuYIxSkn2m3wANVj04g930ts0jw3L92xcS85mJ5+deDXfmhIh1nFc4T+G5W3IfAwHE
         OJ3ZH4d5XEoUYfppyDpRk4cI2FhdDEFzb1hQoxiHWckVp/FMBiZFD4DcWfEVvNzJz6Gg
         wEeHxW6FvXDnAjrNX8G/asfqZLH+X8zupcCat/W5OvGqe6EHZneWn6Fh7b8Ei4GJjMLG
         pV4w==
X-Gm-Message-State: AOAM532I184oXehsFS5A1+2Aa04Wi1Ver11jE2qxYOzpDVTCWJ/BOnYP
        anbm5usNte7GH/fyPoPIkxYVFw==
X-Google-Smtp-Source: ABdhPJwFpQwo6BynYN2iRFXq6SxYV8l/szsBtAdT1FFMfbaNsMBXqPNhU6TRTeGGcR9y91+b/9OimQ==
X-Received: by 2002:a2e:9602:: with SMTP id v2mr1857532ljh.455.1599158519552;
        Thu, 03 Sep 2020 11:41:59 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id r8sm754854lfm.42.2020.09.03.11.41.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 11:41:58 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH 0/2] Extend TI PRUSS platform driver
Date:   Thu,  3 Sep 2020 20:41:39 +0200
Message-Id: <1599158501-8302-1-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This patch-set extends TI PRUSS platform driver about CORECLK_MUX and
IEPCLK_MUX support. The corresponding dt-binding is updated accordingly.

This patch series depends on TI PRUSS platform driver patchset [1].

[1] https://patchwork.kernel.org/cover/11729645/

Grzegorz Jaszczyk (2):
  dt-bindings: soc: ti: Update TI PRUSS bindings regarding clock-muxes
  soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX

 .../devicetree/bindings/soc/ti/ti,pruss.yaml       | 121 +++++++++++++-
 drivers/soc/ti/pruss.c                             | 184 ++++++++++++++++++++-
 include/linux/pruss_driver.h                       |   6 +
 3 files changed, 303 insertions(+), 8 deletions(-)

-- 
2.7.4

