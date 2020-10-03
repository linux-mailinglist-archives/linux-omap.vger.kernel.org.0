Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF1C28247C
	for <lists+linux-omap@lfdr.de>; Sat,  3 Oct 2020 16:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgJCOQE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 3 Oct 2020 10:16:04 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:11911 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJCOQD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 3 Oct 2020 10:16:03 -0400
X-Greylist: delayed 343 seconds by postgrey-1.27 at vger.kernel.org; Sat, 03 Oct 2020 10:16:02 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601734561;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=M6lddIH2pF90iimfnkaLvYwgs1P3RIWW0+H62eKGhXI=;
        b=aP4/74jcR2C0wbyr7131XeuRSzulnyRcvqtnOvJH+TCzxfQYc9o1X7oA0NQL9bXFte
        5zhvS60KUo7WCiLfQKRnesePWKSYWGS4empQoQ3/kL5XXw0F/jo5ApkYCPkWY3jnLqdU
        QVFIniK5qiKTBNvVQ/pEvYBGNC+NWrrEe9vV/IhWTDCrXCXYYNQEcKLhRYuTndtZgbcw
        rCB4i9ZTs5uUB3iq3hDMIcT7Xz0lDOVgpIJm9d/OpLolCtSm1y8BbN4lOpMdRwt8A0Hw
        7cFzeiaVBGQbfszWb6GOuTK9Lsz+/7byZ4DacgggHOYJe2yexHlXdjTzfS4Jvet3Y9/A
        3QBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDzZw9i90="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
        with ESMTPSA id 3005f6w93EA13C2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 3 Oct 2020 16:10:01 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/2] AMR: DTS: fix and extension for Pandaboard ES
Date:   Sat,  3 Oct 2020 16:09:59 +0200
Message-Id: <cover.1601734200.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* fix wrong pinmux offset preventing the user button from working
* add uart connection for bluetooth wl1271 hci

H. Nikolaus Schaller (2):
  ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard ES
  ARM: dts: pandaboard es: add bluetooth uart for HCI

 arch/arm/boot/dts/omap4-panda-es.dts | 34 +++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

-- 
2.26.2

