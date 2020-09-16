Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4C326CC86
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 22:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgIPUpn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 16:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgIPRDY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Sep 2020 13:03:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83789C0698D0
        for <linux-omap@vger.kernel.org>; Wed, 16 Sep 2020 09:35:45 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u8so7713987lff.1
        for <linux-omap@vger.kernel.org>; Wed, 16 Sep 2020 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=jD7242K1QpVoSYp5uQBBtJhxPpRf18m7ysHu0opc35M=;
        b=nD3DKjKHeYWgXplv1RoEalEO6/+75wqWg8pfEf8+x9OtBNVX+QHHLCzOh6O508asM8
         m/HOQsn2H9ey58C5D8qtQDkhoNmdTp/HhYnJMBpM7KVbub9hpnC2YEnh9ge1A68RQF0U
         /6CSMbJsPJmZZa0zSbWsMb+LsSNScil70+/+FEImX1PvlODqB3qlkxnI3KFktkB3nITc
         5GUN1XGF5br0XTUjKQS821WxqUba5eRHgZ3DhVz0ZFuTWy10V9EYpZIErzWoOusiWj8C
         W+c4fryI+TSCoxdNa7CV5VzofUJJTrJyCabmsFNHUpCWiufOYgn1G7m/mX8httFDaz3F
         gu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jD7242K1QpVoSYp5uQBBtJhxPpRf18m7ysHu0opc35M=;
        b=m7hpo67yyjTBvVivKDMPIpE8/bVe8NwPqV0W/8u5jNZTsu/6sDaOlej9pU1IbRxKhN
         JtZremrDMBj1NaMGr7GOptop74qTY/ZpEK+eJAETNww+w+1AkkeREPKb9I+LS8EqCR2I
         JoxeWRKIcxxfXvzcgphtC7QitZ+nghH1ooWtdYOekPNoJJMIipMirzTVJLROe+EyB7Hf
         U/Z02dRIoRGHRh0/syZAwxSnHm+be9M++K4OEA5+G2n+0SGzi74Zqujby0hR5OWrWsUt
         8zoxFpJ/a5SscNOZDjfzMFN4cthJDmaCFzGjQ5GXjqeV9q4Uy6vOhg8/MB9L+B7J/u6t
         w8XA==
X-Gm-Message-State: AOAM532SoRHGNxTBiUCyJ86d8IzgcQ3/LFuPHGNb3AwXEjndBFOiOvHy
        adIz1hvfudgKSK2LzM1fLVA9EA==
X-Google-Smtp-Source: ABdhPJz0JK7EcxcL5AlGrbijKJf0uRbNc+VCaok5nNdOlG4P6zmEiZi3OZ4YWfLIHRlDDkBrRgrowQ==
X-Received: by 2002:a19:606:: with SMTP id 6mr7272729lfg.407.1600274143884;
        Wed, 16 Sep 2020 09:35:43 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id 144sm5044211lfj.35.2020.09.16.09.35.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 09:35:43 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v7 0/5] Add TI PRUSS Local Interrupt Controller IRQChip driver
Date:   Wed, 16 Sep 2020 18:35:10 +0200
Message-Id: <1600274110-30384-1-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

The following is a v7 version of the series [1-6] that adds an IRQChip
driver for the local interrupt controller present within a Programmable
Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS) present on a
number of TI SoCs including OMAP architecture based AM335x, AM437x, AM57xx SoCs,
Keystone 2 architecture based 66AK2G SoCs, Davinci architecture based
OMAP-L138/DA850 SoCs and the latest K3 architecture based AM65x and J721E SoCs.
Please see the v1 cover-letter [1] for details about the features of this
interrupt controller.  More details can be found in any of the supported SoC
TRMs.  Eg: Chapter 30.1.6 of AM5728 TRM [7]

Please see the individual patches for exact changes in each patch, following are
the main changes from v5:
 - Add Co-developed-by tags.
 - Change the irq type to IRQ_TYPE_LEVEL_HIGH in patch #2.

[1] https://patchwork.kernel.org/cover/11034561/
[2] https://patchwork.kernel.org/cover/11069749/
[3] https://patchwork.kernel.org/cover/11639055/
[4] https://patchwork.kernel.org/cover/11688727/
[5] https://patchwork.kernel.org/cover/11746463/
[6] https://patchwork.kernel.org/cover/11776181/
[7] http://www.ti.com/lit/pdf/spruhz6

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
 drivers/irqchip/irq-pruss-intc.c                   | 664 +++++++++++++++++++++
 4 files changed, 833 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
 create mode 100644 drivers/irqchip/irq-pruss-intc.c

-- 
2.7.4

