Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2F72D2CB1
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 15:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbgLHOLU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 09:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729335AbgLHOLU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 09:11:20 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185B5C061794
        for <linux-omap@vger.kernel.org>; Tue,  8 Dec 2020 06:10:40 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id q8so19520016ljc.12
        for <linux-omap@vger.kernel.org>; Tue, 08 Dec 2020 06:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG9wP54MrSEA3r8eccjMo3MMPcrQmj+RNEk7HB0q6IQ=;
        b=tLSv5kqER7QrODTRcifV8nGuQ11SV83y9ngu95JJG1ccgBn7uOzsiNH/gRKrLoWrRv
         TEBWSfZ4QKCf48OwWD0BefaBs6ImB3yLobss+Rw3PXHLQLK825uCoWEvmMw2cDb7rbpt
         DqlDCVLGCXG2lBs/IPs4Ma8WtYast15jvLRFh0i5iETgZOKnvym0MGi+4xzCBY6V3gQ2
         iyBmye15tC2+vlGmSymOs7hrGdpoFtcJi4JnyYU0n9Q5+/E6/tLYvsmcqQUwAFyIAYTt
         /5GKTV9EWdpadvOXoDEB7baIqGWdt4GVCxjnYv9G8euvEbUCWArSYSf5y+OaFVVFFSRG
         nbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG9wP54MrSEA3r8eccjMo3MMPcrQmj+RNEk7HB0q6IQ=;
        b=Lqm6o7e0XZ+oPTyDaLt0hbdxGX9JSv9d3ve/qRaqRJpWnKRRqXhPpONkdDxZXsgXIO
         x210yBzMYprrW9E9tR1D0SdMbv4z1yJM+OEa4fxQ4rxH9RmorKSTkZQA7q0Fn/+MXWBz
         +rlUGI0wkIDNWSFzOc461OS9ZDmnZjDAUpw6lFW5kIODkDWzO8+sIK4emqyaau9IVixn
         /lruL7R0+pWypxMSHh97zkMJlXP9R0nPjw8Q/TF11rZpKLozCdK7W9P3qLHJT4uaWlOL
         ZNyCYb8qkW7hXPokEuij7wSIjCpubRt2CRNwlL76gCkP/10kDkKXJGd+Vhx05UofLzu1
         kc8Q==
X-Gm-Message-State: AOAM532KJ0itLHPYQBh8k3CR6c0QKlwADGjAd1/WbrXxvNKsJbp6sU9T
        p4MKoPTHoOwHPqmAxJ/30wx6+Q==
X-Google-Smtp-Source: ABdhPJyLdeJgtkZKcSWMf0zSXx3pEMIkIpWCoLsUYgkmE1e4osmpomPb6wXMomDuRkBAdpb/9nnnqA==
X-Received: by 2002:a2e:9bd5:: with SMTP id w21mr416170ljj.432.1607436638447;
        Tue, 08 Dec 2020 06:10:38 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h23sm417017ljh.115.2020.12.08.06.10.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 06:10:37 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH v4 0/6] Add a PRU remoteproc driver
Date:   Tue,  8 Dec 2020 15:09:56 +0100
Message-Id: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
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

The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
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

The following is a v4 version of the series. There is only one change
from v3 [1]:
- Use sizeof(unsigned int) instead of sizeof(int) for kcalloc in
pru_handle_intrmap() in patch #3.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201204201807.14716-1-grzegorz.jaszczyk@linaro.org/

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
 drivers/remoteproc/pru_rproc.c                | 875 ++++++++++++++++++
 drivers/remoteproc/pru_rproc.h                |  46 +
 5 files changed, 1148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
 create mode 100644 drivers/remoteproc/pru_rproc.c
 create mode 100644 drivers/remoteproc/pru_rproc.h

-- 
2.29.0

