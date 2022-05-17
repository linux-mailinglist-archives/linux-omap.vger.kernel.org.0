Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA41C529B6E
	for <lists+linux-omap@lfdr.de>; Tue, 17 May 2022 09:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiEQHvZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 May 2022 03:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242061AbiEQHvK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 May 2022 03:51:10 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D4E15A0C
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 00:51:09 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24H7p0Fk015939;
        Tue, 17 May 2022 02:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1652773860;
        bh=IRrmIL+/XB8fp4on2gmrrH+3gkxPnF0bh7QzKs6IGJ8=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=xv/Pys7Up9a5hr7s6RoLGTZf3Mpi3VH1Etd2HDphRPDPMXUGWrPUW4FgJczXbKMSb
         dsJ+PWzmcS65c4dLF8m7VejGHEa00LByp0LZtqe7aa+kR2yhjHmgkAVlthgnDRmo9S
         T7clfGMIxW0NwjHXE7ssPmTcjNNbKMjXaxI9m5uQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24H7p0H8048154
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 May 2022 02:51:00 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 17
 May 2022 02:50:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 17 May 2022 02:50:59 -0500
Received: from [10.250.235.235] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24H7ouqJ126006;
        Tue, 17 May 2022 02:50:57 -0500
Message-ID: <bf74c267-6505-19af-015b-280323f51236@ti.com>
Date:   Tue, 17 May 2022 13:20:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am625-sk: enable ramoops
Content-Language: en-US
To:     Guillaume LA ROQUE <glaroque@baylibre.com>,
        Nishanth Menon <nm@ti.com>
CC:     <linux-omap@vger.kernel.org>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <khilman@baylibre.com>
References: <20220516145408.1000678-1-glaroque@baylibre.com>
 <20220516164853.nai7xbmclvvkywf5@party>
 <86a9798a-5fe6-7705-ed4e-6f5e798c7994@baylibre.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <86a9798a-5fe6-7705-ed4e-6f5e798c7994@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 16/05/22 11:06 pm, Guillaume LA ROQUE wrote:
> Le 16/05/2022 à 18:48, Nishanth Menon a écrit :
>> On 16:54-20220516, Guillaume La Roque wrote:
>>> Enable ramoops features to easily debug some issues
>>>
>>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>>> ---
>>> Changes in v2:
>>> - Apply script create-mem_map.py  with args given by Nishanth Menon
>>> - Spelling fix
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
>>> b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
>>> index 0de4113ccd5d..dfb16c29a000 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
>>> @@ -36,6 +36,15 @@ reserved-memory {
>>>           #size-cells = <2>;
>>>           ranges;
>>>
>>> +        ramoops@0x9ca00000 {
>>> +            compatible = "ramoops";
>>> +            reg = <0x0 0xe0000000 0x0 0x00100000>;
>> I think you intended 0x9ca00000 here?
>>
>> Static checks should have caught this for you. please run them
>> prior to posting?
> sorry for that i forgot to run it and update line .
> 
> i will fix it .
> 
> sorry for noise...
> 

Also, convention in the file is to use 0x00 instead of 0x0. So,

		reg = <0x00 0x9ca00000 0x00 0x100000>;

>>> +            record-size = <0x8000>;
>>> +            console-size = <0x8000>;
>>> +            ftrace-size = <0x0>;
>>> +            pmsg-size = <0x8000>;
>>> +        };
>>> +
>>>           secure_tfa_ddr: tfa@9e780000 {
>>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>>               alignment = <0x1000>;
>>> -- 
>>> 2.25.1
>>>
> 
