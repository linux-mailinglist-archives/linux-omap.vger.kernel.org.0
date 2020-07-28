Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617EA230659
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 11:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgG1JTj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 05:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgG1JTi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 05:19:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA89C0619D4
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 185so10131136ljj.7
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Jlap9/5dk8KWtoGhWc1HZn/eJR07N3yz1dFQNoUI38w=;
        b=mziHtOWcHiK9xk6wplNEr+rCLC0uTh86OzZiTA4tEgTmuB7tv/AE3R7555cvtrDOOo
         XjWKr4SfobnGZOL1fZ8zA/sGslNPbu/b6ghKwF0UqQdhb/uVmllgJ4JUbJdYNV1F2vKq
         FPNssOe2JNWl21ebgCs9pRR+LdXWxncEWz4n0Hhq6ZCpNDBVuXPXtcc9cjD3PT3pU/wg
         Hbh/TiYQlsXo3vJnnntu3izDQN4Cb1+n5aEinkh+ZHKN28Rp3DyWCFU6OPB2TDz2Xh4B
         TtcyiQgzlP835rYBfW6tk12eFNyZnnEmtPkZK+idJ4dLw6dlyND6n15c2j+hNthSTVw2
         eB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Jlap9/5dk8KWtoGhWc1HZn/eJR07N3yz1dFQNoUI38w=;
        b=gF5MPcZB1Bp06f1X3PoGVueQi5S4T0v2b3elrR117PajjxAhUsUEZrJJX20FspKWwB
         A1V5EIkNSfQd5Pc4GgJHjUOvoF7Rkb4vo7gTUNIvHL1j40qTR3G2zYibjBCDgT0O/jum
         P4wofSCfDt6iK/8NTetqsHL6DY1w9lKLfyPtW0ZTjDkxvQJNFRMmVRHTN8ux7B85+PzP
         ZvWyz3TPPuEu6PAUW2TzVrj8VnyJtClcWmAZXz4+oEwb7VjdIMrcsUIyyrH50QZzxuZi
         5/MXvOKrx5LHvppTSakqoDTXM3nq1UA1ZSF3skECGrD+oyA+P0QOd9N8KMfMfn1NTpQU
         Pdkw==
X-Gm-Message-State: AOAM532kaZaESqIEdURshAeT81BsWBq+OtkglDwOfN8lIkvLh/ZAvhnp
        uS3q9PP6rtJ2f6C0z2ooERVCIA==
X-Google-Smtp-Source: ABdhPJxMiZn/Up98ifKkjiIq6quC8AJuLfL/IJJqn+36Kj8wcZa176x/QHlVa1aXvg+qFan6srj8Rw==
X-Received: by 2002:a2e:964d:: with SMTP id z13mr11721612ljh.98.1595927975435;
        Tue, 28 Jul 2020 02:19:35 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id q22sm3643270lfc.33.2020.07.28.02.19.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:19:34 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com, praneeth@ti.com
Subject: [PATCH v4 0/5] Add TI PRUSS Local Interrupt Controller IRQChip driver
Date:   Tue, 28 Jul 2020 11:18:33 +0200
Message-Id: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

The following is a v4 version of the series [1][2][3] that adds an IRQChip
driver for the local interrupt controller present within a Programmable
Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS) present on a
number of TI SoCs including OMAP architecture based AM335x, AM437x, AM57xx SoCs,
Keystone 2 architecture based 66AK2G SoCs, Davinci architecture based
OMAP-L138/DA850 SoCs and the latest K3 architecture based AM65x and J721E SoCs.
Please see the v1 cover-letter [1] for details about the features of this
interrupt controller.  More details can be found in any of the supported SoC
TRMs.  Eg: Chapter 30.1.6 of AM5728 TRM [4]

Please see the individual patches for exact changes in each patch, following are
the main changes from v3:
 - Change interrupt-cells to 3 in order to provide 2-level mapping description
   in DT for interrupts routed to the main CPU as Marc requested (patch #1 and
   patch #2).
 - Get rid of the two distinct code paths in the xlate function and allow to
   proceed only with 3 parameters description as Marc suggested (patch #2).
 - Due to above modification squash patch #6 of previous patchset into patch #2.
 - Merge the irqs-reserved and irqs-shared to one property (patch #1 and #2).

[1] https://patchwork.kernel.org/cover/11034561/
[2] https://patchwork.kernel.org/cover/11069749/
[3] https://patchwork.kernel.org/cover/11639055/
[4] http://www.ti.com/lit/pdf/spruhz6

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

 .../interrupt-controller/ti,pruss-intc.yaml        | 157 +++++
 drivers/irqchip/Kconfig                            |  10 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-pruss-intc.c                   | 659 +++++++++++++++++++++
 4 files changed, 827 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
 create mode 100644 drivers/irqchip/irq-pruss-intc.c

-- 
2.7.4

