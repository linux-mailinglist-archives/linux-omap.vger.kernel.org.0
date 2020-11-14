Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB812B2C31
	for <lists+linux-omap@lfdr.de>; Sat, 14 Nov 2020 09:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgKNIqi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Nov 2020 03:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgKNIqi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Nov 2020 03:46:38 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D5BC0617A6
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:37 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id y16so13875267ljk.1
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q/odiUkDnhOhV4xQfBLaQspz4F1FM/nkN18y8vgULzY=;
        b=KDGZmUVgbdL/YA7L/+7H1n5zkFOp4DBJzHmWky7TcGvuGfkWWtrcEM4u9zNcvYIdJk
         Yc/LcmM8D3eHuJhmsoM7/X9q7ScXj7KnuIq2yAfTfXw8RtI3JbJafYL0sW4JoOgqrPmu
         SoyYnE7isp6Cz63BbXLBkdGeLRygmAnw/1jl6HurcI8vnKTb/Ub243TvXAvh4Yv78lPk
         3gsJHbRAVLC8rE5QxRwC/v5s+jJsuoBduArDjo6FD6aBlDEZZKhP1jTv+CI4VOvi1M0i
         zXA0/sr0nahI+EFUqPTAka6vI7sltCvf7R8AUU/RBLp9xxl+UNjd2R/wwtb68fSmqoWC
         zJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q/odiUkDnhOhV4xQfBLaQspz4F1FM/nkN18y8vgULzY=;
        b=R5M9OKtc5whh8rtnkbOWcdYOHdfriBs5LYdEi/poS+3RNVTKS5DyN1GHgmikMgQ7Mi
         0H+9pVxBfurZW33qwFQq/mnOtN6VknXdis8dhiCdMloP26j+SSE98aqyXCP7fY4/p4qS
         NcDB7EF4a8mxkgWZzvv98WiGrNKkt9JY2Jf2l3Xb3DCWG8/VAahNUX20RmtV0NvOGNzY
         dDjfmbmLf92t2Np2IkqiWabgjfn5GwD/JQ0wqD9qS9lGWj3as1NsejXUxxD6Q5o0/Onr
         Dn4SNpFJC2kS1U7/riNg3BAy3S1VkA0ZysvSYhF0ApGIa9gQGjJdxC3QYouVw+GCjRoT
         sVcw==
X-Gm-Message-State: AOAM530nLFMJA8pOahAQKYy4H9p2GVMnfZPo97LiOGg+ujTDayvJHY1J
        xIvWliw0J3HEI+bBcDjl6i4YWA==
X-Google-Smtp-Source: ABdhPJxhTC6f2DjKAimnwZMyHtCSx3cdDDyBEURpNSDwedARDzrJHku8HsXdtcAvY5gwDzccBcyyrQ==
X-Received: by 2002:a2e:8504:: with SMTP id j4mr2414944lji.169.1605343596316;
        Sat, 14 Nov 2020 00:46:36 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id f62sm1870081lfd.144.2020.11.14.00.46.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 00:46:35 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH 0/6] Add a PRU remoteproc driver
Date:   Sat, 14 Nov 2020 09:46:07 +0100
Message-Id: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
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
 drivers/remoteproc/pru_rproc.c                | 880 ++++++++++++++++++
 drivers/remoteproc/pru_rproc.h                |  46 +
 5 files changed, 1153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
 create mode 100644 drivers/remoteproc/pru_rproc.c
 create mode 100644 drivers/remoteproc/pru_rproc.h

-- 
2.29.0

