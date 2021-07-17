Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5278A3CC2E1
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jul 2021 14:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhGQMJ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Jul 2021 08:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhGQMJ4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Jul 2021 08:09:56 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14127C06175F;
        Sat, 17 Jul 2021 05:06:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s17so7204614ljo.12;
        Sat, 17 Jul 2021 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZ4FaSPclTvOdg2vW6OaAy8V6HK0XJGT4EPWt9T+Yc4=;
        b=Zg0Rfncjjh1E/CVu9Hc6J32F1yWbyDY4wCNaaXTG/M9FQG2KkzrrxGav8YmYrPG+fS
         3z2c0Zwh7FQ/Bdp9mDjwvLxf5GH2tAxXDQGiVrVYrwaquir+W7zvnaEsd8eEEwLEb+jn
         3ydl1vEtCqJT/ugUWIiiJwYB0O1lJxK5GNAcOxsuI/5vr3I2zjBnHDwz9il/YxvvWewX
         lAobBLd2gDs/h8YrZTNelN7bmbTBrAnfdslf9O1DhXH8m0RQfOZuXSx6Yc5Ac+GykJfF
         tsqORzi0WltGGV6gmILxxex2lN4TNYrXM+jRyrdVRQStNh8dcKnWjPdcDqLQDw4lq557
         Zb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZ4FaSPclTvOdg2vW6OaAy8V6HK0XJGT4EPWt9T+Yc4=;
        b=fQ1BjX3T7VAw38iUGKsT0XNfJPgJpioVYevXfo9IKW23yfgM2QQA2vgyb/KjjmKxOt
         LQ+SqdwTj/6/ZjyaUMkqpCN8nCauDecqxR0MeHkHGTJAXYakK45PmkLxhEvmc36AlAb2
         pW+/sMBK0wMI+LJXo6gFGKfYjA007sD4X1tJPdN+uIqbzai1OR5i579w4R2mAnQyDd9O
         4tERZD9f2NT39dgso+oN7vQQc3EQ92P5WXO2v6yHwKJvlqhp58i7LBFEKhdWsHxNTlLe
         MpLerRvuggjknED2mYM0kHZQamr/tvN+ohvj4m8F+LcBzYX/PHleyFy3gqw+GLMNiwMH
         56NQ==
X-Gm-Message-State: AOAM533weAcq12h7zTv1Rvxx5lhIgGTyxkvZfVNNTEElvvf5aMX5id6Q
        ADfIpFxWoqcA0uiBnGyWVbU=
X-Google-Smtp-Source: ABdhPJwaIrQqBWZppl7108v+ROhUv+epKNuGwObVIhyhNEXHZbSbds2xFFmrCQIWrQxAuckVp3xD6g==
X-Received: by 2002:a2e:9e07:: with SMTP id e7mr13103444ljk.456.1626523617469;
        Sat, 17 Jul 2021 05:06:57 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id e5sm155334ljn.72.2021.07.17.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:06:56 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hns@goldelico.com
Subject: [PATCH 0/3] ARM: dts / ti-sysc: Enable McASP on OMAP4
Date:   Sat, 17 Jul 2021 15:09:22 +0300
Message-Id: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series is the dts / ti-sysc part of the McASP DIT and OMAP4 support:
https://lore.kernel.org/alsa-devel/20210705194249.2385-1-peter.ujfalusi@gmail.com/

The ASoC part has been picked up and it is in linux-next.

I have followed the advice from Tony and added a quirk via ti-sysc to disable the
non working SIDLE mode for McASP.

Tested on PandaES.

Since I have kept the McASP node disabled the ti-sysc patch can go via different
tree if it is easier to handle.

Regards,
Peter
---
Peter Ujfalusi (3):
  ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
  bus: ti-sysc: Add quirk for OMAP4 McASP to disable SIDLE mode
  ARM: dts: omap4-l4-abe: Add McASP configuration

 arch/arm/boot/dts/omap4-l4-abe.dtsi | 38 +++++++++++++++--------------
 drivers/bus/ti-sysc.c               |  3 ++-
 2 files changed, 22 insertions(+), 19 deletions(-)

-- 
2.32.0

