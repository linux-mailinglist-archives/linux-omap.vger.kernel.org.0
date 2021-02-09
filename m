Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429D6315712
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 20:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbhBITpS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 14:45:18 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38586 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbhBITkJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 14:40:09 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 119Jarfk020980;
        Tue, 9 Feb 2021 13:36:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612899413;
        bh=WEvmW5fPviMFTlXzHzjYc91rOSWFJPJRq44UukhxYc8=;
        h=From:To:CC:Subject:Date;
        b=aY6zkuYxuckyg0u/Hl+bTDWfsqSS3CIvR08GYJ9WzTgJvtAdrY7MR33b3suBo5b9+
         m2oWuPQNWBP+Ah1isPzy6WljxQX6R2Iq8m9wAFJ4PvHkyK+6pc+laMgFoV5x4pcMZA
         oFpp9DnekNC818X3gQ7wCkloCZZY45f2aYJJbmQ4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 119JarNc054717
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Feb 2021 13:36:53 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Feb
 2021 13:36:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Feb 2021 13:36:52 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 119Jaqbm049383;
        Tue, 9 Feb 2021 13:36:52 -0600
Received: from localhost ([10.250.35.110])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 119JaqI2082144;
        Tue, 9 Feb 2021 13:36:52 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/2] Add Mailbox support for TI K3 AM64x SoCs
Date:   Tue, 9 Feb 2021 13:36:41 -0600
Message-ID: <20210209193643.24824-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jassi,

The following is a minor revision of the series [1] that extends the OMAP
Mailbox driver for the IP on TI K3 AM64x SoCs.

Only change is in patch 1 to drop the example in the dt-bindings patch.

regards
Suman

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210127195600.23501-1-s-anna@ti.com/

Suman Anna (2):
  dt-bindings: mailbox: omap: Update binding for AM64x SoCs
  mailbox: omap: Add support for K3 AM64x SoCs

 Documentation/devicetree/bindings/mailbox/omap-mailbox.txt | 4 ++++
 drivers/mailbox/omap-mailbox.c                             | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.29.2

