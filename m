Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 534EC5B0E5
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jun 2019 19:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfF3RYU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Jun 2019 13:24:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40881 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbfF3RYT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Jun 2019 13:24:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so10637660ljh.7
        for <linux-omap@vger.kernel.org>; Sun, 30 Jun 2019 10:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=DPwrQFg4SMsQ0Yy8vytLFwgLYycpl+OBmBKTwx8dTWc=;
        b=Jn5dbha8phys6TijaUHIy41CHa5/B3xQc4VSSGASGi7VOd4SHz7clN1hLMUh3dPUYI
         UOB9RFG1eUP93Af+QAaSqU3qKo2/efPk9tZV2eRulM5yn27qlllCAFgtaIzi7ppXkEk1
         Io+x2gb3pbYr7Zck+QzMJ8jwINmy4nW7sYl0PWAwCxRu7uxLZq8Xpb0TzKZwKEfBSwjz
         wH8S9eMaG9CHuJrzF06DgsuaecQGdefZyRTbNoYZJi7QEIdo94KYUIUWj/6Cbrnu/Hlz
         jcMMsJ8KzmT3taHEl6zTIXOEzBCFLc8dQ9rM6rTDWffQH2Ani+0ic7adE63Dgag/pzMa
         d3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DPwrQFg4SMsQ0Yy8vytLFwgLYycpl+OBmBKTwx8dTWc=;
        b=PLLIq1nNdqpqAyIZwSr2ER7rDa9U83fjWyQxPx8T2H+VZQylmsPlOLdmnEdhWNo/yJ
         H/Yk3VGp0jPDU6jQMdRSqpniBMkmrXfpKCYZT2nuE1DLp93P+6U69GEV5Vt1j0QfwZYl
         elcRpZgOX3hVPn/74JMS82QM1YACExzLFNvm9DX2Acw0/Ogk/T1sWcD2GJu5rcNQ0uDv
         rXQXlqybAvxwgf705nPJ47zquc2ahTR3y00nqY28JNb53nwRTXeUXVlxIOXQA99Bs6wI
         nJ0iP5CwjyR/HuxPC4jaxsO1j6ID996AieHtg5wjvE9A9AC+0YUEoOPZh1xK4C6bsUff
         3EwQ==
X-Gm-Message-State: APjAAAVQkkhF4aTmCx0wnKJV4MVk+ft7zF3vyj3gEvK/VykXemFV5yX8
        NK0XaEvHvaIo7k32/fs6DDO5sQ==
X-Google-Smtp-Source: APXvYqzg00rV2HOfgLqYPrIxuxkj4JtSuEaGuAlRnQ8UUfwPQyN31xUZUHRyb4DtfKm7qcEWHMQ0GA==
X-Received: by 2002:a2e:658e:: with SMTP id e14mr11462808ljf.147.1561915457685;
        Sun, 30 Jun 2019 10:24:17 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id c1sm2273795lfh.13.2019.06.30.10.24.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 10:24:17 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v5 net-next 0/6] net: ethernet: ti: cpsw: Add XDP support
Date:   Sun, 30 Jun 2019 20:23:42 +0300
Message-Id: <20190630172348.5692-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patchset adds XDP support for TI cpsw driver and base it on
page_pool allocator. It was verified on af_xdp socket drop,
af_xdp l2f, ebpf XDP_DROP, XDP_REDIRECT, XDP_PASS, XDP_TX.

It was verified with following configs enabled:
CONFIG_JIT=y
CONFIG_BPFILTER=y
CONFIG_BPF_SYSCALL=y
CONFIG_XDP_SOCKETS=y
CONFIG_BPF_EVENTS=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_BPF_JIT=y
CONFIG_CGROUP_BPF=y

Link on previous v4:
https://lkml.org/lkml/2019/6/25/996

Also regular tests with iperf2 were done in order to verify impact on
regular netstack performance, compared with base commit:
https://pastebin.com/JSMT0iZ4

v4..v5:
- added two plreliminary patches:
  net: ethernet: ti: davinci_cpdma: allow desc split while down
  net: ethernet: ti: cpsw_ethtool: allow res split while down
- added xdp alocator refcnt on xdp level, avoiding page pool refcnt
- moved flush status as separate argument for cpdma_chan_process
- reworked cpsw code according to last changes to allocator
- added missed statistic counter

v3..v4:
- added page pool user counter
- use same pool for ndevs in dual mac
- restructured page pool create/destroy according to the last changes in API

v2..v3:
- each rxq and ndev has its own page pool

v1..v2:
- combined xdp_xmit functions
- used page allocation w/o refcnt juggle
- unmapped page for skb netstack
- moved rxq/page pool allocation to open/close pair
- added several preliminary patches:
  net: page_pool: add helper function to retrieve dma addresses
  net: page_pool: add helper function to unmap dma addresses
  net: ethernet: ti: cpsw: use cpsw as drv data
  net: ethernet: ti: cpsw_ethtool: simplify slave loops


Based on net-next/master

Ivan Khoronzhuk (6):
  xdp: allow same allocator usage
  net: ethernet: ti: davinci_cpdma: add dma mapped submit
  net: ethernet: ti: davinci_cpdma: return handler status
  net: ethernet: ti: davinci_cpdma: allow desc split while down
  net: ethernet: ti: cpsw_ethtool: allow res split while down
  net: ethernet: ti: cpsw: add XDP support

 drivers/net/ethernet/ti/Kconfig         |   1 +
 drivers/net/ethernet/ti/cpsw.c          | 520 +++++++++++++++++++++---
 drivers/net/ethernet/ti/cpsw_ethtool.c  |  78 +++-
 drivers/net/ethernet/ti/cpsw_priv.h     |   9 +-
 drivers/net/ethernet/ti/davinci_cpdma.c | 125 +++++-
 drivers/net/ethernet/ti/davinci_cpdma.h |  11 +-
 drivers/net/ethernet/ti/davinci_emac.c  |  17 +-
 include/net/xdp_priv.h                  |   1 +
 net/core/xdp.c                          |  46 +++
 9 files changed, 701 insertions(+), 107 deletions(-)

-- 
2.17.1

