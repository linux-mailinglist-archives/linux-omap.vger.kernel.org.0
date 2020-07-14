Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3031421E68C
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 05:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgGNDwL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 23:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGNDwL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jul 2020 23:52:11 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1185FC061755;
        Mon, 13 Jul 2020 20:52:11 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u185so7003413pfu.1;
        Mon, 13 Jul 2020 20:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BBW3oa13Oa8CN3zGFpEI3FHknw3Uj0TMLjOHYEFkNdM=;
        b=QwF5+Zb6uv1oHdz/iyAarbRcEm9woy225E53I+2oBKpb9u+ubyywQdyk75QBbKtMPB
         l2PVQZtQ1ineCMboClfowLPsciRCgpUEw0WGd5IDKgm+Agd9rUHYsZH2rzmB9s8KgTXM
         NsSfANR7QnH8JpkA/jtRa1bT9emFcy4kjCT99EeB5J6Z8dSOwflirm5pp/t2NNXr8aEn
         nro+THY4n/0rymYHngR25igGKGMT6bP+C93QjtB+FeAItLSyNVQUZyzeinLLbCVA7vni
         AJNX0zTuJoZbHrSMm1FqtQV78jkTncJ4mHRyDKrOg29Y216AOIVJ9YGrNZvfK5nx19SN
         sIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BBW3oa13Oa8CN3zGFpEI3FHknw3Uj0TMLjOHYEFkNdM=;
        b=ga8R4dig30j23JdnuPk5nqZqy7/VxbRL+9pyCLxcLX6m7yVkt+6iLO/6orsaX9wzmO
         ZbLw4KVBH9e6JbG610iJPTq9B5feJiJn20BCFzDIxgOviNIjFUKc6DSXFQN+PqviIz3Q
         qCoKu29lXyWrZv1fWnMV058Y2zfxhIt2tDy46N0gMvB325CL3ebE+MA+oQvyW1jSfCTn
         3qCJT6pFepyFm/LXPtJHn+NVglcLrjCAtxkrOxWm0Rg97am0hJ8Ps3IYw+/4hNUy8qIQ
         zxj6mSLb/lEnADQ0zoNxUv3+tWd+Zc5WtabYZJgW78ZKXhlrg8wjPHd1iswuJ4nVof2w
         5lbw==
X-Gm-Message-State: AOAM5312BIu/W2JgQRwdNlE1yGT9+wvbHXFnQYXE/r0Fzz1U2Z1M+HLB
        vhDsG6uDD8srJw/5OFi4r8M=
X-Google-Smtp-Source: ABdhPJzGFvPrVkkdZmdazY4aHmlfE0Mk7hut0QL4mPKgFTjhQE1zq6iNlbs4o1q+q9Znn1iWIZ7KCA==
X-Received: by 2002:a05:6a00:2286:: with SMTP id f6mr2566676pfe.303.1594698730624;
        Mon, 13 Jul 2020 20:52:10 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.8])
        by smtp.gmail.com with ESMTPSA id v11sm17595832pfc.108.2020.07.13.20.52.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 20:52:10 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     sfr@canb.auug.org.au, bcousson@baylibre.com, tony@atomide.com,
        robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v3] ARM: dts: Configure osc clock for d_can on am437x
Date:   Tue, 14 Jul 2020 11:52:05 +0800
Message-Id: <1594698726-4557-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

V2 -> V3:
make Fixes tags after Signed-off-by line.

V1 -> V2:
correct commit messages based on Stephen Rothwell's reviewing.
make Fixes tags to oneline.
make all commit message tags at the end of commit message


V1:
Got following d_can probe errors with kernel 5.8-rc1 on am437x

[   10.730822] CAN device driver interface
Starting Wait for Network to be Configured...
[  OK  ] Reached target Network.
[   10.787363] c_can_platform 481cc000.can: probe failed
[   10.792484] c_can_platform: probe of 481cc000.can failed with
error -2
[   10.799457] c_can_platform 481d0000.can: probe failed
[   10.804617] c_can_platform: probe of 481d0000.can failed with
error -2

actually, Tony has fixed this issue on am335x, the patch [3]
commit messages:
"
The reason why the issue happens is because we now attempt to read the
interconnect target module revision register by first manually enabling
all the device clocks in sysc_probe(). And looks like d_can also needs
the osc clock in addition to the module clock, and it may or may not be
enabled depending on the bootloader version and if other devices have
already requested osc clock.

Let's fix the issue by adding osc clock as an optional clock for the
module for am335x. Note that am437x does not seem to list the osc clock
at all, so presumably it is not needed for am437x.
"

from TRM of am335x/am437x [1][2], they have the same clock structure,
so, we can just reuse [3] for am437x platform.

Tested on custom am4372 board.

[1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
Integration
[2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
Integration
[3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am335x")


dillon min (1):
  Since am437x have the same clock structure with am335x [1][2],    
    reuse the code from Tony Lindgren's patch [reference] to fix dcan
    probe     failed on am437x platform.

 arch/arm/boot/dts/am437x-l4.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
2.7.4

