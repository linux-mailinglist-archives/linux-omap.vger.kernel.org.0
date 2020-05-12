Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162D91CF628
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 15:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgELNvO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 09:51:14 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33926 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgELNvN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 09:51:13 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04CDpAOj085255;
        Tue, 12 May 2020 08:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589291471;
        bh=kP7p2udPs8yOE4gXyX2ZtUgV2UoVuhXvsL9m5Cjw0ps=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=e4ZjHqlewHQN0FJQ/2qPeZg7UliGEZo3sCBquZFhlbzqTGrkasAodL7T1qT14bH+x
         p10xSbrOspu/k7ooU7IZy0Sb6XsircDJ1ZqLEPf6HGkH5h4yjB3DbBXxoNtrubwcS2
         2H4JLZYAXfWYgSXFEEy+KB4Fjra8Nec0umNbArTQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04CDpAO3005921
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 May 2020 08:51:10 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 May 2020 08:51:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 May 2020 08:51:10 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04CDpAsX098266;
        Tue, 12 May 2020 08:51:10 -0500
Subject: Re: BBB with v5.7-rc5
To:     Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@kernel.org>
CC:     <linux-omap@vger.kernel.org>
References: <87k11h4df0.fsf@kernel.org> <87eerp46h5.fsf@kernel.org>
 <20200512134648.GD37466@atomide.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <586c35cf-80f1-6922-a46b-a6fce312e83c@ti.com>
Date:   Tue, 12 May 2020 08:41:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512134648.GD37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Felipe

On 5/12/20 8:46 AM, Tony Lindgren wrote:
> Hi,
>
> * Felipe Balbi <balbi@kernel.org> [200512 13:41]:
>> Hi,
>>
>> Felipe Balbi <balbi@kernel.org> writes:
>>> what's the trick to get BBB to boot recent kernels nowadays? :-p
>>>
>>> I'm using omap2plus_defconfig without CPSW (doesn't link otherwise) with
>>> GCC 10.1.0 (I'll try an older version shortly). Cmdline is the usual
>> same result with 9.2. Nothing from low level debug either.
> Maybe check you have a current dtb file? The older dtb files may not
> have all the needed data.

I have been using the latest uBoot, DTBs and kernel with no issue 
(except CPSW).

I have booted the BBB and a BBG.  9.2 gcc compiler

> Also you probably want to add "earlycon" to your your kernel cmdline
> and then you have early output from CONFIG_SERIAL_EARLYCON=y as long
> as there's a chosen entry for the device uart. So no need to enable
> DEBUG_LL in most cases.
>
> There's "[PATCH net v4] net: ethernet: ti: Remove TI_CPTS_MOD workaround"
> being discussed too for the cpsw regression.

This is a build dependency issue.

Dan

> Regards,
>
> Tony
>
>
>
