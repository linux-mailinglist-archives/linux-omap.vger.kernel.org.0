Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EF3202B62
	for <lists+linux-omap@lfdr.de>; Sun, 21 Jun 2020 17:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbgFUPfS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 21 Jun 2020 11:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730349AbgFUPfR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 21 Jun 2020 11:35:17 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61A0C061794;
        Sun, 21 Jun 2020 08:35:16 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n2so6364951pld.13;
        Sun, 21 Jun 2020 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y6egePbuV5QUD1Pss3WsUczRgm6WZZV/FMaa+s3w21Q=;
        b=vGypfE9yre3g5v6JR0SjT1UIA+95xNwC8yWk2m+s7DiVhc09oUZtZO1v8brPNsj2dh
         be7JVZbZ+9jqcRfrTot7/Gi85kyn6mjmENav+HcsTfYlBD/wCTk6qBpMVFdL1mniepG/
         gnfFmXjNcr3EY6/v/0Ne5b+ylLoXJWNQvgzP/qcGNg6WarvvA9SpeFXB5fWEj8rhO4Pz
         yCBtyNlA5vDW2tZQvycjnhYmhAMfBQVtb5J3ioUtfhbxUTefzFqggAEc4bh/up+3++R6
         /ycvabV5Rrq1MD2yarA9vwXjtMZTyNrs4xkj2obhZsIbrwveYLDgKWWgMYJucN5suLpM
         MeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y6egePbuV5QUD1Pss3WsUczRgm6WZZV/FMaa+s3w21Q=;
        b=ILETFGuBZ9pHCj6MsDXkHWtYtmT4lbnkw1BJLszEcl1fAIk8V8bB/UgT4s4bOytAyA
         IXmJ/65ehAbrYGXyckwIEWQli0gCBzAiw5vnUN4+Jia4adWKBfY9wlyys65+RjpkaYrK
         ptVzMDS1618YbFQ28eYxuUpm97TUaEpEjkKKxcTMcOKBDW215GTLxvV+KO4wKseiK+Ty
         ebIenXgeIYZ9oBZrrnppjy6wqEFI9ReMaUJrTtsrQMdh3qwZUfCS3hckBUEuqF5GCCQo
         fJm39dgN8PoA5Mdq1Qh3c/dlgpLC0GCtilOrYfsnsmAJo8BN0wuxS16ZGlj95FHAQTva
         O4WQ==
X-Gm-Message-State: AOAM53277g/Zx3gzbPRZbcUFRpAUpDT7CWDIkY4qKoHCrmDpgWLrmKUZ
        QHkNR6g9QTlM232Ae4xGjU6AvaR2TSnL4g==
X-Google-Smtp-Source: ABdhPJz2VauVz2AkzBzAirGeS4Osm8F8gssFc5fRLWQPfBn8fc/pWUzdxvC69QmwxppHzD7ne6iIEw==
X-Received: by 2002:a17:902:bd0b:: with SMTP id p11mr16020194pls.91.1592753716171;
        Sun, 21 Jun 2020 08:35:16 -0700 (PDT)
Received: from localhost.localdomain ([106.121.157.185])
        by smtp.gmail.com with ESMTPSA id e124sm11127129pfh.140.2020.06.21.08.35.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jun 2020 08:35:15 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH] Configure osc clock for d_can on am437x
Date:   Sun, 21 Jun 2020 23:34:00 +0800
Message-Id: <1592753641-5205-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

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
  ARM: dts: Configure osc clock for d_can on am437x

 arch/arm/boot/dts/am437x-l4.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
1.9.1

