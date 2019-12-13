Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF1711E3FB
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 13:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfLMM4D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 07:56:03 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48430 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLMM4D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 07:56:03 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDCu1bg068876;
        Fri, 13 Dec 2019 06:56:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576241761;
        bh=wmnKS6jYabk3vlTc9456KcJGq16FmdWKiD6XZhCfJzE=;
        h=From:To:CC:Subject:Date;
        b=DaQv4oX4dH7FrBZ1L3Il/pIyBWdK9puLgWqK5PbJinU86SkWiLO/mN00pOS68rv7v
         vcZqcu4ppxwC81W7skZm2/yn+s2L1Kkg/dA4jvFZUzZ0pH5DDlNYWYDelLqxaEl0JV
         z9zBMXXqkJfTNMzPbvJBCuaKczEmck5RdbB7UN4E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBDCu1JN070109
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Dec 2019 06:56:01 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 06:56:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 06:56:00 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDCtwVF127295;
        Fri, 13 Dec 2019 06:55:58 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
Subject: [PATCHv3 00/15] remoteproc: updates for omap remoteproc support
Date:   Fri, 13 Dec 2019 14:55:22 +0200
Message-ID: <20191213125537.11509-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This doesn't have any effective changes compared to v2 [1] of the
series, just rebased on top of 5.5-rc1. If someone is interested, I
have an integrated branch against 5.5-rc1 [2] which contains full OMAP
remoteproc support with all the still pending patches, large portion
of those are already posted in some form or another to the kernel
mailing lists.

-Tero

[1] https://lkml.org/lkml/2019/11/19/1199
[2] https://github.com/t-kristo/linux-pm/tree/5.5-rc1-ipc


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
