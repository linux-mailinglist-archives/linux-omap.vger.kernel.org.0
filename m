Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2083030C2
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 01:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732238AbhAZABy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jan 2021 19:01:54 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57916 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732633AbhAYX6r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 18:58:47 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10PNv55x122241;
        Mon, 25 Jan 2021 17:57:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611619025;
        bh=ihr9DKYldcHIliHzENLCBXu8ilCX6+CT5/SvXOqjD/Y=;
        h=From:To:CC:Subject:Date;
        b=pfmP7WnjszOhA9THPpLyAxjy53PnSSWXKOfRWBDAgS0ogElva+6hJ/6GDyT0d7oJe
         5jZEXo8lUMVnZwHNh5XDVTdEvkDM2C6eFUqHRHn+XczBEgvM7bAjbxnGwJppDdWzXa
         nMDmPEmqrN95yoGdTYBIRWGzKnZqZ/mrE+lr0NSI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10PNv5BX088196
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Jan 2021 17:57:05 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 17:57:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 17:57:04 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10PNv434035608;
        Mon, 25 Jan 2021 17:57:04 -0600
Received: from localhost ([10.250.35.71])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 10PNv3vo117156;
        Mon, 25 Jan 2021 17:57:04 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Add HwSpinlock support for TI K3 AM64x SoCs
Date:   Mon, 25 Jan 2021 17:56:51 -0600
Message-ID: <20210125235653.24385-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Bjorn,

The following series extends the OMAP HwSpinlock driver to enable the
HwSpinlock IP present on the most recent TI K3 AM64x SoCs [1]. I will
post the DT nodes once the binding is acked and merged.

regards
Suman

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210120202532.9011-1-d-gerlach@ti.com/

Suman Anna (2):
  dt-bindings: hwlock: Update OMAP HwSpinlock binding for AM64x SoCs
  hwspinlock: omap: Add support for K3 AM64x SoCs

 .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 26 +++++++++++++++++++
 drivers/hwspinlock/omap_hwspinlock.c          |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.29.2

