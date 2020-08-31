Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BA1257BE7
	for <lists+linux-omap@lfdr.de>; Mon, 31 Aug 2020 17:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgHaPJw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 Aug 2020 11:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgHaPJr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 Aug 2020 11:09:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32BCC061573
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:46 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z17so3673534lfi.12
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=m+ousw4fXr79+y3y64jWSrgKPSzonc7IxBJ1mGORPXc=;
        b=oxU1FAWkMAdlZNofP3Lz0EkAx+ley9wg9Sx9jjQQ4URQ+XnKMUyalJ9n4R1ITqQNY8
         zH8oWA2z44OCkJtwldUGo4AF8wC9aAadul21JlM4bgVWsrGzqhRlrf1ptBhtWXZMi3Eq
         OFV+dHajvGnbRLrgAX3DLD77kxYX2E1teXA/WpMbtfFS9VMBn312R9eiGCCaboCjr+ki
         e2UzaAk6tROAdQputt3xy4WQoiqqRDRav6pQ4Q2VNX3bBRAHPZZwelsgKvatj+VpX9+C
         kalDx6pnXBODp/P56GV5O9gwDFxXzsIKUrwNlzMqErWq4pHLuhHitVorXFJpCepq3c0f
         sqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m+ousw4fXr79+y3y64jWSrgKPSzonc7IxBJ1mGORPXc=;
        b=NuF47dzX7odrnSwpcamDvReqoA6uEU8cUuk+jmGT/8kAczFpmHQmDhM1wrGBcbex7n
         bwuC3cT2EAovIlvZrxB3bOHYdsx8lMo5fvD4giArqjlYNtdpfRBroqkGYtz3DEPHEy25
         wXoZnPQqvdUC/ZkNl6vj2o5JNn28HbxXx3gzFPqHlRNWJ1/okZ8AjDfiDMxYK4WvF1lL
         OdS/LJ2DuGZqOw91tbHxsvLpNGnjkcT5UYMowid9mQ91YEB7hvumoiCqZcrH44s7Zg7N
         6C+UeTwaeVd0d5VCwskJs7qa2fqW6PUQ34ySH7L+xS0HCG0Yv30Q2Q5jRSA7WnAJs/zM
         55ZA==
X-Gm-Message-State: AOAM532rBolO/6OK0MuZ2VwoVHOzGFAXsut3Gnl2M2WMod3eQMwHMAvs
        IIjRzLR82pJ81HEUHXaT8Hjbvj424NDIbw==
X-Google-Smtp-Source: ABdhPJzdInn/v+/RHibWaNevmUbn23GSxa4f5Tmg5SIRq9zj/nOaSGRUihEyUSP8g9u+sdBwql02tA==
X-Received: by 2002:ac2:42c2:: with SMTP id n2mr894835lfl.117.1598886584936;
        Mon, 31 Aug 2020 08:09:44 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w6sm2034388lfn.73.2020.08.31.08.09.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 08:09:43 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [RESEND PATCH v5 0/5] Add TI PRUSS Local Interrupt Controller IRQChip driver
Date:   Mon, 31 Aug 2020 17:09:13 +0200
Message-Id: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
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

