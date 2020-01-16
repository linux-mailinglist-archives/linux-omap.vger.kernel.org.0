Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1699A13DC76
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 14:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgAPNx4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 08:53:56 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52496 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgAPNx4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 08:53:56 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GDrti4062384;
        Thu, 16 Jan 2020 07:53:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579182835;
        bh=houlVZXRRLo1Sc+XuyxUossdsTt+aI+Fltes9OD5xW4=;
        h=From:To:CC:Subject:Date;
        b=d4vU60gvAPKM/Ypnw4AOaiZm6MvFP5IKRgbd1+JlIfJXTM4byXe50ESoKk/rw18D6
         qFgpmJv7urA3yhr9qhkZzFR0/9VhRfsBIfyeHMj3H5iCY54Ua9ByAsK6EWuUkaopeI
         Hyw31HFXql7qmWRbLVgxgbSP1IQWH0T7M4JdMxC0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GDrteq091801
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 07:53:55 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 07:53:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 07:53:55 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GDrqdS048732;
        Thu, 16 Jan 2020 07:53:53 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <linux-omap@vger.kernel.org>
Subject: [PATCHv5 00/14] remoteproc: updates for omap remoteproc support
Date:   Thu, 16 Jan 2020 15:53:18 +0200
Message-ID: <20200116135332.7819-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This version addresses review comments received for v4 of the series.
Mostly cosmetic changes, the most important changes here:

- minor dt binding updates and any driver changes induced by this
- reset handling fixes to avoid asserting/deasserting same reset twice,
  this appeared to still produce some timeouts in some cases; this was
  masked earlier but became visible with one error handling fix

All changes are listed under individual patches.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
