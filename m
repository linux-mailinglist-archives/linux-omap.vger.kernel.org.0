Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714B124677C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 15:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgHQNlx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 09:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728657AbgHQNlh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 09:41:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE148C06134B
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i10so17525458ljn.2
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=m+ousw4fXr79+y3y64jWSrgKPSzonc7IxBJ1mGORPXc=;
        b=TEppYqF1eUfSax+aIvKd0LAUnTJWiokA4qC4Xpz2SYDaqKl5E7Sak8XoxxT4cWWViC
         JzKjRvb2mIubhps5A5g6PvyMSVLUkkRNx+mtvF3nrwtZ9eRm/Qxj4vaAaFaIV3pAOGj2
         Fe75HXYQwFsThowTlTbsAonowIKHGsT2mSRuLWOXOPw7VYsTVrGHHK+CxbA7ZG351aTk
         0nl5OT5UjgVUR7ecO8HrzWsfn/RWr+L2lX6wz2aqs7sZB34Hzsn4LNdcC6PXD9PzvoE3
         ipojH8izMRvbA0svEpxiKXr6Wobptv/9JrDkGUzSNQ6dyFyQpC+tvOZbE0iMVzy9hrYh
         M6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m+ousw4fXr79+y3y64jWSrgKPSzonc7IxBJ1mGORPXc=;
        b=foMMlMuzOuLffvD0kKKzDf+Ez4TZ6FtiZHxYfCESbj7t7GAjny/3cKRZsKvwhbSMow
         UsXa2ClrX/jLrULsUzBNW1YN5ZYFdrNSTI+rk0sINBf/YenXTEfTeY5wMqv78MiQOUMA
         xON2yLn1fjIV5ncMTDU4ivISfLfut/27FWQr/ThEW2Bdto+2oSpH5DyXM2gGuCN8IprN
         +YQu55oUxRib35g4qtTNyg+cIcuITuf8QPGUSRDbYkcsO582LZvJN1C/AC5SNvFhtx4B
         7WPsVitUqlKpWElcx/f9Kvb0AmhynjHNWxbxUSm4cd9R/12yvJH5yZxBYXIySDAyoGJW
         wCFQ==
X-Gm-Message-State: AOAM5319XVBEtMgH9HKOGiNZn3DF3LsZ8n/ibTPV0xsKJd1ydypgimEJ
        r6n1j8/U3DUJObI/DdJL7x1rtA==
X-Google-Smtp-Source: ABdhPJwmB0UO6vc4c3I2R5pE5ACL/1O6dNBEGweV8RJPEozIubkSsXH04rvei5cu86g/SsJLdWUK+A==
X-Received: by 2002:a2e:5301:: with SMTP id h1mr6111553ljb.147.1597671646924;
        Mon, 17 Aug 2020 06:40:46 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id g22sm3443791lja.29.2020.08.17.06.40.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 06:40:46 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v5 0/5] Add TI PRUSS Local Interrupt Controller IRQChip driver
Date:   Mon, 17 Aug 2020 15:40:08 +0200
Message-Id: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

The following is a v4 version of the series [1-4] that adds an IRQChip
driver for the local interrupt controller present within a Programmable
Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS) present on a
number of TI SoCs including OMAP architecture based AM335x, AM437x, AM57xx SoCs,
Keystone 2 architecture based 66AK2G SoCs, Davinci architecture based
OMAP-L138/DA850 SoCs and the latest K3 architecture based AM65x and J721E SoCs.
Please see the v1 cover-letter [1] for details about the features of this
interrupt controller.  More details can be found in any of the supported SoC
TRMs.  Eg: Chapter 30.1.6 of AM5728 TRM [5]

Please see the individual patches for exact changes in each patch, following are
the main changes from v4:
 - Update dt-binding description (no functional changes).
 - Use more meaningful define/variable names, drop redundant error messages, fix
   error handling in case of irq == 0 (patch #2).

[1] https://patchwork.kernel.org/cover/11034561/
[2] https://patchwork.kernel.org/cover/11069749/
[3] https://patchwork.kernel.org/cover/11639055/
[4] https://patchwork.kernel.org/cover/11688727/
[5] http://www.ti.com/lit/pdf/spruhz6

Best regards
Grzegorz

David Lechner (1):
  irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops

Grzegorz Jaszczyk (1):
  irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
    interrupts

Suman Anna (3):
  dt-bindings: irqchip: Add PRU-ICSS interrupt controller bindings
  irqchip/irq-pruss-intc: Add logic for handling reserved interrupts
  irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 SoCs

 .../interrupt-controller/ti,pruss-intc.yaml        | 158 +++++
 drivers/irqchip/Kconfig                            |  10 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-pruss-intc.c                   | 658 +++++++++++++++++++++
 4 files changed, 827 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
 create mode 100644 drivers/irqchip/irq-pruss-intc.c

-- 
2.7.4

