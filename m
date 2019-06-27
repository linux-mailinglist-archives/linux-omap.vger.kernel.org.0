Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA345857C
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2019 17:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbfF0PY3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jun 2019 11:24:29 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58682 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfF0PY3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Jun 2019 11:24:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RFOMTb080093;
        Thu, 27 Jun 2019 10:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561649062;
        bh=K+/sisfJQK0iMTmxIZ08y2H69XPOMZf85Fc5VJrJl4k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=D6ahYR8N0/WKOucNT5bs+QSPWv64AtntsLnp5fPj/E4hvny/i/YJq5WjZfb+zlXMt
         b21znpuqY8rT8+cwS+btrffCVxVJBlbQQ7t7auONHLSwnBNITOhL2l6kBIwLIn6DSY
         YOyf+Uqz8MKLTliR25whKexwpvgA9+RGMIfzprfs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RFOMbj007398
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Jun 2019 10:24:22 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 27
 Jun 2019 10:24:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 27 Jun 2019 10:24:22 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RFOMct103718;
        Thu, 27 Jun 2019 10:24:22 -0500
Subject: Re: [PATCH 5/5] bus: ti-sysc: Simplify cleanup upon failures in
 sysc_probe()
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190625233315.22301-1-s-anna@ti.com>
 <20190625233315.22301-6-s-anna@ti.com> <20190627121158.GJ5447@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <d1a5c892-abc1-8978-67ee-92c4ecb3622a@ti.com>
Date:   Thu, 27 Jun 2019 10:24:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190627121158.GJ5447@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 6/27/19 7:11 AM, Tony Lindgren wrote:
> Hi,
> 
> * Suman Anna <s-anna@ti.com> [190625 23:33]:
>> The clocks are not yet parsed and prepared until after a successful
>> sysc_get_clocks(), so there is no need to unprepare the clocks upon
>> any failure of any of the prior functions in sysc_probe(). The current
>> code path would have been a no-op because of the clock validity checks
>> within sysc_unprepare(), but let's just simplify the cleanup path by
>> returning the error directly.
>>
>> While at this, also fix the cleanup path for a sysc_init_resets()
>> failure which is executed after the clocks are prepared.
> 
> Sounds like this should get queued separately as a fix for v5.3-rc
> cycle, probably got broken with the recent ti-sysc init order changes.

Yeah, this patch does not depend on the previous 4 patches, so can be
picked up independently for v5.3-rc as well.

regards
Suman
