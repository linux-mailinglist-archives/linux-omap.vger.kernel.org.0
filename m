Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E72621E640
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 05:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgGNDXY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 23:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgGNDXX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jul 2020 23:23:23 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A503DC061755;
        Mon, 13 Jul 2020 20:23:23 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m16so5229092pls.5;
        Mon, 13 Jul 2020 20:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YWQJzWH+gl46WiLscaXTLY0/2M+EO9iKxUBet37ceAQ=;
        b=WI2hBUaLYTerpCeS8tqMzF+16qv4wXCy2TI5+0YiTjb+Us04jm4q9MyUKn7LbBWFHJ
         OZ0+tZHneLn3sA32Y3PBvXyLZbxO+TK/0fwivKUJaZiULJxWMWPL36rltCsyJeblLpf+
         8+QrDeCjtbiUpyuOtYS63MOO0KNS+1PAXP/61RVuNPY2jik7R58QqbIzLZb9qvaa6/eQ
         M3V5zlFF8iKz5byI+d9fYOuaI8oCwnwXGMInp6taXS4F/fX7u8bSjI29VexsV9tluxq+
         MV285ofOp+IQ1K9ZaEcodVFFqdjrXo7s/WPdlzJP0sos9Rwc4USVMPkA1HQVOy2tTMJ/
         +ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YWQJzWH+gl46WiLscaXTLY0/2M+EO9iKxUBet37ceAQ=;
        b=Bun3ptGnUgpsmiLZ+eRN9ZW5eRGhyW3OvMpxzVrGTKfVNGhD0uwH52mteeEmMTOUUF
         Vd0Q8Ym3vVhm10aRnQbmwzTNv2RNYvRIJOuRYmWM8PngC8b/qYp5Dhvkq8YlxDEmofFm
         khE9ZeE7aCLCbm+VKb/AUL/QVmTNFpUMGSwrGsoJEoG3yTu+YgnkLqlyE4lV0FU/dr42
         zUCymKZ0JIDd/4WwOGo3gwxWG2/GOClMwduS4BmQ+PwuVXSgimhQvpcp4Qk9kKWEc98X
         kpxlQovEdkR6rRM95LOCdqH3s/d/J0tjvfFODe8FGo5cQYrQ5nr9VR4vj7ezjNMePTy1
         HW+w==
X-Gm-Message-State: AOAM533ea3JVgeZ5RK0GCI73rmdYRgXvO2npldlGIQGEGDtGOLPbXxXs
        rDJGzmvGg4mY21HOLI+ruhs=
X-Google-Smtp-Source: ABdhPJzL1iUK7dp2We0Kt41/crhg9LMXqZwuDkr52uDUuAYCJ89tTBiwwRdJpz0gjEgM8du4OKYxWA==
X-Received: by 2002:a17:90a:ab96:: with SMTP id n22mr2508888pjq.52.1594697003130;
        Mon, 13 Jul 2020 20:23:23 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.8])
        by smtp.gmail.com with ESMTPSA id c139sm15243184pfb.65.2020.07.13.20.23.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 20:23:22 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     sfr@canb.auug.org.au, bcousson@baylibre.com, tony@atomide.com,
        robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v2] ARM: dts: Configure osc clock for d_can on am437x
Date:   Tue, 14 Jul 2020 11:23:17 +0800
Message-Id: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

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

