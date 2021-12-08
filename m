Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A13B46DC90
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 20:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbhLHUC5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 15:02:57 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:43452 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhLHUC4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Dec 2021 15:02:56 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 6A75F205E469
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 09/10] usb: host: ohci-omap: fix deferred probing
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
CC:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        <linux-omap@vger.kernel.org>
References: <20211208192118.7483-1-s.shtylyov@omp.ru>
 <20211208192118.7483-10-s.shtylyov@omp.ru>
 <20211208195346.GC799423@darkstar.musicnaut.iki.fi>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5b6cfb61-96b2-ddb7-795c-1a96119a2a35@omp.ru>
Date:   Wed, 8 Dec 2021 22:59:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211208195346.GC799423@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello!

On 12/8/21 10:53 PM, Aaro Koskinen wrote:

>> The driver overrides the error codes returned by platform_get_irq() to
>> -ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
>> will fail the probe permanently instead of the deferred probing. Switch to
>> propagating the error codes upstream.
>>
>> Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")
> 
> I don't see how this Fixes commit is related to OHCI OMAP?

   Argh, I missed this! :-(
   The whole series should be discarded, as the patch #8 also doesn't have the valid
Fixes: tag, and I missed to add Alan's ACKs to patches #4..#9 too... :-/

> A.
> 
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
[...]

MBR, Sergey
