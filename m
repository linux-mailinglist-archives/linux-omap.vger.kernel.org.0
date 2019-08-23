Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C849A997
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2019 10:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbfHWIEb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 04:04:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45630 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731370AbfHWIEa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Aug 2019 04:04:30 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7N84Hsn127010;
        Fri, 23 Aug 2019 03:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566547457;
        bh=Q5tcG2om7OB0TnkdUup59lJ6tgZhUw6VzAk7+8LXn04=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YzSGHC8uJCQLyQlMIp4AADoxJkE4kdbk4lHCRSACKzdAeh2sZx8A6kOwvOwKGA4ri
         MPvkPYtZEkoXwNhykYRGjcbLAoh3Siv1asf57mAhG0NmF0MwU4iS1UoXvM3KOYQhJF
         5tZCv8dgefkqf1MfyKC2Js+F6O34SRM7+fnr1PzA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7N84HPc079882
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Aug 2019 03:04:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 23
 Aug 2019 03:04:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 23 Aug 2019 03:04:16 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7N84Eb1090080;
        Fri, 23 Aug 2019 03:04:15 -0500
Subject: Re: [PATCH] drm/omap: Fix port lookup for SDI output
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
 <20190821183226.13784-1-laurent.pinchart@ideasonboard.com>
 <20190821202627.GD30291@darkstar.musicnaut.iki.fi>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <45a226f3-7a31-2109-8f01-1628b3d61654@ti.com>
Date:   Fri, 23 Aug 2019 11:04:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821202627.GD30291@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/08/2019 23:26, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Aug 21, 2019 at 09:32:26PM +0300, Laurent Pinchart wrote:
>> When refactoring port lookup for DSS outputs, commit d17eb4537a7e
>> ("drm/omap: Factor out common init/cleanup code for output devices")
>> incorrectly hardcoded usage of DT port 0. This breaks operation for SDI
>> (which uses the DT port 1) and DPI outputs other than DPI0 (which are
>> not used in mainline DT sources).
>>
>> Fix this by using the port number from the output omap_dss_device
>> of_ports field.
>>
>> Fixes: d17eb4537a7e ("drm/omap: Factor out common init/cleanup code for output devices")
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> 
> Thanks, this fixes the display issue on N900.

Thanks, pushed to drm-misc-fixes.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
