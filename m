Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6F62B275
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 12:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfE0Kv3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 06:51:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46270 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfE0Kv3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 May 2019 06:51:29 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RAp5e6003020;
        Mon, 27 May 2019 05:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558954265;
        bh=JrfdFuLps/wHBCl3PPKJylhuDG/GtLNZB8BGn4i9Njw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tigu461trGyiuT0TlRN5C1lHPqzrrZKwO1Tq3bJjFQ1mt/4Eon/wHG+6dGlIwHUsf
         d9tgY3aDjo/X82zi2jn2u4dWgeLIujSPHJueBjAK3yYBVDODRLcc+g6o/VgADzZNlo
         WZE7Z3JUqxs9STSd02lydCJC50MgI7J07cIIOi9M=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RAp5Q1037617
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 May 2019 05:51:05 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 05:51:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 05:51:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RAp2gC087418;
        Mon, 27 May 2019 05:51:02 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
Date:   Mon, 27 May 2019 13:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523200756.25314-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 23/05/2019 23:07, Sebastian Reichel wrote:
> Hi,
> 
> Here is another round of the DSI command mode panel patchset
> integrating the feedback from PATCHv5. The patches are based
> on v5.2-rc1 tag. It does not contain the patches required for
> OMAP3 support (it needs a workaround for a hardware bug) and
> for automatic display rotation. They should get their own series,
> once after everything has been moved to DRM panel API. I think
> DRM panel conversion should happen _after_ this series, since
> otherwise there is a high risk of bricking DSI support completely.
> I already started a WIP branch for converting DSI to the DRM panel
> API on top of this patchset.

Looks good to me. For some reason I can't boot 5.2-rc2 (on x15) so I 
haven't been able to test yet. I'll pick the series up in any case, and 
I'll test it when I get the kernel booting.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
