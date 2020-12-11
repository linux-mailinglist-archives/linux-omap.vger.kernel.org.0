Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77C02D77E1
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 15:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406219AbgLKObh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 09:31:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731914AbgLKObY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 09:31:24 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B009DC0613D3
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:43 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id n11so6260301lji.5
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMLkq6TErLQR5vl7wxICpib93GEBHjpKENXEhX4v8c8=;
        b=kvhdV0PCnbzmkIJAaCEZ3dsAnkIQvSsDvvJTYVCHZC4CI19JDyqXcede+Oor6XRB5j
         9RTmcz+B8PBhHF2FvHIZZv5Je++tCM1N1p9uLRF+YTS+JVXJqTTJk2ooqmA3co/WQzKd
         ZazFfrOeijWGnHdjFo3paTzvSMAhqbphCjtnrSYZv4UQ2rTNfD3zH3F2P8gDrRD7hr5G
         kclJ2o7NOSMFgXEoFZ3WzJ1BLspGVFSOKQAxwQkKfmX9yc7Yv8IA+zyDgPt5iKJf80YM
         pzgzPnEH3rf7gcVCPOJmi8nL+xnrTblTgfW5mn4Rnqe9pmSrPwk9DZ6qjUI/dLHAOIPT
         efDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMLkq6TErLQR5vl7wxICpib93GEBHjpKENXEhX4v8c8=;
        b=EDK60dpNk5aj89fZgGm8CxncFBgxH9Fdj516HmXBtgLwKM9r8Aue9qtPPwaHIU4ZGA
         /XmlNV/DZCx/opaZfhW1sDXPCbbXCnsXFoLOaocN/zeo+PwaBRDgu1ni5BGmtsIen6RM
         NZ/JX8FOwIcgoFEmDieOan5dW+7a8b06XbdNN7dGN8kH0yw9rxw1yVCNcsLaeMs/7k0Y
         ZXlWWzm92DnPvrnH1d6RiGtEW/0mMdxK1NdUkRXCRSAzIxGM4qm2A9Q2cVKT0qmVox2E
         E2rc1OJJ24HwmZg/69q778CyHZVA9H5Rdy8QipQR1T5QlYk849riHaioq33vRgANMx+f
         q7Zg==
X-Gm-Message-State: AOAM530HTzKciP3OSI5Bq7uHzj/xt5TB6Fji0qCG708t39hrLto/NBj/
        le0+SXGqjaWPwKXoWanbEySv5Q==
X-Google-Smtp-Source: ABdhPJzrp7FD+oZWEwUT74Mzv+wIVpgVHhKRUDwchTjcreY+7vEBHLOcTh+vZ1yeB1g8R0GH/5kj9A==
X-Received: by 2002:a05:651c:112c:: with SMTP id e12mr1047555ljo.66.1607697042013;
        Fri, 11 Dec 2020 06:30:42 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:41 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 0/5] Introduce PRU remoteproc consumer API
Date:   Fri, 11 Dec 2020 15:29:28 +0100
Message-Id: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
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

There are 3 foundation component for PRUSS subsystem: the PRUSS platform driver,
the PRUSS INTC driver and the PRUSS remoteproc driver. Two first were already
merged and can be found under:
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

This patch set depends on not merged (but applied to remoteproc/for-next) PRUSS
remoteproc driver [1][2] and two remoteproc related patches [3] and [4].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201208141002.17777-1-grzegorz.jaszczyk@linaro.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?h=for-next&id=b44786c9bdc46eac8388843f0a6116369cb18bca
[3] https://patchwork.kernel.org/project/linux-remoteproc/patch/20201121032042.6195-1-s-anna@ti.com/
[4] https://patchwork.kernel.org/project/linux-remoteproc/patch/20201121030156.22857-3-s-anna@ti.com/

Best regards,
Grzegorz

Roger Quadros (1):
  remoteproc: pru: Add pru_rproc_set_ctable() function

Suman Anna (2):
  dt-bindings: remoteproc: Add PRU consumer bindings
  remoteproc: pru: Deny rproc sysfs ops for PRU client driven boots

Tero Kristo (2):
  remoteproc: pru: Add APIs to get and put the PRU cores
  remoteproc: pru: Configure firmware based on client setup

 .../bindings/remoteproc/ti,pru-consumer.yaml  |  64 +++++
 drivers/remoteproc/pru_rproc.c                | 221 +++++++++++++++++-
 include/linux/pruss.h                         |  78 +++++++
 3 files changed, 360 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
 create mode 100644 include/linux/pruss.h

-- 
2.29.0

