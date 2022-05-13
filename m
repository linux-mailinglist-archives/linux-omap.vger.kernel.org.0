Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B490A525E20
	for <lists+linux-omap@lfdr.de>; Fri, 13 May 2022 11:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378552AbiEMItl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 May 2022 04:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378554AbiEMItk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 May 2022 04:49:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C87B2B032B
        for <linux-omap@vger.kernel.org>; Fri, 13 May 2022 01:49:38 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e29so839884wrc.11
        for <linux-omap@vger.kernel.org>; Fri, 13 May 2022 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hBkxAbKDqNhxMFslE8xDJ6YeUuh818TRTss1RROwWhI=;
        b=gG5O0vlQU4LazHn1JxDIXSb+aQcbB8CF7LVlmQUNOYeK58+wogRDBc6H9bYLMBnj5B
         HVQQBGJYa71KT2xaBt72zW70qvnPEkDJXbBIiGsVPfwXCrY1DgHVsUd7lihpqIsE5Fbg
         tL0AOdv/Uic/vy4MSwqhifLsE9TKySCHrWYgXeEr+GH/ipwkNDLwGdJmvM0SiEBOQZII
         63rbT+YKKIF5tEB1fVeJFBexDQX0As1r7t0RO+5dPdztAGwv0J1wTiGKWL103A1b37js
         PIrDlGXC1W0dDYmCiHAIC00bjgZgi8Yt/1sLfmlgEKuj30RpjKNJfXR/MW+M7Cy5Rtr9
         gHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hBkxAbKDqNhxMFslE8xDJ6YeUuh818TRTss1RROwWhI=;
        b=UMRJlj0rZYaUJW6KjR6ps5889biJovg3uguy3NA+yffF/iS8cqhvu5L2tqg50QaLoS
         CtanpW4g7q4ncXUmriaVuF9SZenVj2NjUQPTHpPlcbZ+MhL5MAv4gRz/ctse+ulrap9Q
         Kjue4NU2M5zBZPinSDztHaB7/tXQwCgunl1LG3R2CeucXQTbO/PBOKY+0dC+8Rd6brLd
         YzOXlLvKtyxRKH2gc0gcP8g/r3lJLrh6ensqWpGN0Om5/vY3T46nB2AbK+w5IPj0rs9/
         bgKPNOsk0kmjjLOKs911LAPhkk2J+o8pqefhFnqrwUKyeEqXzJCZkV6UbrhUxFBiRlih
         3H+A==
X-Gm-Message-State: AOAM530/SvWKI/huKDOkirtrfcHPAZC03erzo3QWe2c+TL35V+HdRXyR
        XG49aVCBkdPwm6NQW2CpM4Et0g==
X-Google-Smtp-Source: ABdhPJxqSbr3xhTXHEwWrP1jSAQtKxqx6rwCEXcw+TPBfmqL5ZRF+Z2+l2UC6Tp2nA1ErRYV8Ge63g==
X-Received: by 2002:a05:6000:184d:b0:20c:5a30:1e48 with SMTP id c13-20020a056000184d00b0020c5a301e48mr2989306wri.614.1652431776663;
        Fri, 13 May 2022 01:49:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id j10-20020a05600c42ca00b003942a244ec9sm2073846wme.14.2022.05.13.01.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 01:49:36 -0700 (PDT)
Message-ID: <13fa1d59-7750-a327-c100-a53823509017@smile.fr>
Date:   Fri, 13 May 2022 10:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Content-Language: en-US
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        tony@atomide.com
Cc:     robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
References: <20211221131757.2030-1-rogerq@kernel.org>
 <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
 <5d8ba4e2-a281-5d0f-d65f-bb0121165b73@ti.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <5d8ba4e2-a281-5d0f-d65f-bb0121165b73@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Le 15/04/2022 à 15:06, Grygorii Strashko a écrit :
> 
> 
> On 15/04/2022 11:59, Romain Naour wrote:
>> Hello,
>>
>> Le 21/12/2021 à 14:17, Roger Quadros a écrit :
>>> Hi,
>>>
>>> TI's AM64 SoC contains one GPMC module. Add driver support for it.
>>
>> What's the status of the GPMC interface on K3 architecture, especially for AM65,
>> AM62 and other Jacinto 7 CPU devices ?
>>
>> TI currently don't recommend to use it for now even if there are still some GPMC
>> use case with FPGA devices:
>>
>> https://e2e.ti.com/support/processors-group/processors/f/processors-forum/994191/am6442-am64x-gpmc-support
>>
>>
>> This patch series add omap-gpmc support for AM64 Soc but as of kernel 5.18-rc2,
>> there is no devicetree using ti,am64-gpmc.
>>
>> This patch seems missing (at least):
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=55c102a75d399896c7396229cd687bf97afb5cf6
>>
> 
> It's not how LKML development process works - driver changes has to be sent first
> and then DT changes  as they accepted by different maintainers and through
> different trees.

Ok, I understand.

DT changes are still under review [1] and are not yet merged in 5.18-rc6.

Sorry for the noise.

[1] https://lkml.org/lkml/2022/2/4/320

Best regards,
Romain


> 
>>
>> Thanks!
>>
>> Best regards,
>> Romain
>>
>>>
>>> cheers,
>>> -roger
>>>
>>> Changelog:
>>> v4
>>> - move compatible match table to header file so it can be used by
>>> GPMC driver even when NAND driver is not enabled or as a module.
>>> GPMC driver is always enabled as built-in.
>>> - Select OMAP_GPMC driver from MTD_NAND_OMAP2 driver config as
>>> OMAP_GPMC is not essential for ARCH_K3 boot.
>>>
>>> v3
>>> - use compatible match table for checking for NAND controller node in
>>> GPMC driver.
>>>
>>> v2
>>> - update DT binding doc to make reg-names and power-domains property
>>> required only for specific SoC.
>>>
>>> Roger Quadros (4):
>>>    dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
>>>    memory: omap-gpmc: Add support for GPMC on AM64 SoC
>>>    memory: omap-gpmc: Use a compatible match table when checking for NAND
>>>      controller
>>>    mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3
>>>
>>>   .../bindings/memory-controllers/ti,gpmc.yaml  | 23 +++++++++-
>>>   drivers/memory/omap-gpmc.c                    | 46 ++++++++++++++-----
>>>   drivers/mtd/nand/raw/Kconfig                  |  1 +
>>>   drivers/mtd/nand/raw/omap2.c                  |  5 +-
>>>   include/linux/platform_data/mtd-nand-omap2.h  |  9 +++-
>>>   5 files changed, 67 insertions(+), 17 deletions(-)
>>>
>>
> 

