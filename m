Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43F93102763
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 15:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfKSOyD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 09:54:03 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44344 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKSOyD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 09:54:03 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJErp3i090121;
        Tue, 19 Nov 2019 08:53:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574175231;
        bh=pFAdUqZPr58xWVCR6+pIGTZ+S0Xmfh873qkjFZpwL5Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lNOP6StDUqrqjMQPgW8RK/XQVwTaAZ4Z4ls0/bhehSqG/l7k92VzhgPYL/a9qL+1u
         N9SbM2u4xKFxZWODLM/TVAYeQ650nXRzp0qDMKFBJqyULu/XmSS7xJhPYUJbFAoq5d
         AEMOeDDh9cCnltPEgB5jqfcS/dKncCw9Yq1JlOlw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJEroLd030115
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 08:53:50 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 08:53:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:53:50 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJErm08081520;
        Tue, 19 Nov 2019 08:53:48 -0600
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
To:     Tony Lindgren <tony@atomide.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
Date:   Tue, 19 Nov 2019 16:53:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119143243.GH35479@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/11/2019 16:32, Tony Lindgren wrote:

>> We haven't had omap_gem_op_finish() in the kernel for some years now...
>>
>> Shouldn't a normal page flip, or if doing single-buffering, using the
>> dirtyfb ioctl, do the job?
> 
> It does not seem to happen with the old pvr-omap4 related patches
> and whatever gles related tests at least. If you have some idea
> where it should get called I can take a look at some point.

The userspace apps need to do this. If they're using single-buffering, 
then using the dirtyfb ioctl should do the trick, after the SGX has 
finished drawing.

It's probably somewhat difficult if EGL is controlling the display, as, 
afaik, SGX EGL is closed source, and that's probably where it should be 
done.

But adding back the hacky omap gem sync stuff, and then somehow guessing 
from the sync finish that some display needs to be updated... It just 
does not sound right to me.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
