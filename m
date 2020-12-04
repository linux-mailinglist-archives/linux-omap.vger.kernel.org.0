Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDAA2CF565
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 21:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgLDUS6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 15:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgLDUS6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 15:18:58 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB264C061A4F
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 12:18:17 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id t22so8024621ljk.0
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 12:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiqvOYZnVaPoXdhwyb61UvgWLIkGyPr+IhLVSfqE1SY=;
        b=fo/9yfBFQD7b9kT8+PNDIWdGD/64qLIJ9v0ZQ9bmbwA6DGaQJAiQ6Q8GUxUeeQA+3N
         5y1V9d9kuSs6v/uXZD3cOkOfgY7w7gVnm4IDNn0OjcDkllAu0jbtVgfpcCbO793Rwt68
         JzazfZSEHQOAuMOSYQ6vqdKiI2NMTD8/tASwvLft45loUV7A2p4IfM+sU6F2D14SroDO
         1Cqgt76RC8m7R3C4iX+gXmEpj0t8hIKsVSNe646jOZZkfZ4UYRg+v709ad8e23Naq0l7
         rk12iGjQ1JnZf8yioUfmR/wZ1r7sH7gLp9vnTwZdUx5VbLR86qQryp/FVSYe6Qvl4Pf2
         qdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiqvOYZnVaPoXdhwyb61UvgWLIkGyPr+IhLVSfqE1SY=;
        b=gwo20boLHgv2YJnhNMy1M//1TKIp86yHxBVa4lqAeAVxkcxSP0eM4EyKNbbjyih47b
         i/iPyzlWBFIsmbfZS0gQ66fUI/8XhpIYzwf4hwaJDvF0STDh4xK2B2HoQLbIwtb+rpay
         nYb+VnRcojVJtMc/VlxD1ftdx0mEOuBNweyAk872ANxKtrV1wv/Gr8/UE6yYmw5d8ZQB
         Ms0V7sRTdAR7ODphwoQ27xFO7y7thjnqdjWvtwYz3WoTgionD95DGZoLzItw5UrOPvui
         WwqZX5cLrOxUxptJrdyQQXAYAv9BnD7Pchjye39cf+WtmsMR/npyLfpNWrNNyJDyfk8l
         9FYw==
X-Gm-Message-State: AOAM531WETLbxiNJpMNOqB3axyxI94XMQBc1k71VIiJvPXxUXsIHHz9G
        nS2xWcAnDb4kQuc1DfJvnvA/LQ==
X-Google-Smtp-Source: ABdhPJxqAwfoWF2r9gEF11hL9VPxMbruCY+BSSSwyrxBMgUFhjwUi65/acmXhl9ZbWLYOX/XFMa2eg==
X-Received: by 2002:a2e:8e64:: with SMTP id t4mr1039685ljk.141.1607113096464;
        Fri, 04 Dec 2020 12:18:16 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w21sm2036918lff.280.2020.12.04.12.18.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Dec 2020 12:18:15 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v3 0/6]  Add a PRU remoteproc driver
Date:   Fri,  4 Dec 2020 21:18:01 +0100
Message-Id: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

The Programmable Real-Time Unit and Industrial Communication Subsystem
(PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
RISC cores (Programmable Real-Time Units, or PRUs) for program execution.

The K3 AM65x amd J721E SoCs have the next generation of the PRU-ICSS IP,
commonly called ICSSG. The ICSSG IP on AM65x SoCs has two PRU cores,
two auxiliary custom PRU cores called Real Time Units (RTUs). The K3
AM65x SR2.0 and J721E SoCs have a revised version of the ICSSG IP, and
include two additional custom auxiliary PRU cores called Transmit PRUs
(Tx_PRUs).

This series contains the PRUSS remoteproc driver together with relevant
dt-binding. This is the 3rd foundation component for PRUSS subsystem, the
previous two were already merged and can be found under:
1) drivers/soc/ti/pruss.c
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
2) drivers/irqchip/irq-pruss-intc.c
   Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml

The following is a v3 version of the series. Please see the individual patches
for exact changes in each patch, following are the main changes from v2[1]:
- Add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> for 4 patches
after introducing minor fixes/improvements.
- Adjust the patch title to latest remoteproc subsystem convention:
s/remoteproc\/pru:/remoteproc:pru:/ as suggested by Suman.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201119140850.12268-1-grzegorz.jaszczyk@linaro.org/

Best regards,
Grzegorz

Grzegorz Jaszczyk (1):
  remoteproc: pru: Add support for PRU specific interrupt configuration

Suman Anna (5):
  dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
  remoteproc: pru: Add a PRU remoteproc driver
  remoteproc: pru: Add pru-specific debugfs support
  remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs
  remoteproc: pru: Add support for various PRU cores on K3 J721E SoCs

 .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 +++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/pru_rproc.c                | 874 ++++++++++++++++++
 drivers/remoteproc/pru_rproc.h                |  46 +
 5 files changed, 1147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
 create mode 100644 drivers/remoteproc/pru_rproc.c
 create mode 100644 drivers/remoteproc/pru_rproc.h

-- 
2.29.0

