Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481B2745E4C
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jul 2023 16:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjGCOPG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jul 2023 10:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjGCOPF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jul 2023 10:15:05 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC2AB3
        for <linux-omap@vger.kernel.org>; Mon,  3 Jul 2023 07:15:02 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-314313f127fso1967150f8f.1
        for <linux-omap@vger.kernel.org>; Mon, 03 Jul 2023 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688393700; x=1690985700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RyceS1YttDjM3IZjfYBUQgEmN60GSkIWDDnpTU52Yck=;
        b=QKqbyYWge/CzSIbqNJ7s43VhCzkCengong+Wjfjgl9eJ4pBd8Sa82RnUNOnt8G4Q4L
         WHUioevKysa0JpDczaPGkeCnpG5j/hV5g/d6prS3jJYOkVS/XlnC75zPY1/C6uK610y2
         oqXqZCInzR8u/Ry4cQY/x9VVC3z3IJOImkhE928K2g6TThzH/hv8ACt4wTj7XjahAj+p
         aDbdPIAgv+0xRXFHVbpf1RTuJcEF/TAZyAERHwoaboFgNOyBK4tgn+A+CwvYDDEyfd9+
         oZ6poyQnRxQwGRX29VRXXQ3QB2UMe33E0LLKmCBQywXE5dfipcpbQh/nkZiIZK1kDaXR
         OJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688393700; x=1690985700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyceS1YttDjM3IZjfYBUQgEmN60GSkIWDDnpTU52Yck=;
        b=eBMlk9ITwNxA4WsJsbtQo28LKf93aLZ0zcuoFipUrBaNhi6MBZ4YzB9o43/LXStvzZ
         XE+FWdmYsWMMOFGUk/zAUngmPmwOZDVPqpvVGgbhO2zTfUkfPo29mQJH0Tb6QLnkHPgO
         AShr+m3XRPp+GWyTOChxt4iDjUQz3TrxPpg3VPRIdU4mOxgIgG/tOPBF2T8/o/xBA+4Z
         X8rZCFhtQ/tE/Jlpf4KI5406eCL0va1ryN1CEKwYpS23ZV4P7OiR1gPZT3BUj9/R+vvK
         DLmJF2NrV272/mm46A1sKBMNJJFPAGD+w/X6/kXnckK8TSIB2frzbgVNCUbmdNL9/oEu
         fNCQ==
X-Gm-Message-State: ABy/qLZsrGoTW3HcRJX62yfXmR2KH1wb8AeS25FzGnbJeaY0ga9LIOL2
        KPpusGU7I2XKOGXpziXdmT+OfTAdvXMYrsGM2Fg=
X-Google-Smtp-Source: APBJJlHR/lQXKb6swTRqOGJbAoI77k/2SH5OHhhofvZIsZ88I3xNCyf+POaBLaEtPZoJnq8it1mksA==
X-Received: by 2002:adf:e6cc:0:b0:30a:e9cb:1a2e with SMTP id y12-20020adfe6cc000000b0030ae9cb1a2emr7648315wrm.65.1688393700421;
        Mon, 03 Jul 2023 07:15:00 -0700 (PDT)
Received: from [192.168.35.121] ([77.205.22.13])
        by smtp.gmail.com with ESMTPSA id z11-20020adfe54b000000b0031128382ed0sm6661539wrm.83.2023.07.03.07.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:14:59 -0700 (PDT)
Message-ID: <6a51d860-2d20-6c35-3935-985d5b41853e@baylibre.com>
Date:   Mon, 3 Jul 2023 16:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] Configure usb0 as peripheral on am335x boards
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vigneshr@ti.com, nm@ti.com, Tom Rini <trini@konsulko.com>
References: <20230629-usb0-as-peripheral-v1-0-167f78a11746@baylibre.com>
 <20230630072047.GK14287@atomide.com>
 <f4fa80fd-1a6a-4718-0287-f5288cd9d912@baylibre.com>
 <7f44798b-e2bf-1620-da37-ca13bfd07a21@kernel.org>
 <babf5f20-ddf4-74bf-1788-f8e356acaa92@baylibre.com>
 <9ef45899-c766-e839-522a-3b048f8106f7@kernel.org>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <9ef45899-c766-e839-522a-3b048f8106f7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/3/23 15:44, Roger Quadros wrote:
>
> On 03/07/2023 14:56, Julien Panis wrote:
>> On 6/30/23 21:40, Roger Quadros wrote:
>>> Hi,
>>>
>>> On 30/06/2023 11:30, Julien Panis wrote:
>>>> Hello Tony,
>>>>
>>>> On 6/30/23 09:20, Tony Lindgren wrote:
>>>>> Hi,
>>>>>
>>>>> * Julien Panis <jpanis@baylibre.com> [230629 13:10]:
>>>>>> This series configures usb0 dr_mode as 'peripheral' for am335x-evm,
>>>>>> am335x-evmsk, and am335x-icev2. This USB port is mainly used for
>>>>>> RNDIS and DFU.
>>>>> Is this a mini-B connector? Just wondering if it was originally attempted
>>>>> to be configured as OTG or how it ended up with a host configuration..
>>>> It's a micro USB-AB connector.
>>>> I don't know how it ended up with a host configuration, it looks like an oversight.
>>>> Maybe Vignesh or Nishanth can confirm (?)
>>> usb0 role should be "otg".
>>> It is rightly so in Linux DT. am33xx.dtsi contains "otg" and all AM335x board files inherit from it.
>>>
>>> So I don't think setting it to "peripheral" in u-boot is the right thing to do.
>> This series is for kernel (not for u-boot).
>> Why is it a problem to set usb0 as 'peripheral' in kernel for the 3 board dts ?
>>
>> With usb0 not set as 'peripheral', the 3 boards (am335x-evm, evm-sk, icev2)
>> do not boot with uboot 2023.04. This error is returned, with LOG_LEVEL=5:
>>      No USB device found
>>      USB ether init failed
>>      initcall sequence 8ffdbba4 failed at call 808024d9 (err=-19)
>>      ### ERROR ### Please RESET the board ###
>> This error is also returned with usb0 as 'otg'.
> This error is at u-boot correct? This will need further investigation.
>
> Does it function correctly in Linux when kept as 'otg'?
>

This error is at u-boot level, indeed. I add Tom Rini to this thread, since he
was involved in the discussion here:
https://lore.kernel.org/all/20230621-fix_usb_ether_init-v2-0-ff121f0e8d7a@baylibre.com/
If dr_mode is set as 'peripheral' in '<board>-u-boot.dtsi' and kept as 'otg'
in linux, it functions correctly in linux.
