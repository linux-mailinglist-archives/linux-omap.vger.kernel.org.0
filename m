Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B176CFC25
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 16:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfJHOQk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 10:16:40 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53740 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfJHOQj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 10:16:39 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98EGWkv015878;
        Tue, 8 Oct 2019 09:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570544192;
        bh=jnDC12FV0Qb10eo+2ndFqRjIxX3wyikNU0NY3OYJzUM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xGFLkVv3oYhPfiKxF1O0lxJcJ4qIiE5Le14OGFcAQ35oiST5ED3a4aWHShapz8WpH
         9dh9Mj7UXzqsA0IG+BltEsMYje9eB4QgpcOIvDdzLMjyMzX1A8OmG8lLotG141FVGM
         rYfSvmQV7y/fKHPI7WKwCXRXwfEsgv4/8dO6+ZAM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98EGWBR001869
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 09:16:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 09:16:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 09:16:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98EGUrO083939;
        Tue, 8 Oct 2019 09:16:31 -0500
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
To:     Tony Lindgren <tony@atomide.com>
CC:     <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, <linux-omap@vger.kernel.org>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
Date:   Tue, 8 Oct 2019 17:16:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008141335.GB5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/10/2019 17:13, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [190930 10:38]:
>> If use_mclk is false, mclk_mode is written to a register without
>> initialization. This doesn't cause any ill effects as the written value
>> is not used when use_mclk is false.
>>
>> To fix this, write use_mclk only when use_mclk is true.
> 
> Hey nice catch. Based on a quick test looks like this fixes an
> issue where power consumption stays higher after using HDMI.
> 
> Would be nice to have merged in the v5.4-rc series:
> 
> Tested-by: Tony Lindgren <tony@atomide.com>

Really? Ok, well, then it was a good random find =).

I did already push this to drm-misc-next, as I thought it does not have 
any real effect. I'll check if it's ok to push to drm-misc-fixes too, 
with Cc stable.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
