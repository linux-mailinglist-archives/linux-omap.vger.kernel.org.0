Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDDA1B3968
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 09:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgDVHvw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 03:51:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49126 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgDVHvv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Apr 2020 03:51:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03M7pfor015094;
        Wed, 22 Apr 2020 02:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587541901;
        bh=0qzb9XgHtudnkz7lbBkw74ucY2oykHyzy4LTQbWvHpo=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=nCoWE6HZ8H6O8qQSDyrOT5zJ43L9Tou4oaazp47n6Ijl1WMWmLKQkThw4ZGe6hmrz
         JONjFjKyNkmERBzhWLAlHwhztGs5vQQbpSP7ClZpH561dv1OQJerSC/JZKewr1gubZ
         /QyT7Ym9vY1W7HPuYye+f1ZCqhA+fK19NHquAsMY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M7pfAU086881;
        Wed, 22 Apr 2020 02:51:41 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Apr 2020 02:51:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Apr 2020 02:51:40 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M7pcH4025597;
        Wed, 22 Apr 2020 02:51:38 -0500
Subject: Re: [PATCH] omapfb/dss: fix comparison to bool warning
To:     Jason Yan <yanaijie@huawei.com>, <b.zolnierkie@samsung.com>,
        <afd@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20200422071903.637-1-yanaijie@huawei.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fecc5f43-d1a2-f29f-da3a-79c297bff462@ti.com>
Date:   Wed, 22 Apr 2020 10:51:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422071903.637-1-yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/04/2020 10:19, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:461:15-32: WARNING:
> Comparison to bool
> drivers/video/fbdev/omap2/omapfb/dss/dispc.c:891:5-35: WARNING:
> Comparison of 0/1 to bool variable
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 4 +---
>   2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
