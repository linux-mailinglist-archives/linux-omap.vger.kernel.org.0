Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF38CE1B4
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 14:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbfJGM3q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 08:29:46 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47978 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfJGM3q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 08:29:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CTaMa092213;
        Mon, 7 Oct 2019 07:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451376;
        bh=EKPQGZJtcp0oWSNo23JzQvp0rg1lGwZKndwkOQ5nfFY=;
        h=From:To:CC:Subject:Date;
        b=Giz5aNLe5i0GWwdOzvW4QxrqkXI/6LprSYRtKiJ7cXMmp3y++JGq6le48qKw17L2g
         pVfdcfdUD/yKihRKw+fUEtxE1ExRuEJtg5X+ER67VMp8T3Ts1k46sCL/j8uE7Lfibp
         z1udQY9MtglxvaUZX91xdhOWzrldciPSd0gpR/Cc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CTa6n066816
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:29:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:29:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:29:33 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CTYe5066760;
        Mon, 7 Oct 2019 07:29:34 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/3] bus: ti-sysc: fix reset sequencing
Date:   Mon, 7 Oct 2019 15:29:28 +0300
Message-ID: <20191007122931.18668-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

These three patches make sure that IOMMU/remoteprocs work across
all devices with the latest OMAP PRM series for reset support [1].
The last dangling issues were caused by the removal of the hardlink
between the reset + clock drivers.

-Tero

[1] https://patchwork.kernel.org/cover/11142871/


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
