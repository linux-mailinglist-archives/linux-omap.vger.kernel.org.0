Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A4430648E
	for <lists+linux-omap@lfdr.de>; Wed, 27 Jan 2021 20:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhA0T62 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Jan 2021 14:58:28 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34038 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhA0T5z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Jan 2021 14:57:55 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10RJu31J028751;
        Wed, 27 Jan 2021 13:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611777363;
        bh=qv0+AotchmTZEDjYtGsMUhbEB1NMxoKxiwzceryYbmg=;
        h=From:To:CC:Subject:Date;
        b=qvTw9z7Dw+4LuvH6li80VJMdqlhLL+SUfC8m57lMjIXwMIWIUcvvB6xz9cEAqTGvR
         gaVWZ/afiPUFskKjelG4RDqQHxE9zMguvftKnZx/oN4zwpBtoIMLMyYnXZ7TzAvf+6
         8zDQfvLDHq/ZUbNBNYfd6LqpB7tdtwgJWQyiwYis=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10RJu31D052025
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 Jan 2021 13:56:03 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 Jan 2021 13:56:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 Jan 2021 13:56:02 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10RJu2oS107568;
        Wed, 27 Jan 2021 13:56:02 -0600
Received: from localhost ([10.250.69.64])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 10RJu2vq082095;
        Wed, 27 Jan 2021 13:56:02 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Add Mailbox support for TI K3 AM64x SoCs
Date:   Wed, 27 Jan 2021 13:55:58 -0600
Message-ID: <20210127195600.23501-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jassi,

The following series extends the OMAP Mailbox driver to enable the
Mailbox IP present on the most recent TI K3 AM64x SoCs [1]. AM64x is
a 64-bit system, and the Mailbox IP is a cut-down version of the one
present on previous TI K3 SoCs like AM65x and J721E.

DT nodes will be posted separately once the binding is acked/merged.

regards
Suman

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210120202532.9011-1-d-gerlach@ti.com/

Suman Anna (2):
  dt-bindings: mailbox: omap: Update binding for AM64x SoCs
  mailbox: omap: Add support for K3 AM64x SoCs

 .../bindings/mailbox/omap-mailbox.txt         | 22 +++++++++++++++++++
 drivers/mailbox/omap-mailbox.c                |  6 ++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.29.2

