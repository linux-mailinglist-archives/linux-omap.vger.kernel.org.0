Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30EF6285CA
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2019 20:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731433AbfEWSWF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 14:22:05 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:36280 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731107AbfEWSWF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 May 2019 14:22:05 -0400
Received: by mail-lj1-f176.google.com with SMTP id z1so905238ljb.3
        for <linux-omap@vger.kernel.org>; Thu, 23 May 2019 11:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BpudeZUFrlSCrP2B/P8tYhvppT/zfprdXnWGePwKYEY=;
        b=C1Kj7Y5GxYetF4BJIrBU3mwtg+1jBuR+s4zE+5z8qJiCT051vUBnhotoYeT0lGeAcT
         8LYq3F8uCk/jcJOeXib9IPyvXg5tc5UFAAUQOMn5w99pNQEv8LGobIdeAcVpsVa8pNgg
         yd3gQg2gVJhejNSJywyYV8zN5fNUTBQdP1sOmxbAK/jI8xvU6RPge0d3foYEKc7zPoej
         wI0mYtO2kf6DTRKPKbSSh7R/8Y7FsBbExCoKynTia0WGJR+4JMioi7pquR0PHQWEDdQO
         MFgdv7KWcTUQLu31FzrE4Y1uOe9g8PxhU847czYZJXvuNpR4zBzE0aTKmpC/F5cmvZ7Y
         H3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BpudeZUFrlSCrP2B/P8tYhvppT/zfprdXnWGePwKYEY=;
        b=raZV7wzlf/Cs290IF1t1rXDN0RR7YCYjehBEOqEJYOUIEelSI5+dILh4Nsu7VqIznt
         iYsCp6ej1CHtg6oYaYPMfbjUwjznPBY/78SLuWrw1gA4AUxCMQbfeM1HNqXsuKA2uxQK
         olaeeJO8COopiW2koKZxpoXKBahNlVyY/7OcubrueD8Fx9yeVQQB5ySs8tJYHEI6CMZx
         HWEI+yJO8EJH9podXw9pCTue8PqudgsGNV4B2PpDrlejoMgooAcNhTfEIkU62hhdnMYx
         kZCr0oJCNkEkg0B5cirMkKBzlE2CVmA6Tw4MfkNLtM5MS5hbDEOB6zuXUwPDFmrMfbkV
         NNZQ==
X-Gm-Message-State: APjAAAUKmOnIloinrQM/+P1vZbBtQqR3GU86bBdQ+sQ3BRvzXDkX6YJk
        EzKwi1Ir0Y4TmZaeVVzggObfKA==
X-Google-Smtp-Source: APXvYqxAQ35H8/+Zfus63wHMy+Bnd9HPsOnmwYG4iAGndPLMW6rfYPQxR/lFRUGy5T2Hwi1tG2t4zw==
X-Received: by 2002:a05:651c:150:: with SMTP id c16mr49794302ljd.65.1558635723403;
        Thu, 23 May 2019 11:22:03 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id n26sm59904lfi.90.2019.05.23.11.22.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 11:22:02 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next 0/3] net: ethernet: ti: cpsw: Add XDP support
Date:   Thu, 23 May 2019 21:20:32 +0300
Message-Id: <20190523182035.9283-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patchset add XDP support for TI cpsw driver and base it on
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

Link on previous RFC:
https://lkml.org/lkml/2019/4/17/861

Also regular tests with iperf2 were done in order to verify impact on
regular netstack performance, compared with base commit:
https://pastebin.com/JSMT0iZ4

Based on net-next/master

Ivan Khoronzhuk (3):
  net: ethernet: ti: davinci_cpdma: add dma mapped submit
  net: ethernet: ti: davinci_cpdma: return handler status
  net: ethernet: ti: cpsw: add XDP support

 drivers/net/ethernet/ti/Kconfig         |   1 +
 drivers/net/ethernet/ti/cpsw.c          | 570 +++++++++++++++++++++---
 drivers/net/ethernet/ti/cpsw_ethtool.c  |  55 ++-
 drivers/net/ethernet/ti/cpsw_priv.h     |   9 +-
 drivers/net/ethernet/ti/davinci_cpdma.c | 122 +++--
 drivers/net/ethernet/ti/davinci_cpdma.h |   6 +-
 drivers/net/ethernet/ti/davinci_emac.c  |  18 +-
 7 files changed, 675 insertions(+), 106 deletions(-)

-- 
2.17.1

