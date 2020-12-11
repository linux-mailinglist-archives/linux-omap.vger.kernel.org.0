Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E7C2D7EAE
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 19:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391150AbgLKStp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 13:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436756AbgLKStD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 13:49:03 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0360EC061793
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:31 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id r24so14687285lfm.8
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMhTDsg70Yk7T7X6CYibQwNaCnRI/oxGvYkjMkZKbJ8=;
        b=DaV9D4/FqG17M7EXWFR471nJTqUGOj/F0eo2+aMEbbmv7/mnjFvgixtxEqLl/b23d4
         O2IlW6ZhoQONLWTJ8k1wOY4zK65HJtMseKh1kpVibf717YL8HbFlzKSBf0mlTxAp7RKK
         EzZ5hj46G8ji1+RXN1oxW2x4RBZ/X7Lbram9oczoFknjgoC6StoYT2WWzN6183uHYx4s
         LLpTW284FQweuL5ejqIV1ySICnkIQijrk69ZOO4afvjn5IU95dVXmTDYThprbkPjXM9u
         vJgYWx7t547yjdC8cczuR/+UUGudsCut2rvADOZqlO3HLsYLA0SBgFbIy6pVMGIrOPPF
         YT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMhTDsg70Yk7T7X6CYibQwNaCnRI/oxGvYkjMkZKbJ8=;
        b=lS07cdMSl3nK7e+rjlZN7x4aTkRxLISxO0DpHPkA+9TfU2dBcCzfcIeoDVBMn0FGCc
         WyiCxISu9RZYF6Cztf5CDX0tqD2V2XrCcVq/+u7EbhyQ7AMP2hcGnd51/GwcGBWqbs0P
         IuPvtGK40dhklVG8uD46ya8no3MkdAhGqdFPSrRYGyqrTg/B1WoaVD0YMM6EQTHlvqsq
         cpKxBcmxsJsQ7eJwkY6OWMvkXsjD6uLPiqHZktw9E/aovj9UVbikQQt/Cegv9RS957hj
         mknbPGrygj44havhAtHSY7sYbtN70fAS2w+KSQJkkoCvzCeR2CgCJR5PZmOBCXfdn5xJ
         1Vww==
X-Gm-Message-State: AOAM533wkbHK4+vjF4oSeplC+soa0e+/vuNMaTFyKCRpDSSOxUrf2zBf
        CdB4l2L/ObbYuiXZhqt9iBFPMA==
X-Google-Smtp-Source: ABdhPJyXFvqmtAUTFC39BmGoE8MlvIHW8Q/xrmxlfynKVkXQdXT50P0xShNduRwJpeJYrg/XhQxZsg==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr5541265lfr.430.1607712509514;
        Fri, 11 Dec 2020 10:48:29 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id b12sm903316lfb.139.2020.12.11.10.48.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 10:48:28 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: [PATCH 0/6] Introduce PRU platform consumer API
Date:   Fri, 11 Dec 2020 19:48:05 +0100
Message-Id: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

The Programmable Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS
or simply PRUSS) on various TI SoCs consists of dual 32-bit RISC cores
(Programmable Real-Time Units, or PRUs) for program execution.

There are 3 foundation components for TI PRUSS subsystem: the PRUSS platform
driver, the PRUSS INTC driver and the PRUSS remoteproc driver. Two first were
already merged and can be found under:
1) drivers/soc/ti/pruss.c
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
2) drivers/irqchip/irq-pruss-intc.c
   Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml

The third one [1] was accepted and applied to andersson/remoteproc.git
(refs/heads/for-next): [2] but is not merged yet.

The programmable nature of the PRUs provide flexibility to implement custom
peripheral interfaces, fast real-time responses, or specialized data handling.
Example of a PRU consumer drivers will be:
  - Software UART over PRUSS
  - PRU-ICSS Ethernet EMAC

In order to make usage of common PRU resources and allow the consumer drivers to
configure the PRU hardware for specific usage the PRU API is introduced.

This patch set depends on "Introduce PRU remoteproc consumer API" set [3], which
is complementary to this one but goes for different, remoteproc sub-system.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201208141002.17777-1-grzegorz.jaszczyk@linaro.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?h=for-next&id=b44786c9bdc46eac8388843f0a6116369cb18bca
[3] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201211142933.25784-1-grzegorz.jaszczyk@linaro.org/

Best regards,
Grzegorz

Andrew F. Davis (1):
  soc: ti: pruss: Add pruss_{request,release}_mem_region() API

Suman Anna (3):
  soc: ti: pruss: Add pruss_cfg_read()/update() API
  soc: ti: pruss: Add helper functions to set GPI mode, MII_RT_event and
    XFR
  soc: ti: pruss: Add helper function to enable OCP master ports

Tero Kristo (2):
  soc: ti: pruss: Add pruss_get()/put() API
  soc: ti: pruss: Add helper functions to get/set PRUSS_CFG_GPMUX

 drivers/soc/ti/pruss.c       | 257 ++++++++++++++++++++++++++++++++++-
 include/linux/pruss.h        | 221 ++++++++++++++++++++++++++++++
 include/linux/pruss_driver.h |  72 +++++++---
 3 files changed, 526 insertions(+), 24 deletions(-)

-- 
2.29.0

