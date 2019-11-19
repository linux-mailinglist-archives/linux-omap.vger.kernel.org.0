Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAA6102D8E
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 21:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKSU3P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 15:29:15 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42874 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfKSU3P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 15:29:15 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJKT7Ew020910;
        Tue, 19 Nov 2019 14:29:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574195348;
        bh=CjwwUdGt0dRh3Te6U6VKQJO2QS6CEUoZSVJL8W1lV3g=;
        h=From:To:CC:Subject:Date;
        b=M8jfla/FZsSXiIU2My0tHZ1Tm97Nug46bKvdG3J5VAmffl0zO0inIViCwajhisPKX
         XUUy263P7U/P2vavlGo3vWUihz36sJdsNFnayA+g/rXUK/SVdr8ATeiAY2AbFkfZYW
         Voar/VHPNhKPgM5791oubl5r2oMt14Bj2zvZ3NHE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJKT7xh060506
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 14:29:07 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 14:29:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 14:29:06 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJKT6aQ057112;
        Tue, 19 Nov 2019 14:29:06 -0600
Received: from localhost (ulb0232989.dhcp.ti.com [128.247.59.95])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xAJKT4u25856;
        Tue, 19 Nov 2019 14:29:04 -0600 (CST)
From:   Caleb Robey <c-robey@ti.com>
To:     <linux-omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Caleb Robey <c-robey@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tom Rini <trini@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] ARM: dts: am5729: beaglebone-ai: enable board
Date:   Tue, 19 Nov 2019 14:28:48 -0600
Message-ID: <20191119202850.18149-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The following patch adds the device tree file for BeagleBone AI
 
Caleb Robey (1):
  ARM: dts: am5729: beaglebone-ai: adding device tree

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/am5729-beagleboneai.dts | 782 ++++++++++++++++++++++
 2 files changed, 783 insertions(+)
 create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts

-- 
2.17.1

