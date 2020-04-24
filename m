Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB571B7916
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgDXPNJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41494 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgDXPNI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCwdq044741;
        Fri, 24 Apr 2020 10:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741178;
        bh=3u5jcMxC3VA6Xbom27idPrTVtW3bDxHIo8/U0ctHM5M=;
        h=From:To:CC:Subject:Date;
        b=EhutGT++NxfVz0U0PDYovaPMXgdBlNgG9voz/S0eAUk6yQoPcb6j0Pu7wuj8N4168
         lhsERLk+AhwW48QhMtp9nKOHFHnOITll6qQWOj/JmPic5rISXzlbZRrRKlCOCq+5pb
         V9GvTmfyOkAQwgninfhBiiN79yMJSXDLcN2uijjs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFCwIm091540
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:12:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:12:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:12:58 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu78122378;
        Fri, 24 Apr 2020 10:12:57 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 00/17] ARM: dts: dra7/am57xx: remoteproc support
Date:   Fri, 24 Apr 2020 18:12:27 +0300
Message-ID: <20200424151244.3225-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

This series adds the DT nodes necessary for remoteproc support, now that
the driver side changes are (mostly) in. Couple of things to note
though.

1) There is a new IOMMU issue, for which I posted a fix today [1]
2) The remoteproc core still has an issue for which there is ongoing
   discussion [2]

With these two issue taken care of, the omap remoteproc support is
functional. The question though is, whether we should just wait until
the above two issues are resolved and merge the DT patches post that, or
merge the DT patches with status = "disabled".

There aren't any boot failures without the mentioned two issues though,
as one needs to enable the RPMSG_VIRTIO support before the failures
really kick in (issue [2]), and this config is not enabled for OMAPs
yet. Also, multi-v7 config doesn't seem to enable omap remoteproc,
so that is safe also.

Another thing I was considering myself was to squash all the board
specific reserved-memory region patches into the
dra7-ipu-dsp-common.dtsi files. However Suman wants to have these
separate and as he is the actual author for these, I posted them in this
form. But anyway, just so you know it would be possible to merge them
together.

-Tero

[1] https://lore.kernel.org/linux-iommu/20200424145828.3159-1-t-kristo@ti.com/T/#u
[2] https://lkml.org/lkml/2020/4/20/1094



--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
