Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF8FC298FD
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 15:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391560AbfEXNfV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 09:35:21 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55740 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391470AbfEXNfV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 09:35:21 -0400
X-Greylist: delayed 915 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 May 2019 09:35:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1558704004; x=1561296004;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jPoVpk+zVTSpotGP0l1Y3MACc9eibOInf/vk2LwICuI=;
        b=cXsXs5d5sAmEN1AZWOspozi92wtU91/ZI3MCQKlbkaSLpz5wDaTONahH1X2+d1dI
        NKCP9xp49uABt1VKiVAg5BDJyC7jR5N15aBYplfMbkthZRKZC8KFQ1v3f4+72tBv
        9A8ByArkuQFRejWHo2udnOqcZSKx82L3Ft+E7DMmOJY=;
X-AuditID: c39127d2-6d5ff70000000df6-b9-5ce7ef84550b
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 0A.81.03574.48FE7EC5; Fri, 24 May 2019 15:20:04 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.21.122])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2019052415200349-20932 ;
          Fri, 24 May 2019 15:20:03 +0200 
From:   Teresa Remmet <t.remmet@phytec.de>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 0/7] AM335x Phytec boards update
Date:   Fri, 24 May 2019 15:19:56 +0200
Message-Id: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:03,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:03,
        Serialize complete at 24.05.2019 15:20:03
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42JZI8DApdvy/nmMwelNTBZ35v9ltZh/5Byr
        xabH11gtZi/pZ7FYev0ik0Xr3iPsFvuveDmwe6yZt4bR49vXSSwe72+0sntsWtXJ5rF5Sb3H
        501yAWxRXDYpqTmZZalF+nYJXBmP33cxFfznqph4ci5LA+Myji5GTg4JAROJn/8fsXcxcnEI
        CexglGjoXMcM4VxglDi3vIEdpIpNQEPi6YrTTF2MHBwiAgkSt14KgdQwC5xhlLjbv4wNpEZY
        wEBi3kOIehYBVYn3vx4xg9i8As4Si6b2MUNsk5O4ea4TbIGEQCOTxPbnp6ASQhKnF59lnsDI
        s4CRYRWjUG5mcnZqUWa2XkFGZUlqsl5K6iZGYAAdnqh+aQdj3xyPQ4wCHIxKPLwJl5/HCLEm
        lhVX5h5ilOBgVhLhjd3/LEaINyWxsiq1KD++qDQntfgQozQHi5I47wbekjAhgfTEktTs1NSC
        1CKYLBMHp1QD476rbaVrtxd8/GZxsOfICq53yUt8/zM71sSemjVvG3P9opiesL3+xwV5zt7s
        m8MlYBCwpL7r6YcvD82axEqK2KpD18UvWNQb9GrhYqfoq7oTJjaVT95feyt1p9W6kBKpf3MZ
        gm/sPCSbd3ljjOLO67m1qWEJsRvbvLmleJZPcbiwbEq1/MR3qkosxRmJhlrMRcWJAHaLO4oc
        AgAA
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

this series adds basic support for phyCORE-AM335x EMMC and
adds device tree for phyBOARD-REGOR AM335x. Also fixes issues
like removing outdated eth phy delay settings and mmc cd active level.

Teresa

Daniel Schultz (1):
  ARM: dts: am335x-phycore-som: Add emmc node

Teresa Remmet (6):
  ARM: dts: am335x phytec boards: Fix cd-gpios active level
  ARM: dts: am335x phytec boards: Remove regulator node
  ARM: dts: am335x-phycore-som: Enable gpmc node in dts files
  ARM: dts: am335x-pcm-953: Update user led names
  ARM: dts: am335x-pcm-953: Remove eth phy delay
  ARM: dts: Add support for phyBOARD-REGOR-AM335x

 .../devicetree/bindings/arm/omap/omap.txt          |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/am335x-pcm-953.dtsi              |  24 +--
 arch/arm/boot/dts/am335x-phycore-rdk.dts           |   4 +
 arch/arm/boot/dts/am335x-phycore-som.dtsi          |  47 +++--
 arch/arm/boot/dts/am335x-regor-rdk.dts             |  24 +++
 arch/arm/boot/dts/am335x-regor.dtsi                | 223 +++++++++++++++++++++
 arch/arm/boot/dts/am335x-wega-rdk.dts              |   4 +
 arch/arm/boot/dts/am335x-wega.dtsi                 |  18 +-
 9 files changed, 304 insertions(+), 44 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-regor-rdk.dts
 create mode 100644 arch/arm/boot/dts/am335x-regor.dtsi

-- 
2.7.4

