Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54DE29F4B3
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 20:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgJ2TQi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Oct 2020 15:16:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59536 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgJ2TPa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Oct 2020 15:15:30 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TJFElL088264;
        Thu, 29 Oct 2020 14:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603998914;
        bh=psiVt0E0BhC31HGGgKWZZk8gPO9MIzP9aruuOcAe1zM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=h/W8bHFYdAnE8BjCM/yy9n2G4A7iGS90bsiadpPbBmckF//PW6b098mqZUhTzIGmp
         PE2i0loABKbhIesnpzy/TSa8pj7OygUzn49vfzmUy3CogSBVIeNau1tUYaGALLS4Ms
         1V/2qRmkL8dsDXq0JnfLN5+A46STs7QD1TVaXdpI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TJFElK127848
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Oct 2020 14:15:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 14:15:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 14:15:14 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TJFBVf032852;
        Thu, 29 Oct 2020 14:15:12 -0500
Subject: Re: [PATCH] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
To:     Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Russell King <linux@armlinux.org.uk>
References: <20201001202725.16034-1-grygorii.strashko@ti.com>
 <20201002125000.5b5kho4e5de7jjrj@akan>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <bb6e0bd9-a8fe-f63b-14fd-92a1f8cea0bb@ti.com>
Date:   Thu, 29 Oct 2020 21:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002125000.5b5kho4e5de7jjrj@akan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

On 02/10/2020 15:50, Nishanth Menon wrote:
> On 23:27-20201001, Grygorii Strashko wrote:
>> Enable networking options required for NFS boot on TI platforms, which is
>> widely for automated test systems.
>> - enable new TI CPSW switch driver and related NET_SWITCHDEV config
>> - enable TI DP83867 phy
>> - explicitly enable PTP clock support to ensure dependent networking
>> drivers will stay built-in
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>   arch/arm/configs/multi_v7_defconfig | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
> 
> [...]
> 
> Reviewed-by: Nishanth Menon <nm@ti.com>
> 

Are there any actions need to be done to have this patch merged?

-- 
Best regards,
grygorii
