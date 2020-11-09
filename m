Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D532AB248
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgKIISh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:18:37 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55502 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727920AbgKIISg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:18:36 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A98IKKH040946;
        Mon, 9 Nov 2020 02:18:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604909900;
        bh=gV1BYWshFtiy/uc5LwABIQEEdkgG8l02qDntiHzOkuo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qcI9k3szWJRLYMI2kHwkSDN593ECg/QtQOmQdZXGeE8323jw/sUuTD2ttuY+vnfJv
         if4uVbMVeu3AKmm3RA09BkYASKgcBSWjeo4zuMZPSnUKxGe+55im8pbhAdCn2rjms+
         4PtAZ7KQPodETPy476wj8wovlCMZo28f3jdwV//s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A98IKw1001264
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Nov 2020 02:18:20 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 02:18:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 02:18:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A98IHNj113540;
        Mon, 9 Nov 2020 02:18:18 -0600
Subject: Re: [PATCH v3 09/56] drm/omap: dsi: drop virtual channel logic
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-10-tomi.valkeinen@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <38a4a943-668f-0b81-7fc8-1ae119ee77d9@ti.com>
Date:   Mon, 9 Nov 2020 10:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105120333.947408-10-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/11/2020 14:02, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This drops the virtual channel logic. Afterwards DSI clients
> request their channel number and get the virtual channel with
> the same number or -EBUSY if already in use.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 11 ++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 46 ++++---------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 +-
>  3 files changed, 12 insertions(+), 49 deletions(-)

A comment about this (and other virtual channel logic changes): When Sebastian sent the series in
Feb, I commented that the VC change is not correct. That's still true, and I did not fix it as I'm
not sure how to fix it, and however it is fixed has to be fully inside dsi.c (so it doesn't affect
e.g. the panel drivers).

However, it works just fine. The case where things will break is when we need to use multiple VCs
(OMAP DSI's "configuration blocks", not virtual channel ID numbers). Command mode panels don't need
this. Video mode panels might need it, but it's not quite clear to me if it's strictly needed, or is
it just an optimization.

I hope to get a board with video mode panel soonish, or help Nikolaus to debug this.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
