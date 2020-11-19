Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2F72B941F
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 15:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgKSOJB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 09:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbgKSOI7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 09:08:59 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D42EC0613D4
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:08:58 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id p12so6346674ljc.9
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UF6cB4y26/1x+ilSgxNaVWPYjbbYhd7kb0SvD73E4kU=;
        b=ui9Fzug9MSbXWblCAU0MDz8kBmjHpPOA+hoxmzbFgaHhog5Uei7ieNNzC17jJC5xXk
         OgmaTyHT+6hLr5dzjkIyJ+MVA+gMjtMjOPPVwKlsKNdgckM0bXlqwsmnMKwhrBxl939N
         bWMtMzLSp4CmWBTlibdc83mY3I5xQH1kg5hLJ5Y05IDhp94ygaK5NUvc5ay2VXX5VcEW
         4mhHwhsr4Wi9rNZw7INdbzqllPp3rpMAfeRBHp8vR9XQLe+KC0PpCSWf/ec2kbsYwVek
         Y7XJWjtDXAayJ9/h7GrTvJqHMWdz/a8nYd5Jb17bxrUaSvQmseoNUzeHdOhp8XewYOQg
         SLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UF6cB4y26/1x+ilSgxNaVWPYjbbYhd7kb0SvD73E4kU=;
        b=VbHDh32mi+dZmi1zsHp9kkubftpOlJipcLVz69KPBCyutP/daw8x6tx8DLjSbTqUYw
         +j8L0DXjyvmOyCvdqHFNodq/sPxzRKzAuJeCC7CibAURBCWHd3iXv+nNmcosmq+rV6Kk
         XiNRrl3+e8EqtlfdLUV7MhQ627M1Oo5dyPrpTArebewOYFUGEYl3lX1F5VWA+qaaBQ13
         XBTqHRL2g8hW0WoOmL0HU4nGkkBVYZD5IL62qVInEakWjPW3DSZXgwBnPoEqiIaXa29G
         MCR82pd6tnHBCj8iv2oHleTidcy9VZpHEMAFXJ6+BnW5NDFRlIAAqOyiRhnZpJaCRaQE
         /OSQ==
X-Gm-Message-State: AOAM530RkqSHy/OxbZAf7wuabaS3qgSAhNL930j3zk/BMa5g/g7PMr2N
        itBdXzbQ9gko0R+PkKAuY82P8A==
X-Google-Smtp-Source: ABdhPJx0TL5BdSP4dq002vIYpP7fDsQO06jmylq7JLz3JU64d0Gv7AEXiEzyjG8SHTDOmTip9RP+jQ==
X-Received: by 2002:a2e:90cb:: with SMTP id o11mr6356318ljg.465.1605794936946;
        Thu, 19 Nov 2020 06:08:56 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h12sm4024706lfl.74.2020.11.19.06.08.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 06:08:56 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v2 0/6] Add a PRU remoteproc driver
Date:   Thu, 19 Nov 2020 15:08:44 +0100
Message-Id: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
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

The following is a v2 version of the series. Please see the individual patches
for exact changes in each patch, following are the main changes from v1:
- Patch #1: fix two yamllint warnings.
- Patch #2: address Suman comments: minor style improvements and fix for
	    optional resource table handling (moved from patch #3).
- Patch #3: address Suman comment: minor style, comments and trace improvements
	    (no functional changes).
- Patch #4: No changes.
- Patch #5: Update documentation of pru_rproc_memcpy() function and is_k3 flag.
- Patch #6: No changes.

Best regards,
Grzegorz

Grzegorz Jaszczyk (1):
  remoteproc/pru: Add support for PRU specific interrupt configuration

Suman Anna (5):
  dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
  remoteproc/pru: Add a PRU remoteproc driver
  remoteproc/pru: Add pru-specific debugfs support
  remoteproc/pru: Add support for various PRU cores on K3 AM65x SoCs
  remoteproc/pru: Add support for various PRU cores on K3 J721E SoCs

 .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 +++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/pru_rproc.c                | 877 ++++++++++++++++++
 drivers/remoteproc/pru_rproc.h                |  46 +
 5 files changed, 1150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
 create mode 100644 drivers/remoteproc/pru_rproc.c
 create mode 100644 drivers/remoteproc/pru_rproc.h

-- 
2.29.0

