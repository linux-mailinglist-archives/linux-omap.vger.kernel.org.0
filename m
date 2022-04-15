Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3270B502ACB
	for <lists+linux-omap@lfdr.de>; Fri, 15 Apr 2022 15:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiDONJV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Apr 2022 09:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiDONJU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Apr 2022 09:09:20 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E530F5130A
        for <linux-omap@vger.kernel.org>; Fri, 15 Apr 2022 06:06:48 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23FD6VGD051337;
        Fri, 15 Apr 2022 08:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1650027992;
        bh=Ve5xYqL0vSew6zIe9aVuRNUvwNXQm0EYwplrOk14rUc=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=vyVbrHcPYrc7p31oFsSy1C9miGI/Bzk/0QeWtYKd3cqMEZLncyZPk1vJbW1DdCVLU
         jy+u8aakdjX/sFLkrHHyF/vk9iO6VXf734/BKWlf5WbRymLKKXMrySVJWMYMEIz5rL
         zEW1xqWfF4JyOuQiFzj9OEDqMOEIvAPK9muaJORo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23FD6VGK128449
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Apr 2022 08:06:31 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 15
 Apr 2022 08:06:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 15 Apr 2022 08:06:31 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23FD6SkE028604;
        Fri, 15 Apr 2022 08:06:28 -0500
Message-ID: <5d8ba4e2-a281-5d0f-d65f-bb0121165b73@ti.com>
Date:   Fri, 15 Apr 2022 16:06:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Content-Language: en-US
To:     Romain Naour <romain.naour@smile.fr>,
        Roger Quadros <rogerq@kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <miquel.raynal@bootlin.com>,
        <tony@atomide.com>
CC:     <robh@kernel.org>, <kishon@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
 <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 15/04/2022 11:59, Romain Naour wrote:
> Hello,
> 
> Le 21/12/2021 à 14:17, Roger Quadros a écrit :
>> Hi,
>>
>> TI's AM64 SoC contains one GPMC module. Add driver support for it.
> 
> What's the status of the GPMC interface on K3 architecture, especially for AM65,
> AM62 and other Jacinto 7 CPU devices ?
> 
> TI currently don't recommend to use it for now even if there are still some GPMC
> use case with FPGA devices:
> 
> https://e2e.ti.com/support/processors-group/processors/f/processors-forum/994191/am6442-am64x-gpmc-support
> 
> This patch series add omap-gpmc support for AM64 Soc but as of kernel 5.18-rc2,
> there is no devicetree using ti,am64-gpmc.
> 
> This patch seems missing (at least):
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=55c102a75d399896c7396229cd687bf97afb5cf6

It's not how LKML development process works - driver changes has to be sent first
and then DT changes  as they accepted by different maintainers and through different trees.

> 
> Thanks!
> 
> Best regards,
> Romain
> 
>>
>> cheers,
>> -roger
>>
>> Changelog:
>> v4
>> - move compatible match table to header file so it can be used by
>> GPMC driver even when NAND driver is not enabled or as a module.
>> GPMC driver is always enabled as built-in.
>> - Select OMAP_GPMC driver from MTD_NAND_OMAP2 driver config as
>> OMAP_GPMC is not essential for ARCH_K3 boot.
>>
>> v3
>> - use compatible match table for checking for NAND controller node in
>> GPMC driver.
>>
>> v2
>> - update DT binding doc to make reg-names and power-domains property
>> required only for specific SoC.
>>
>> Roger Quadros (4):
>>    dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
>>    memory: omap-gpmc: Add support for GPMC on AM64 SoC
>>    memory: omap-gpmc: Use a compatible match table when checking for NAND
>>      controller
>>    mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3
>>
>>   .../bindings/memory-controllers/ti,gpmc.yaml  | 23 +++++++++-
>>   drivers/memory/omap-gpmc.c                    | 46 ++++++++++++++-----
>>   drivers/mtd/nand/raw/Kconfig                  |  1 +
>>   drivers/mtd/nand/raw/omap2.c                  |  5 +-
>>   include/linux/platform_data/mtd-nand-omap2.h  |  9 +++-
>>   5 files changed, 67 insertions(+), 17 deletions(-)
>>
> 

-- 
Best regards,
Grygorii, Ukraine
