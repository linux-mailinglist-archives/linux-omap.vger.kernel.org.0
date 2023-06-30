Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A64D743732
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jun 2023 10:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbjF3IbE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Jun 2023 04:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbjF3Iay (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Jun 2023 04:30:54 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3933588
        for <linux-omap@vger.kernel.org>; Fri, 30 Jun 2023 01:30:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-992b2249d82so165713066b.1
        for <linux-omap@vger.kernel.org>; Fri, 30 Jun 2023 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688113850; x=1690705850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/3vNAtGem+SW3NEw8TxWc36bYxPo7w7vyt7ieHf+us=;
        b=X9CYKpAwj2I4bs/RrW9wetKKNYxVSjpGHS8N5x8UXnynSXk6ZoJ/U+4zVtXpGWT52P
         ZHmbmhW0HJ898oAw7jB2Bu1G7X+s4Mwn1v8197pmj+jT+M76DTpylqcaW+bEbZq2sqt3
         wyZeXDMF7lCF95g/TG4uMmjnIE4PQ1OrBQOu8allSpgxlIo4MJsjn/gjWnx8nhxVCl/j
         o6GD8Cih0hFF25gKsiH3hLt1K0yBkbKSKvfRHTRBpHM9Ano88KR8IyUSjxGuMb0e4s6O
         aeh8ZYFs9pKAKU65QjG4EdGvvZTOwVRc5ZAgBS7yw8Vl8gDps/ZNb/hl3EwvqyLu6iXF
         JIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113850; x=1690705850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/3vNAtGem+SW3NEw8TxWc36bYxPo7w7vyt7ieHf+us=;
        b=RuLi0YBMnI4EonzP9oQCwoCkmQzGzT0+fuowibvu5MGSZMzh0fS260+U1SXmyIZpTg
         gQkaXFejuh4059FNeUngQa3Y7mNaAclN6wFzH+RV/Olaue2KaHvaJG5VMgGiBRBbupSK
         P3sleRlsUgbjJqnoHIQTIqQOdpP0fxflrQd2yX4U+XSMLEhV7/Ghpd6aoYX8e1SBsaDD
         fFd1KzWUYt+YhbjjgS8ge6fEKOJm/cAnY4TTKeNh2yS/EwWT8HEnG2wq8W9ACAtqPIYP
         O0cZQuNK4FatLiQKcgBA0VOViLvhpCc0kBUsCmcPrat3/nQM9X+PX07mPbfkMM5aazWa
         6XTA==
X-Gm-Message-State: ABy/qLYvz8LV+HSVyyhmmKCeoikyRUL5o8tZtHdQbnatp3ez2iVfCEzO
        AwYM/tHyTKFAFPiMTnXC8RGHlw==
X-Google-Smtp-Source: APBJJlFFB5PMDVNJBdfV0DaRNYSfGCkqYb/oBQBBfPmg03KNna48yepwGE4Ai7ntJUnKvIlRSmWGqQ==
X-Received: by 2002:a17:906:4a91:b0:991:d2a8:658a with SMTP id x17-20020a1709064a9100b00991d2a8658amr1588541eju.34.1688113850590;
        Fri, 30 Jun 2023 01:30:50 -0700 (PDT)
Received: from [192.168.147.121] ([77.205.21.63])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906a38700b00985ed2f1584sm7680503ejz.187.2023.06.30.01.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:30:50 -0700 (PDT)
Message-ID: <f4fa80fd-1a6a-4718-0287-f5288cd9d912@baylibre.com>
Date:   Fri, 30 Jun 2023 10:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] Configure usb0 as peripheral on am335x boards
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vigneshr@ti.com, nm@ti.com
References: <20230629-usb0-as-peripheral-v1-0-167f78a11746@baylibre.com>
 <20230630072047.GK14287@atomide.com>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20230630072047.GK14287@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Tony,

On 6/30/23 09:20, Tony Lindgren wrote:
> Hi,
>
> * Julien Panis <jpanis@baylibre.com> [230629 13:10]:
>> This series configures usb0 dr_mode as 'peripheral' for am335x-evm,
>> am335x-evmsk, and am335x-icev2. This USB port is mainly used for
>> RNDIS and DFU.
> Is this a mini-B connector? Just wondering if it was originally attempted
> to be configured as OTG or how it ended up with a host configuration..

It's a micro USB-AB connector.
I don't know how it ended up with a host configuration, it looks like an oversight.
Maybe Vignesh or Nishanth can confirm (?)

>
>> Initially, a series was submitted to overlay dr_mode in u-boot specific
>> device trees ('<board>-u-boot.dtsi'):
>> https://lore.kernel.org/all/20230621-fix_usb_ether_init-v2-0-ff121f0e8d7a@baylibre.com/
>>
>> It was finally decided to modify linux device trees.
> Do we need these as fixes? If so is there a fixes tag for these?

I don't think so.
The u-boot series mentioned above was submitted to fix an error returned
by usb_ether_init() function. This error appeared after changes in u-boot
(arch/arm/mach-omap2/am33xx/board.c). The u-boot commit is:
6815a66ad7430 ("am33xx: musb: Remove unused configuration logic").
But this commit is right actually, and the error appeared because dr_mode
was not properly configured for am335x-evmsk and am335x-icev2 dts.
In other words, this u-boot commit is correct but revealed an oversight
in dr_mode configuration for these boards.
So, there is not a fixes tag here. That was just an omission in device trees.

>
> Regards,
>
> Tony

Julien
