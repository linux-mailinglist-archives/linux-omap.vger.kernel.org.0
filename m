Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0D284BEE
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 14:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfHGMqg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 08:46:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35744 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729516AbfHGMqg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 08:46:36 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77CkX7f098472;
        Wed, 7 Aug 2019 07:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565181993;
        bh=T2NLXl4CslQEUO/eANLbzUL5EXeCfl0xC5KDxql7wMY=;
        h=From:To:CC:Subject:Date;
        b=buNB37VrWtcIdmnB9+r6xtWQS/Fc3fxbPDZDOv2E9VVp1LBhmO+azskp0gi9hpm00
         33XTIixumoTuBVQuT3wzCAQPoAluNI50FpKcwpyFGzfPPgdIVB1XpdOhuV+V1ZVMep
         i3l63jTREMMQHqqLDuSXGjdDmn+G8OQTTd4XArGY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77CkXX0018205
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 07:46:33 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 07:46:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 07:46:33 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77CkVoH016945;
        Wed, 7 Aug 2019 07:46:31 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] bus: ti-sysc: fixes for reset handling
Date:   Wed, 7 Aug 2019 15:46:02 +0300
Message-ID: <1565181965-21039-1-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are a few patches to fix reset handling for ti-sysc bus driver.
Without these, the iommu won't be working properly at least.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
