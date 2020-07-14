Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1764B21E839
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 08:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgGNGfN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 02:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgGNGfM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jul 2020 02:35:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EB8C061755;
        Mon, 13 Jul 2020 23:35:12 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t15so1049977pjq.5;
        Mon, 13 Jul 2020 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nYIq3s1IHbdH+MZbpM6kGknWWai88MaOCyqNgWjvORc=;
        b=HE0YOIdtyktN/30g5UR4aTbDMEiJ60MfhzG2RF8vKWVhG1kla54bXSlfT5Tff4Dw5a
         T6PjAD6fhfPS3YAfdirgAUBBVtHINZVhLZonhmDEiOrAET+wvq348P8fSeQ5QREeoEj4
         4smc0y3hv+zQxrPiyTdiur6S3uoW9zn9uyuegIrVLEj2gPXxOeDzVN0yFIJjyTMdxLTx
         l/EglEwGocda2Ezxp+/qNOv0jJY2TEEXJfsDsX1N4C0EMpMRgUiLnd92sjHMJtfwcOyY
         ymZRU2iJAaDf3W4WxIdDblZyw4XCNi9H2VYTjl3WRUtnBz8iWwuv+Ksddsh2FSYOiplg
         QigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nYIq3s1IHbdH+MZbpM6kGknWWai88MaOCyqNgWjvORc=;
        b=gFgffUPYFPrd4stCm8H8n/CJBYkYz0cCYJXNOXTwj1GsZhOInWzVVIG8q9iK5g2mYB
         d2WbcvPWiVG420iUMbUCZKMEFSshv92uc4KfwmjxnBokZ8IQ87oZT98lIiOdRt1i8T3q
         TqOkk/FhS0QXP0gsN22w20mza/Z0M2/Y0BMzAz/Mptcz604Zm5XZeKgtk8KSrFQcz1hK
         R+D7oxQSv1gpXDFhYC+rEelgKtlRVIRvo9lh3H7RCAvlAv0LSZSyxwCRc2pgCh8mMyzp
         107wGG0uKkF6NayEk6Uu1G0ngOK94iM/HYOS37pTjzWtKzSvSnzf/WwoOT6UJnHfEerB
         +NoQ==
X-Gm-Message-State: AOAM531vFL+7WEbwXZTGCqtsqISLgPv/4jXEGqKnxW3EJwa4luEFzNgf
        U9Redn5xXpuzwDWh+rCGn+Y=
X-Google-Smtp-Source: ABdhPJzXWYfelP2UlkhJrFFyCyinzaLny15ZuOdnLd3JvnBFfo9xDWUlt3iTnE1a+GsOEMdsc8V+1Q==
X-Received: by 2002:a17:90a:14a5:: with SMTP id k34mr3214646pja.37.1594708512326;
        Mon, 13 Jul 2020 23:35:12 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.8])
        by smtp.gmail.com with ESMTPSA id q29sm16041215pfl.77.2020.07.13.23.35.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 23:35:11 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     sfr@canb.auug.org.au, bcousson@baylibre.com, tony@atomide.com,
        robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4] ARM: dts: Configure osc clock for d_can on am437x
Date:   Tue, 14 Jul 2020 14:35:06 +0800
Message-Id: <1594708507-6794-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

V3 -> V4:
make Fixes tags before Signed-off-by line.
make subject more clear and short.
add driver probe failed log to commit message.

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

